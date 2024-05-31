{
<#compress>
    "notification": {
        "eventTag": "GENERIC_ALERT",
<#switch request.notificationData.getChannel()>
  <#case "SMS">
        "smsTemplateName": "${request.notificationData.getTemplateName()}",
        "msisdn": "<#list request.requestObjectsList as recipientList>${recipientList.recipient}<#sep>;</#list>",
    <#break>
  <#case "EMAIL">
        "emailTemplateName": "${request.notificationData.getTemplateName()}",
        "email": "<#list request.requestObjectsList as recipientList>${recipientList.recipient}<#sep>;</#list>",
    <#break>
</#switch>
        "data": {
<#if (request.notificationData.data)??>
  <#list request.notificationData.getData()?keys as key>
        "${key}": "${request.notificationData.getData()[key]}"<#sep>,
  </#list>
</#if>
        }
    }
</#compress>
}