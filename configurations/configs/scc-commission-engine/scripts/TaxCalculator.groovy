//Groovy script for TaxCalculation

import groovy.util.logging.Slf4j
import org.springframework.stereotype.Component
import se.seamless.scc.model.request.TaxCommissionRequest
import se.seamless.scc.model.response.ResultCode
import se.seamless.scc.model.response.TaxCommissionResponse
import se.seamless.scc.service.TaxCalculationService

@Slf4j
@Component
class TaxCalculator implements TaxCalculationService {

    static final def GST_RATE = "gstRate"; //Provincial Sales Tax on Services (GST)
    static final def GST_RATE_WHT = "gstRateWht"; //GST Withholding
    static final def RATE_WHT = "rateWht"; //Income Tax Withholding
    static final def TAX_EXEMPTED  = "taxExempted";

    @Override
    TaxCommissionResponse taxCalculation(TaxCommissionRequest taxCommissionRequest, List<String> excludeResellerTypesForTaxCalculation) {

        log.info("In TaxCalculator groovy file with request : \n" + taxCommissionRequest + END_OF_LINE);
        TaxCommissionResponse taxCommissionResponse = new TaxCommissionResponse();
        Double invoiceAmount = taxCommissionRequest.getInvoiceValue();
        log.info("Invoice amount : " + invoiceAmount + " as deduced by TaxCalculator");
        taxCommissionResponse.setResultCode(ResultCode.SUCCESS.getResultCode())
        taxCommissionResponse.setResultDescription(ResultCode.SUCCESS.name())
        Map<String, Object> extraFields = new HashMap<>();
        if(taxCommissionRequest.getExtraFields() != null) {
            extraFields = taxCommissionRequest.getExtraFields();
        }
        else {
            log.info("TaxCommissionRequest extra fields is null")
            taxCommissionResponse.setTaxAmount(0);
            taxCommissionResponse.setNetPayoutAmount(invoiceAmount);
            return taxCommissionResponse;
        }

        String resellerType = taxCommissionRequest.getExtraFields().getOrDefault("resellerType", "")
        log.info("Reseller type : " + resellerType);
        for(String excludeResellerType: excludeResellerTypesForTaxCalculation) {
            if(excludeResellerType.equalsIgnoreCase(resellerType)) {
                log.info("Tax calculation is excluded for reseller type: " + excludeResellerType);
                taxCommissionResponse.setTaxAmount(0);
                taxCommissionResponse.setNetPayoutAmount(invoiceAmount);
                taxCommissionResponse.setExtraFields(extraFields);
                return taxCommissionResponse;
            }
        }

        String gstRate = taxCommissionRequest.getExtraFields().getOrDefault(GST_RATE, "0")
        gstRate = gstRate != null ? gstRate : "0"
        boolean isGstRateNumeric = gstRate.matches("-?\\d+(\\.?\\d+)?");
        if (!isGstRateNumeric)
            gstRate = "0";
        String gstRateWht = taxCommissionRequest.getExtraFields().getOrDefault(GST_RATE_WHT, "0")
        gstRateWht = gstRateWht != null ? gstRateWht : "0"
        boolean isGstRateWhtNumeric = (gstRateWht != null ? gstRateWht : "0.0").matches("-?\\d+(\\.?\\d+)?");
        if (!isGstRateWhtNumeric)
            gstRateWht = "0";

        String rateWht = taxCommissionRequest.getExtraFields().getOrDefault(RATE_WHT, "0")
        rateWht = rateWht != null ? rateWht : "0"
        boolean isRateWhtNumeric = (rateWht != null ? rateWht : "0.0").matches("-?\\d+(\\.?\\d+)?");
        if (!isRateWhtNumeric)
            rateWht = "0";

        Double gstAmount = 0, taxableAmount = 0, rateWhtAmount = 0, gstWhtRateAmount = 0;

        log.info("gstRate: " + gstRate + ", gstRateWht: " + gstRateWht + ", rateWht: " + rateWht)
        String isTaxExempted = taxCommissionRequest.getExtraFields().getOrDefault(TAX_EXEMPTED, "")
        log.info("Has tax been exempted for the current campaign : " + isTaxExempted );
        String kpiTaxExemptedList = taxCommissionRequest.getExtraFields().getOrDefault("kpiTaxExemptedList", "")
        if (isTaxExempted == null || isTaxExempted == "" || !isTaxExempted.equalsIgnoreCase("YES")) {
            log.info("No tax exemption to reseller");
            log.info("Tax exempted list: " + kpiTaxExemptedList);
            if (kpiTaxExemptedList!= null && kpiTaxExemptedList.size() > 0) {
                List<String> taxExemptedList = Arrays.asList(kpiTaxExemptedList.split(','));
                for (String taxExemptedName : taxExemptedList) {
                    if (taxExemptedName.equalsIgnoreCase(GST_RATE)) {
                        log.info("Tax exempted for type: " + taxExemptedName + END_OF_LINE)
                        gstRate = "0";
                    } else if (taxExemptedName.equalsIgnoreCase(GST_RATE_WHT)) {
                        log.info("Tax exempted for type: " + taxExemptedName + END_OF_LINE)
                        gstRateWht = "0";
                    } else if (taxExemptedName.equalsIgnoreCase(RATE_WHT)) {
                        log.info("Tax exempted for type: " + taxExemptedName + END_OF_LINE)
                        rateWht = "0";
                    } else {
                        log.info("No tax type exists of name: " + taxExemptedName + END_OF_LINE)
                    }
                }
            }

            gstAmount = invoiceAmount * ((gstRate as double) / 100);
            taxableAmount = invoiceAmount + gstAmount
            rateWhtAmount = taxableAmount * ((rateWht as double) / 100);
            gstWhtRateAmount = invoiceAmount * ((gstRateWht as double) / 100);
            log.info("The following calculations are stated below : " + NEW_LINE_WITH_SPACE +
                    "1) gstAmount : " + gstAmount + END_OF_LINE_NEW_LINE_WITH_SPACE +
                    "2) taxableAmount : " + taxableAmount + END_OF_LINE_NEW_LINE_WITH_SPACE +
                    "3) rateWhtAmount : " + rateWhtAmount + END_OF_LINE_NEW_LINE_WITH_SPACE +
                    "4) gstWhtRateAmount : " + gstWhtRateAmount + END_OF_LINE)
            double tax = gstAmount - rateWhtAmount - gstWhtRateAmount;
            double netPayoutAmount = invoiceAmount + tax;
            log.info("Calculated tax amount: " + tax + "  Calculated net payout amount: " + netPayoutAmount + END_OF_LINE)
            taxCommissionResponse.setTaxAmount(tax);
            taxCommissionResponse.setNetPayoutAmount(netPayoutAmount)
        } else {
            log.info("Tax Exemption for Reseller");
            log.info("Calculated tax amount: " + 0 + "  Calculated net payout amount: " + invoiceAmount + END_OF_LINE)
            taxCommissionResponse.setTaxAmount(0);
            taxCommissionResponse.setNetPayoutAmount(invoiceAmount);
        }
        log.info("Pushing all calculated data into extraFields.");
        extraFields.put("gstRate", gstRate);
        extraFields.put("gstRateWht", gstRateWht);
        extraFields.put("rateWht", rateWht);
        extraFields.put("gstAmount", gstAmount.toString());
        extraFields.put("taxableAmount", taxableAmount.toString());
        extraFields.put("rateWhtAmount", rateWhtAmount.toString());
        extraFields.put("gstWhtRateAmount", gstWhtRateAmount.toString());
        extraFields.put("taxExempted", isTaxExempted);
        extraFields.put("kpiTaxExemptedList", kpiTaxExemptedList);
        log.info("Extra fields data setup complete.");
        taxCommissionResponse.setExtraFields(extraFields);
        log.info("Returning response : \n" + taxCommissionResponse + "\n and exiting TaxCalculator. \n\n");
        return taxCommissionResponse;
    }

}
