cwlVersion: v1.2
class: CommandLineTool
label: "Echo STAC Item"
baseCommand: echo

requirements:
  - class: InlineJavascriptRequirement
  - class: SchemaDefRequirement
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/stac.yaml

inputs:
  stac_item:
    type: https://raw.githubusercontent.com/eoap/schemas/main/stac.yaml#Item
    label: "STAC Catalog"
    doc: "STAC Catalog defined in STAC format"
    inputBinding:
      valueFrom: |
        ${
          // Validate if type is 'Feature'
          if ('Feature' != inputs.stac_item.type) {
            throw "Invalid STAC type: expected 'Feature', got '" + inputs.stac_item.type + "'";
          }
          // get the STAC Item id

          return "STAC Item ID: " + inputs.stac_item.id;
        }

outputs:
  echo_output:
    type: stdout

stdout: echo_output.txt