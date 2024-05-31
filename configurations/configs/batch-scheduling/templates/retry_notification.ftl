{
<#compress>
<#list request.requestObjectsList as notification>
    "notification": {
        "eventTag": "GENERIC_ALERT",
<#switch notification["notificationmanager.notificationMessage.notificationType"]>
  <#case "SMS">
        "smsTemplateName": "${notification["notificationmanager.notificationMessage.templateName"]}",
        "msisdn": "${notification["notificationmanager.notificationMessage.recipientId"]}",
    <#break>
  <#case "EMAIL">
        "emailTemplateName": "${notification["notificationmanager.notificationMessage.templateName"]}",
        "email": "${notification["notificationmanager.notificationMessage.recipientId"]}",
    <#break>
</#switch>
        "data": {
<#list notification?keys?filter(k -> k?starts_with("notificationmanager.notificationMessage.data.")) as key>
            "${key?remove_beginning("notificationmanager.notificationMessage.data.")}": "${notification[key]}"<#sep>,
</#list>
        }
    }
</#list>
</#compress>
}