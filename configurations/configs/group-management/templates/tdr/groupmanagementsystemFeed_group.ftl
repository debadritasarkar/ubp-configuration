<#compress>
"groupmanagementsystem.resultcode": "${response.getResultCode()!400}",
"groupmanagementsystem.resultMessage": "${response.getResultMessage()!""}"
 
<#if (response.group)?? && response.getGroup()??>,
 
   "groupmanagementsystem.id": "${response.getGroup().getId()!""}",
   "groupmanagementsystem.name": "${response.getGroup().getName()!""}",
   "groupmanagementsystem.description": "${response.getGroup().getDescription()!""}",
   "groupmanagementsystem.status": "${response.getGroup().getStatus()!""}",
   "groupmanagementsystem.createdAt": "${response.getGroup().getCreatedAt()!""}",
   "groupmanagementsystem.updatedAt": "${response.getGroup().getUpdatedAt()!""}",
   "groupmanagementsystem.minimumMembers": "${response.getGroup().getMinimumMembers()!""}",
   "groupmanagementsystem.maximumMembers": "${response.getGroup().getMaximumMembers()!""}",
   "groupmanagementsystem.availableFrom": "${response.getGroup().getAvailableFrom()}",
   "groupmanagementsystem.availableUntil": "${response.getGroup().getAvailableUntil()}"
    
   <#if response.getGroup().getData()??>,
   "groupmanagementsystem.data": [
   <#list response.getGroup().getData() as data>
        {
        "groupmanagementsystem.dataName": "${data.getDataName()!""}",
        "groupmanagementsystem.dataValue": "${data.getDataValue()!""}"
        }
        <#if data_has_next>, </#if>
   </#list>
   ]
   </#if>
 
<#else>
 
</#if>
</#compress>
