{{- define "imagePullSecret" }}
{{- printf "{\"auths\": {\"%s\": {\"auth\": \"%s\"}}}" .Values.imageCredentials.registry (printf "%s:%s" .Values.imageCredentials.username .Values.imageCredentials.password | b64enc) | b64enc }}
{{- end }}


{{- define "masterNodes" }}
- ip: "10.10.2.244"
  hostnames:
  - "m1"
{{- end }}

{{- define "workerNodes" }}
- ip: "10.10.2.252"
  hostnames:
  - "w1"
- ip: "10.33.96.105"
  hostnames:
  - "w2"
{{- end }}

{{- define "nonK8Nodes" }}
- ip: "10.33.96.106"
  hostnames:
  - "db1"  
{{- end }}

{{- define "hostaliases" }}
hostAliases:
{{- template "masterNodes" . }}
{{- template "workerNodes" . }}
{{- template "nonK8Nodes" . }}
{{- end }}
