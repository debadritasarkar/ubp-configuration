"commission.kpiUid" : <#if response.getKpiUid()??>"${response.getKpiUid()!'N/A'}"<#else>null</#if>,
"commission.kpiName": "${response.extraFields.kpiName!'N/A'}",
"commission.campaignUid" : <#if response.getCampaignUid()??>"${response.getCampaignUid()!'N/A'}"<#else>null</#if>,
"commission.resellerId" : <#if response.getResellerId()??>"${response.getResellerId()!'N/A'}"<#else>null</#if>,
"commission.createdDate" : <#if response.getCreatedDate()??>"${response.getCreatedDate()!'N/A'}"<#else>null</#if>,
"commission.payoutType" : <#if response.getPayoutType()??>"${response.getPayoutType()!'N/A'}"<#else>null</#if>,
"commission.commissionAmount" : <#if response.getCommissionAmount()??>"${response.getCommissionAmount()!'N/A'}"<#else>null</#if>,
"commission.resellerName" : <#if response.getResellerName()??>"${response.getResellerName()!'N/A'}"<#else>null</#if>,
"commission.campaignName" : <#if response.getCampaignName()??>"${response.getCampaignName()!'N/A'}"<#else>null</#if>,
"commission.campaignType": "${response.extraFields.campaignType!'N/A'}",
"commission.email" : <#if response.getEmail()??>"${response.getEmail()!'N/A'}"<#else>null</#if>,
"commission.resellerType" : <#if response.getResellerType()??>"${response.getResellerType()!'N/A'}"<#else>null</#if>,
"commission.resellerStatus" : <#if response.getResellerStatus()??>"${response.getResellerStatus()!'N/A'}"<#else>null</#if>,
"commission.resellerParent" : <#if response.getResellerParent()??>"${response.getResellerParent()!'N/A'}"<#else>null</#if>,
"commission.calculationStatus" : <#if response.getCalculationStatus()??>"${response.getCalculationStatus()!'N/A'}"<#else>null</#if>,
"tax.taxAmount" : <#if response.getTaxAmount()??>"${response.getTaxAmount()!'N/A'}"<#else>null</#if>,
"tax.netPayoutAmount" : <#if response.getNetPayoutAmount()??>"${response.getNetPayoutAmount()!'N/A'}"<#else>null</#if>,"tax.RATE_WHT": "${response.extraFields.rateWht!'N/A'}",
"tax.GST_RATE": "${response.extraFields.gstRate!'N/A'}",
"tax.GST_RATE_WHT": "${response.extraFields.gstRateWht!'N/A'}",
"tax.GST_Amount": "${response.extraFields.gstAmount!'N/A'}",
"tax.Taxable_Amount": "${response.extraFields.taxableAmount!'N/A'}",
"tax.Rate_WHT_Amount": "${response.extraFields.rateWhtAmount!'N/A'}",
"tax.GST_WHT_Rate_Amount": "${response.extraFields.gstWhtRateAmount!'N/A'}",
"tax.taxExempted": "${response.extraFields.taxExempted!'N/A'}",
"tax.AGGRATE_RATE": "${response.extraFields.AGGRATE_RATE!'N/A'}",
"tax.calculationDate": "${response.extraFields.commissionCalculationDate!'N/A'}",
"tax.campaignStartDate": "${response.extraFields.campaignStartDate!'N/A'}",
"tax.campaignEndDate": "${response.extraFields.campaignEndDate!'N/A'}"