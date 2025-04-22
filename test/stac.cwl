cwlVersion: v1.2
class: CommandLineTool
requirements:
  SchemaDefRequirement:
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/refs/heads/main/geojson.yaml
    - $import: https://raw.githubusercontent.com/eoap/schemas/refs/heads/main/stac.yaml
inputs:
  input_catalog:
    type: https://raw.githubusercontent.com/eoap/schemas/refs/heads/main/stac.yaml#Catalog
    inputBinding:
      position: 1
outputs:
  output_file:
    type: File
    outputBinding:
      glob: output.txt
baseCommand: echo
