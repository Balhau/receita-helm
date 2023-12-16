{{/*
Expand the name of the chart.
*/}}
{{- define "receita.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "receita.fullname" -}}
{{- if .Values.receipt.name }}
{{- .Values.receipt.name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "receita.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "receita.labels" -}}
helm.sh/chart: {{ include "receita.chart" . }}
{{ include "receita.selectorLabels" . }}
{{- if .Chart.AppVersion }}
master.chef.receipt/version: {{ .Chart.AppVersion | quote }}
{{- end }}
master.chef.receipt/managed-by: {{ .Values.chef }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "receita.selectorLabels" -}}
master.chef/name: {{ include "receita.name" . }}
master.chef/release: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "receita.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "receita.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
