"uid" : "${(response.uid)!'N/A'}",


"name" : "${(response.profileInformation.name)!'N/A'}",
"description" : "${(response.profileInformation.description)!'N/A'}",
"campaign-type" : "${(response.profileInformation.campaignType.typeName)!'N/A'}",
"state" : "${(response.profileInformation.state.status)!'N/A'}",
"start-date" : "${(response.profileInformation.startDate)!'N/A'}",
"end-date" : "${(response.profileInformation.endDate)!'N/A'}",
"event-channels" : "${(response.profileInformation.eventChannels)!'N/A'}",
"design-workflow-id" : "${(response.profileInformation.designWorkflowId)!'N/A'}",
"design-workflow-name" : "${(response.profileInformation.designWorkflowName)!'N/A'}",
"tracker-uid" : "${(response.profileInformation.trackerUid)!'N/A'}",
"creator" : "${(response.profileInformation.creator)!'N/A'}",
"commission-type" : "${(response.profileInformation.commissionType.commissionType)!'N/A'}",
"slab-range-type" : "${(response.profileInformation.slabRangeType.name)!'N/A'}",
"slab-commission-type" : "${(response.profileInformation.slabCommissionType.name)!'N/A'}",
"is-sequential" : "${(response.profileInformation.isSequential)!'N/A'}",


"audience-type" : "${(response.targetAudience.campaignExtraParam.audienceType)!'N/A'}",
"target-audience-comment" : "${(response.targetAudience.campaignExtraParam.targetAudienceComment)!'N/A'}",
"target-audience-data-source" : "${(response.targetAudience.campaignExtraParam.targetAudienceDataSource.name())!'N/A'}",
"included-regions" : [
    <#list response.targetAudience.getRegions() as region>
        {
            "name" : "${(region.regionName)!'N/A'}"
        }
        <#if region_has_next>, </#if>
    </#list>
],
"included-retailer-types" : [
    <#list response.targetAudience.getRetailerTypes() as retailerType>
        {
            "retailer-type" : "${(retailerType)!'N/A'}"
        }
        <#if retailerType_has_next>, </#if>
    </#list>
],
"excluded-retailers" : [
    <#list response.targetAudience.getExcludedRetailers() as excludedRetailer>
        {
            "excluded-retailer" : "${(excludedRetailer)!'N/A'}"
        }
        <#if excludedRetailer_has_next>, </#if>
    </#list>
],
"included-extra-retailers" : [
    <#list response.targetAudience.getRetailerInclusions() as extraRetailer>
        {
            "retailer-id" : "${(excludedRetailer.retailerId)!'N/A'}",
            "retailer-msisdn" : "${(excludedRetailer.retailerMsisdn)!'N/A'}"
        }
        <#if extraRetailer_has_next>, </#if>
    </#list>
],


"commission-type" : "${(response.paymentInformation.campaignPaymentInformation.commissionType.commissionType)!'N/A'}",
"is-end-of-campaign" : "${(response.paymentInformation.campaignPaymentInformation.isEndOfCampaign)!'N/A'}",
"payment-frequency" : "${(response.paymentInformation.campaignPaymentInformation.paymentFrequency)!'N/A'}",
"payment-channel" : "${(response.paymentInformation.campaignPaymentInformation.paymentChannelType.paymentChannelName)!'N/A'}",
"payout-approval-required" : "${(response.paymentInformation.campaignPaymentInformation.payoutApproval)!'N/A'}",
"payout-workflow-id" : "${(response.paymentInformation.campaignPaymentInformation.payoutWorkflowId)!'N/A'}",
"payout-workflow-name" : "${(response.paymentInformation.campaignPaymentInformation.payoutWorkflowName)!'N/A'}",
"included-cost-centers" : [
    <#list response.paymentInformation.getIncludedCostCenters() as costCenter>
        {
            "id" : "${(costCenter.costCenter.costCenterId)!'N/A'}",
            "division" : "${(costCenter.costCenter.division)!'N/A'}",
            "name" : "${(costCenter.costCenter.costCenter)!'N/A'}"
        }
        <#if costCenter_has_next>, </#if>
    </#list>
],
"gl-code" : "${(response.paymentInformation.glCode)!'N/A'}",


