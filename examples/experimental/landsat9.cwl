cwlVersion: v1.2
class: CommandLineTool
label: "Echo Landsat-9 inputs"
baseCommand: echo

requirements:
  - class: InlineJavascriptRequirement
  - class: SchemaDefRequirement
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/experimental/landsat9_inputs.yaml

inputs:
  stac_api_search_request:
    type: https://raw.githubusercontent.com/eoap/schemas/main/experimental/landsat9_inputs.yaml#STACSearchSettings
    label: "STAC API search request"
    doc: "STAC API search request"
  ogc_api_processes_execute_request:
    type: https://raw.githubusercontent.com/eoap/schemas/main/experimental/landsat9_inputs.yaml#OGCProcessSettings
    label: "OGC API Processes Execute request"
    doc: "OGC API Processes Execute request"
  process_id:
    type: string
    label: "Process Id"
    doc: "Process Id"

outputs:
  echo_output:
    type: stdout

stdout: echo_output.txt
