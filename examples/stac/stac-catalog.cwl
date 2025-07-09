cwlVersion: v1.2
class: CommandLineTool
label: "Echo STAC Catalog"
baseCommand: echo

requirements:
  - class: InlineJavascriptRequirement
  - class: SchemaDefRequirement
    types:
    - $import: file:///home/stripodi/Documents/workspace/schemas/stac.yaml

inputs:
  stac_catalog:
    type: file:///home/stripodi/Documents/workspace/schemas/stac.yaml#Catalog
    label: "STAC Catalog"
    doc: "STAC Catalog defined in STAC format"
    inputBinding:
      valueFrom: |
        ${
          // Validate if type is 'Feature'
          if ('Catalog' !== inputs.stac_catalog.type) {
            throw "Invalid STAC type: expected 'Catalog', got '" + inputs.stac_catalog.type + "'";
          }
          // get the STAC Catalog description

          return "STAC Catalog description: " + inputs.stac_catalog.description;
        }

outputs:
  echo_output:
    type: stdout

stdout: echo_output.txt