"kpi-list" : [
   <#list response.businessRule.getKpis() as kpi>
        {
            "kpi-uid" : "${(kpi.uid)!'N/A'}",
            "kpi-name" : "${(kpi.name)!'N/A'}",
            "kpi-target-in-count" : "${(kpi.targetInCount)!'N/A'}",
            "kpi-number-of-days" : "${(kpi.numberOfDays)!'N/A'}",
            "kpi-is-tax-exempted" : "${(kpi.isTaxExempted)!'N/A'}",
            "kpi-exempted-tax" : "${(kpi.exemptedTax)!'N/A'}",
            "kpi-events" : [
                <#list kpi.getKpiEvents() as kpiEvent>
                    {
                        "kpi-event-uid" : "${(kpiEvent.uid)!'N/A'}",
                        "kpi-event-name" : "${(kpiEvent.transactionEvent)!'N/A'}",
                        "kpi-event-relation-with-previous-event" : "${(kpiEvent.previousEventRelation)!'N/A'}",
                        "kpi-event-days-between-previous-event" : "${(kpiEvent.daysBetweenPreviousEvent)!'N/A'}",
                        "kpi-event-criteria" : "${(kpiEvent.criteria)!'N/A'}",
                        "kpi-event-criteriaValue" : "${(kpiEvent.criteriaValue)!'N/A'}",
                        "kpi-event-minimumValue" : "${(kpiEvent.minimumValue)!'N/A'}",
                        "kpi-event-deadlineDays" : "${(kpiEvent.deadlineDays)!'N/A'}",
                        "kpi-event-sequence" : "${(kpiEvent.sequence)!'N/A'}"
                    }
                    <#if kpiEvent_has_next>, </#if>
                </#list>
            ]
        }
        <#if kpi_has_next>, </#if>
   </#list>
],


"commission-formula-uid" : "${(response.commissionFormula.campaignCommissionFormula.uid)!'N/A'}",
"commission-formula-criteria" : "${(response.commissionFormula.campaignCommissionFormula.commissionCriteria.commissionCriteria)!'N/A'}",
"commission-formula-definition-criteria" : "${(response.commissionFormula.campaignCommissionFormula.commissionDefinitionCriteria.commissionDefinitionCriteria)!'N/A'}",
"commission-formula-details" : [
    <#list response.commissionFormula.campaignCommissionFormula.getCommissionFormulaDetails() as cfd>
        {
            "kpi-uid" : "${(cfd.kpi.uid)!'N/A'}",
            "retailer-type-id" : "${(cfd.retailerTypeId)!'N/A'}",
            "for-additional-retailers" : "${(cfd.additionalRetailers?c)!'N/A'}",
            "commission-value" : "${(cfd.commissionValue)!'N/A'}",
            "weightage" : "${(cfd.weightage)!'N/A'}",
            "slab-order" : "${(cfd.slabOrder)!'N/A'}",
            "range-from" : "${(cfd.rangeFrom)!'N/A'}",
            "range-to" : "${(cfd.rangeTo)!'N/A'}"
        }
        <#if cfd_has_next>, </#if>
    </#list>
],


"notification-management" : [
    <#list response.notificationManagement.getCampaignNotificationManagement() as cnm>
        {
            "event" : "${(cnm.notificationEvent)!'N/A'}",
            "sms-template" : "${(cnm.smsTemplate)!'N/A'}",
            "email-template" : "${(cnm.emailTemplate)!'N/A'}",
            "sms-template-frequency" : "${(cnm.smsTemplateFrequency)!'N/A'}",
            "email-template-frequency" : "${(cnm.emailTemplateFrequency)!'N/A'}"
        }
        <#if cnm_has_next>, </#if>
    </#list>
]