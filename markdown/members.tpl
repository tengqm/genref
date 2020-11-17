{{ define "members" }}

  {{/* . is a apiType */}}
  {{- range .GetMembers -}}
    {{/* . is a apiMember */}}
    {{- if not .Hidden }}
<tr><td style="white-space: pre"><code>{{ .FieldName }}</code>
      {{- if not .IsOptional -}}
<span style="color:blue;">&ast;</span>
      {{- end -}}
</br>
{{/* Link for type reference */}}
      {{- with .GetType -}}
        {{- if .Link -}}
<a href="{{ .Link }}"><code>{{ .DisplayName }}</code></a>
        {{- else -}}
<code>{{ .DisplayName }}</code>
        {{- end -}}
      {{- end }}
</td>
<td>
      {{- if .IsInline -}}
(Members of <code>{{ .FieldName }}</code> are embedded into this type.)
      {{- end -}}
{{ .GetComment }}
      {{- if and (eq (.GetType.Name.Name) "ObjectMeta") -}}
Refer to the Kubernetes API documentation for the fields of the <code>metadata</code> field.
      {{- end -}}
      {{- if or (eq .FieldName "spec") -}}
   <table>
{{- template "members" .GetType -}}
   </table>
      {{- end -}}
</td>
</tr>
    {{ end }}
  {{ end }}
{{ end }}
