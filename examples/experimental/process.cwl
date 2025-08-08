cwlVersion: v1.2
class: CommandLineTool
label: "geo API - Processes"
baseCommand: cat

requirements:
  - class: InlineJavascriptRequirement
  - class: SchemaDefRequirement
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/experimental/geo-api.yaml
  - class: InitialWorkDirRequirement
    listing:
      - entryname: inputs.yaml
        entry: |-
          $(inputs.ogc_processes)
          ---
          $(inputs.ogc_processes.api_endpoint.url.value)
          ---
          $(inputs.ogc_processes.execute_request.process_id)
          ---
          $(inputs.ogc_processes.execute_request.inputs)
inputs:
  ogc_processes:
    type: https://raw.githubusercontent.com/eoap/schemas/main/experimental/geo-api.yaml#OCGProcesses 
    label: "OGC API Processes settings"
    doc: "OGC API Processes settings for Landsat-9 data"


arguments:
- inputs.yaml

outputs:
  echo_output:
    type: stdout

stdout: process-output.yaml
