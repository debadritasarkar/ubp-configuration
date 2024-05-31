package se.seamless.scc.scripts

import com.fasterxml.jackson.databind.ObjectMapper
import groovy.util.logging.Slf4j
import org.elasticsearch.action.search.SearchResponse
import org.springframework.stereotype.Component
import se.seamless.scc.model.DataIngestionField
import se.seamless.scc.model.DataSourceIngestion
import se.seamless.scc.transformer.DataLoaderTransformer
import se.seamless.scc.util.IngestorUtil

import java.text.SimpleDateFormat

@Slf4j
@Component
public class SCCTxeParser extends DataLoaderTransformer
{

    @Override
    public Map<String, Object> parseData(String dataRow, String eventType)
    {
        try
        {
            //Prepare dataMap
            DataSourceIngestion dataSourceIngestion = liveDataIngestionConfig.getIngestionConfigByEventType(eventType);
            ObjectMapper mapper = new ObjectMapper();
            Map<String, Object> dataMap = mapper.readValue(dataRow, Map.class);
            dataMap.put("eventChannel", "ERS");

            //Validate records
            List<DataIngestionField> ingestionFieldList = dataSourceIngestion.getIngestionFields();

            //Validation Step 1 - Keep only whitelisted fields
            List<String> dataMapKeyList = new ArrayList<String>(dataMap.keySet());
            List<String> whiteListedKeyList = dataSourceIngestion.getWhitelistedTransactionFields();
            List<String> differences = new ArrayList<>(dataMapKeyList);
            differences.removeAll(whiteListedKeyList);
            for(String key : differences){
                dataMap.remove(key);
            }

            //Validation Step 2 - Validate field
            for (DataIngestionField field : ingestionFieldList){
                validateField(field,dataMap.get(field.getFieldName()).toString(),dataSourceIngestion);
            }

            //Change data formats
            dataMap = transformFields(dataMap,eventType);

            //Stitch DMS data
            if (dataSourceIngestion.getStitchResellerData()) {
                dataMap = stitchResellerData(dataMap, eventType);
            }

            return dataMap;
        }
        catch(Exception e)
        {
            log.error("Unexpected exception while parsing data ingestion request", e);
            throw e;
        }
    }

    @Override
    public Map<String, Object> stitchResellerData(Map<String, Object> dataMap, String eventType)
    {
        DataSourceIngestion dataSourceIngestion = liveDataIngestionConfig.getIngestionConfigByEventType(eventType);

        SearchResponse searchResponse = esUtil.getDocumentByResellerMsisdn(dataMap.get("senderMSISDN") as String);
        if(searchResponse != null && searchResponse.getHits().getTotalHits().value > 0)
        {

            log.info("Fetched resellerInfo: "+searchResponse.getHits().getAt(0).toString());

            Map<String, Object> dmsDataMap = searchResponse.getHits().getAt(0).getSourceAsMap();

            IngestorUtil.nestedToFlatMapRetainRoot(dataMap, dmsDataMap, "", dataSourceIngestion.getWhitelistedTransactionFields());
            log.info("Stitched Reseller Info and Transaction Data: "+dataMap.toString());
            dataMap.put("isDmsRecordFound", Boolean.TRUE)
        }
        else
        {
            log.debug("Reseller data not found for resellerId: "+dataMap.get("retailerId"));
        }
        return dataMap
    }

    @Override
    public boolean validationGrey(Map<String, Object> dataMap, String eventType)
    {
        return esUtil.getSubscriberByMSISD(dataMap.get("senderMSISDN") as String);
    }

    @Override
    public boolean indexDataToDestination(Map<String, Object> dataMap, String eventType, boolean isDmsRecordFound)
    {
        //document id i.e. transactionNumber
        StringBuilder calculationTransactionId = new StringBuilder();
        calculationTransactionId.append((String)dataMap.get("transactionNumber"));
        dataMap.put("calculationTransactionId", calculationTransactionId.toString())
        esUtil.save(dataMap, isDmsRecordFound);
        return true
    }

    @Override
    Map<String, Object> transformFields(Map<String, Object> dataMap, String eventType) {
        DataSourceIngestion dataSourceIngestion = liveDataIngestionConfig.getIngestionConfigByEventType(eventType);
        List<DataIngestionField> ingestionFieldList = dataSourceIngestion.getIngestionFields();
        for (DataIngestionField field : ingestionFieldList){
            if ("date".equalsIgnoreCase(field.getFieldType()))
            {
                SimpleDateFormat source = new SimpleDateFormat(field.getSourceDateFormat());
                SimpleDateFormat destination = new SimpleDateFormat(field.getDestinationDateFormat());
                String transformedValue = destination.format(source.parse(dataMap.get(field.getFieldName()) as String));
                dataMap.put(field.getFieldName(),transformedValue);
            }
        }
        return dataMap;
    }
}