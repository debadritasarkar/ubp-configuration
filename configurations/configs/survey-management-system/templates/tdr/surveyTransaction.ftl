"survey-management-system.id":"${(response.survey.id)!'N/A'}",
"survey-management-system.surveyName":"${(response.survey.surveyName)!'N/A'}",
<#if response?? && response.survey?? && response.survey.status??>
"survey-management-system.status":{
              "id" : "${response.survey.status.id}",
              "status" : "${response.survey.status.status}",
              "description" : "${response.survey.status.description}"
     },
</#if>
"survey-management-system.startTimestamp":"${(response.survey.startTimestamp)!'N/A'}",
"survey-management-system.endTimestamp":"${(response.survey.endTimestamp)!'N/A'}",
<#if response?? && response.survey?? && response.survey.surveyType??>
"survey-management-system.surveyType":{
              "id" : "${response.survey.surveyType.id}",
              "surveyTypeName" : "${response.survey.surveyType.surveyTypeName}",
              "createdOn" : "${response.survey.surveyType.createdOn}",
              "createdBy" : "${response.survey.surveyType.createdBy}",
              "inactive" : ${response.survey.surveyType.inactive?c}
             <#if response.survey.surveyType.surveyCategories ??>
             ,"surveyCategories" : [
             <#list response.survey.surveyType.surveyCategories as cat>
                             {"id" : "${cat.id}",
                             "surveyCategoryName" : "${cat.surveyCategoryName}"}
                             <#if (cat_has_next)>,</#if>
                     </#list>
             </#if>
     ]},
</#if>
"survey-management-system.templateId":"${(response.survey.templateId)!'N/A'}",
"survey-management-system.surveyeeTypeId":"${(response.survey.surveyeeTypeId)!'N/A'}",
"survey-management-system.surveyee":"${(response.survey.surveyee)!'N/A'}",
"survey-management-system.surveyorTypeId":"${(response.survey.surveyorTypeId)!'N/A'}",
"survey-management-system.surveyor":"${(response.survey.surveyor)!'N/A'}",
"survey-management-system.resellerAttribute":${(response.survey.resellerAttribute)!'N/A'},
"survey-management-system.createdOn":"${(response.survey.createdOn)!'N/A'}",
"survey-management-system.createdBy":"${(response.survey.createdBy)!'N/A'}",
"survey-management-system.updatedOn":"${(response.survey.updatedOn)!'N/A'}",
"survey-management-system.updatedBy":"${(response.survey.updatedBy)!'N/A'}",
"survey-management-system.version":"${(response.survey.version)!'N/A'}"