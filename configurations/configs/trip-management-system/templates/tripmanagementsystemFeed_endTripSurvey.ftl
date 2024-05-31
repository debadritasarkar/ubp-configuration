"tms.resultCode": "${response.getResultCode()!400}",
<#if response.getPosTripList()??>
"tms.posList": [
 <#list response.getPosTripList() as posDoc>{
	"tms.posId": "${posDoc.getPosId()!""}",
	"tms.status": "${posDoc.getStatus()!""}",
	<#if response.getCompletedTaskDetails()??>
	   "tms.taskList": [
	   <#list response.getCompletedTaskDetails() as task>
		{
			   "tms.taskType": "${task.getTaskType()!""}",
			   "tms.status": "${task.getStatus()!""}"
		}
		<#if task_has_next>, </#if>
	   </#list>
	   ]
	<#else>
	</#if>
	}
<#if posDoc_has_next>, </#if>
</#list>
]
<#else>
</#if>
<#if response.getAgentContext()??>
,"tms.agentDetail": {
    "tms.agentId": "${response.getAgentContext().getAgentId()!""}",
    "tms.parentAgentId": "${response.getAgentContext().getParentAgentId()!""}"
}
</#if>