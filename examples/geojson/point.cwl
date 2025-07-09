cwlVersion: v1.2
class: CommandLineTool
label: "Echo GeoJSON Point"
baseCommand: echo

requirements:
  - class: InlineJavascriptRequirement
  - class: SchemaDefRequirement
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml

inputs:
  point_of_interest:
    type: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#Point
    label: "Point of Interest"
    doc: "Point of interest defined in GeoJSON format"
    inputBinding:
      valueFrom: |
        ${
          // Validate if type is 'Point'
          if (inputs.point_of_interest.type !== 'Point') {
            throw "Invalid GeoJSON type: expected 'Point', got '" + inputs.point_of_interest.type + "'";
          }
          var coordinates = inputs.point_of_interest.coordinates;

          return "Point Coordinates: " + coordinates.join(', ');
        }

outputs:
  echo_output:
    type: stdout

stdout: echo_output.txt