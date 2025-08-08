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
  stac_api:
    type: https://raw.githubusercontent.com/eoap/schemas/main/experimental/landsat9_inputs.yaml#STACAPI
    label: "STAC API settings"
    doc: "STAC API settings for Landsat-9 data"
  ogc_processes:
    type: https://raw.githubusercontent.com/eoap/schemas/main/experimental/landsat9_inputs.yaml#OCGProcesses
    label: "OGC API Processes settings"
    doc: "OGC API Processes settings for Landsat-9 data"
  process_id:
    type: string
    label: "Process Id"
    doc: "Process Id"

outputs:
  echo_output:
    type: stdout

stdout: echo_output.txt
