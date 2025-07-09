cwlVersion: v1.2
class: CommandLineTool
label: "Echo STAC Collection"
baseCommand: echo

requirements:
  - class: InlineJavascriptRequirement
  - class: SchemaDefRequirement
    types:
    - $import: file:///home/stripodi/Documents/workspace/schemas/stac.yaml

inputs:
  stac_collection:
    type: file:///home/stripodi/Documents/workspace/schemas/stac.yaml#Collection
    label: "STAC Collection"
    doc: "STAC Collection defined in STAC format"
    inputBinding:
      valueFrom: |
        ${
          // Validate if type is 'Collection'
          if ('Collection' !== inputs.stac_collection.type) {
            throw "Invalid STAC type: expected 'Collection', got '" + inputs.stac_collection.type + "'";
          }
          // get the STAC Collection description

          return "STAC Collection ID: " + inputs.stac_collection.id;
        }

outputs:
  echo_output:
    type: stdout

stdout: echo_output.txt