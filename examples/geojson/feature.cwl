cwlVersion: v1.2
class: CommandLineTool
label: "Echo GeoJSON Feature"
baseCommand: echo

requirements:
  - class: InlineJavascriptRequirement
  - class: SchemaDefRequirement
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml

inputs:
  aoi:
    type: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#Feature
    label: "Area of interest"
    doc: "Area of interest defined in GeoJSON format"
    inputBinding:
      valueFrom: |
        ${
          // Validate if type is 'Feature'
          if (inputs.aoi.type !== 'Feature') {
            throw "Invalid GeoJSON type: expected 'Feature', got '" + inputs.aoi.type + "'";
          }
          // get the Feature geometry type

          return "Feature with id '" + inputs.aoi.id + "' is of type: " + inputs.aoi.geometry.type;
        }

outputs:
  echo_output:
    type: stdout

stdout: echo_output.txt