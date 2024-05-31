"DMS": {
"resultCode": ${response.resultCode?string.computer!400},
"resultDescription": "${response.resultDescription!""}"
<#if response.resellerInfo??>,
    "resellerInfo": {
    <#if response.resellerInfo.resellerData??>
        "reseller": {
        "resellerId": "${(response.resellerInfo.resellerData.resellerId)!""}",
        "resellerName": "${(response.resellerInfo.resellerData.resellerName)!""}",
        "resellerJuridicalName": "${(response.resellerInfo.resellerData.resellerJuridicalName)!""}",
        "distributorId": "${(response.resellerInfo.resellerData.distributorId)!""}",
        "contractId": "${(response.resellerInfo.resellerData.contractId)!""}",
        "resellerMSISDN": "${(response.resellerInfo.resellerData.resellerMSISDN)!""}",
        "parentResellerId": "${(response.resellerInfo.resellerData.parentResellerId)!""}",
        "parentResellerName": "${(response.resellerInfo.resellerData.parentResellerName)!""}",
        "resellerPath": "${(response.resellerInfo.resellerData.resellerPath)!""}",
        "resellerTypeId": "${(response.resellerInfo.resellerData.resellerTypeId)!""}",
        "resellerTypeName": "${(response.resellerInfo.resellerData.resellerTypeName)!""}",
        "status": "${(response.resellerInfo.resellerData.status)!""}"
        <#if response.resellerInfo.resellerData.address??>,
            "address": {
            "street":"${response.resellerInfo.resellerData.address.street!""}",
            "zip":"${response.resellerInfo.resellerData.address.zip!""}",
            "city":"${response.resellerInfo.resellerData.address.city!""}",
            "country":"${response.resellerInfo.resellerData.address.country!""}",
            "email":"${response.resellerInfo.resellerData.address.email!""}"
            }
        </#if>
        }
    </#if>
    <#if response.resellerInfo.users??>,
        "users":[<#list response.resellerInfo.users as user>
        {
        "id":"${(user.userId)!'N/A'}",
        "roleName":"${(user.roleName)!'N/A'}",
        "roleId":"${(user.roleId)!'N/A'}",
        "roleStartDate":"${(user.fields.parameters.roleStartDate)!'N/A'}",
        "roleExpiryDate":"${(user.fields.parameters.roleExpiryDate)!'N/A'}"
        }
        <#sep>,
    </#list>]
    </#if>
    <#if response.resellerInfo.additionalFields??>,
        "additionalFields":[<#list response.resellerInfo.additionalFields as field>
        {
        "name":"${(field.name)!'N/A'}",
        "value":"${(field.value)!'N/A'}"
        }
        <#sep>,
    </#list>]
    </#if>
    }
</#if>
}