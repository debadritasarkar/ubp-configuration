"ersReference": "${response.ersReference!""}",
"originalErsReference": "${response.originalErsReference!""}",
"referredErsReference": "${response.referredTransactionErsReference!""}",
"transactionProfile": "${response.transactionProfile!""}",
"transactionType": "${response.transactionType!""}",
"endTime": "${response.endTime?string("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")}",
"transactionAmount": "${response.transactionAmount!""}",
"isTransactionReversible": "${response.transactionReversible?c}",
"receiverMSISDN": "${response.receiverMSISDN!""}",
<#if response.receiverResellerId?? && response.receiverResellerId!="">
"receiverResellerId": "${response.receiverResellerId!""}",
<#else>
"receiverResellerId": "NA",
</#if>
"receiverRegionId": "${response.receiverRegionId!""}",
"receiverBalanceValueBefore": "${response.receiverBalanceValueBefore!""}",
"receiverBalanceValueAfter": "${response.receiverBalanceValueAfter!""}",
"receiverCommission": "${response.receiverCommission!""}",
"receiverAccountType": "${response.receiverAccountType!""}",
"receiverBonusAmount": "${response.receiverBonusAmount!""}",
<#if response.receiverResellerName?? && response.receiverResellerName!="">
"receiverResellerName": "${response.receiverResellerName!""}",
<#else>
"receiverResellerName": "NA",
</#if>
<#if response.receiverResellerType?? && response.receiverResellerType!="">
"receiverResellerType": "${response.receiverResellerType!""}",
<#else>
"receiverResellerType": "NA",
</#if>

"senderMSISDN": "${response.senderMSISDN!""}",
"senderResellerId": "${response.senderResellerId!""}",
"senderResellerType": "${response.senderResellerType!""}",
"senderResellerPath": "${response.senderResellerPath!""}",
"senderResellerJuridicalName": "${response.senderResellerJuridicalName!""}",
"senderRegionId": "${response.senderRegionId!"NO_REGION"}",
"senderBalanceValueBefore": "${response.senderBalanceValueBefore!""}",
"senderBalanceValueAfter": "${response.senderBalanceValueAfter!""}",
"senderCommission": "${response.senderCommission!""}",
"senderBonusAmount": "${response.senderBonusAmount!""}",
"senderAccountType": "${response.senderAccountType!""}",
"senderResellerName": "${response.senderResellerName!""}",
"externalSystemReference": "${response.externalSystemReference!""}",
"supplierReference": "${response.supplierReference!""}",
"productName": "${response.productName!""}",
"productSKU": "${response.productSKU!""}",
"currency": "${response.currency!""}",
"groupId": "${response.groupId!""}",
"merchantId": "${response.merchantId!""}",
"batchId": "null",
"timeTaken": "${response.timeTaken!""}",
"startTime": "${response.startTime?string("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")}",
<#if response.resultStatus == "SUCCESS">
"transactionStatus": "Success",
<#elseif response.resultStatus == "PENDING">
"transactionStatus": "Pending",
<#else>
"transactionStatus": "Failed",
</#if>
"transactionProps": "${response.transactionProps!""}"