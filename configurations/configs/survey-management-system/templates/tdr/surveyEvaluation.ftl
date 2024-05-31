"survey-management-system.id":"${(response.surveyEvaluatedInfoWithAnswers.id)!'N/A'}",
"survey-management-system.surveyId":"${(response.surveyEvaluatedInfoWithAnswers.surveyId)!'N/A'}",
"survey-management-system.surveyName":"${(response.surveyEvaluatedInfoWithAnswers.surveyName)!'N/A'}",
"survey-management-system.surveyType":"${(response.surveyEvaluatedInfoWithAnswers.surveyType)!'N/A'}",
"survey-management-system.surveyTripId":"${(response.surveyEvaluatedInfoWithAnswers.tripId)!'N/A'}",
"survey-management-system.status":"${(response.surveyEvaluatedInfoWithAnswers.status)!'N/A'}",
"survey-management-system.submittedOn":"${(response.surveyEvaluatedInfoWithAnswers.submittedOn)!'N/A'}",
"survey-management-system.updatedOn":"${(response.surveyEvaluatedInfoWithAnswers.updatedOn)!'N/A'}",
"survey-management-system.surveyor":"${(response.surveyEvaluatedInfoWithAnswers.surveyor)!'N/A'}",
"survey-management-system.surveyee":"${(response.surveyEvaluatedInfoWithAnswers.surveyee)!'N/A'}",
"survey-management-system.maxScore":"${(response.surveyEvaluatedInfoWithAnswers.maxScore)!'N/A'}",
"survey-management-system.surveyScore":"${(response.surveyEvaluatedInfoWithAnswers.surveyScore)!'N/A'}",
<#if response?? && response.surveyEvaluatedInfoWithAnswers?? && response.surveyEvaluatedInfoWithAnswers.categoryScore??>
"survey-management-system.categoryScore" : {
        <#list response.surveyEvaluatedInfoWithAnswers.categoryScore?keys as score>
                "${score}" : "${response.surveyEvaluatedInfoWithAnswers.categoryScore[score]}"<#if (score_has_next)>,</#if>
        </#list>
}
</#if>

