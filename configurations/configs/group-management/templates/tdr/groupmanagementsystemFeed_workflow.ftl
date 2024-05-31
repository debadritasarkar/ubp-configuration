<#compress>
"groupmanagementsystem.resultcode": "${response.getResultCode()!400}",
"groupmanagementsystem.resultMessage": "${response.getResultMessage()!""}",
"groupmanagementsystem.ersReference": "${response.getErsReference()!""}"
 
<#if (response.workflow)?? && response.getWorkflow()??>,
 
   "groupmanagementsystem.id": "${response.getWorkflow().getId()!""}",
   "groupmanagementsystem.name": "${response.getWorkflow().getName()!""}",
   "groupmanagementsystem.description": "${response.getWorkflow().getDescription()!""}",
   "groupmanagementsystem.createdBy": "${response.getWorkflow().getCreatedBy()!""}",
   "groupmanagementsystem.createdDate": "${response.getWorkflow().getCreatedDate()!""}",
   "groupmanagementsystem.lastModifiedDate": "${response.getWorkflow().getLastModifiedDate()!""}",
   "groupmanagementsystem.validUntil": "${response.getWorkflow().getValidUntil()!""}",
   "groupmanagementsystem.isUpdatable": "${response.getWorkflow().getIsUpdatable()?c}",
   "groupmanagementsystem.isDeletable": "${response.getWorkflow().getIsDeletable()?c}"
    
   <#if response.getWorkflow().getGroups()??>,
   "groupmanagementsystem.groupsOrder": [
   <#list response.getWorkflow().getGroups() as groupOrder>
        {
        "groupmanagementsystem.id": "${groupOrder.getId()!""}",
        "groupmanagementsystem.workflowId": "${groupOrder.getWorkflowId()!""}",
        "groupmanagementsystem.workflowOrder": "${groupOrder.getWorkflowOrder()!""}",
        "groupmanagementsystem.group": {
                    "groupmanagementsystem.id": "${groupOrder.getGroup().getId()!""}",
                    "groupmanagementsystem.name": "${groupOrder.getGroup().getName()!""}",
                    "groupmanagementsystem.description": "${groupOrder.getGroup().getDescription()!""}"
                    }
        }
        <#sep>,
   </#list>
   ]
   </#if>
 
<#else>
 
</#if>
</#compress>
