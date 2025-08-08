cwlVersion: v1.2
class: CommandLineTool
label: "geo API - Processes"
baseCommand: cat

requirements:
  - class: InlineJavascriptRequirement
  - class: SchemaDefRequirement
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/experimental/api-endpoint.yaml
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/experimental/process.yaml
  - class: InitialWorkDirRequirement
    listing:
      - entryname: inputs.yaml
        entry: |-
          $(inputs.api_endpoint.url.value)
          ---
          $(inputs.execute_request.process_id)
          ---
          $(inputs.execute_request.inputs)
inputs:
  api_endpoint:
    type: https://raw.githubusercontent.com/eoap/schemas/main/experimental/api-endpoint.yaml#APIEndpoint
    label: "OGC API endpoint"
    doc: "OGC API endpoint for Landsat-9 data"
  execute_request:
    type: https://raw.githubusercontent.com/eoap/schemas/main/experimental/process.yaml#OGCExecuteProcessSettings 
    label: "OGC API Processes settings"
    doc: "OGC API Processes settings for Landsat-9 data"

arguments:
- inputs.yaml

outputs:
  echo_output:
    type: stdout

stdout: process-output.yaml
