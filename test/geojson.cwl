cwlVersion: v1.2
class: CommandLineTool
requirements:
  SchemaDefRequirement:
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/refs/heads/main/geojson.yaml
inputs:
  input_feature:
    type: https://raw.githubusercontent.com/eoap/schemas/refs/heads/main/geojson.yaml#FeatureCollection
    inputBinding:
      position: 1
outputs:
  output_file:
    type: File
    outputBinding:
      glob: output.txt
baseCommand: echo
