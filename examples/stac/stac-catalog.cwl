cwlVersion: v1.2
class: CommandLineTool
label: "Echo STAC Catalog"
baseCommand: echo

requirements:
  - class: InlineJavascriptRequirement
  - class: SchemaDefRequirement
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/stac.yaml

inputs:
  catalog:
    type: https://raw.githubusercontent.com/eoap/schemas/main/stac.yaml#Catalog
    label: "STAC Catalog"
    doc: "STAC Catalog defined in STAC format"
    inputBinding:
      valueFrom: |
        ${
          // Validate if type is 'Feature'
          if (inputs.catalog.type !== 'Catalog') {
            throw "Invalid STAC type: expected 'Catalog', got '" + inputs.catalog.type + "'";
          }
          // get the STAC Catalog description

          return "STAC Catalog description: " + inputs.catalog.description;
        }

outputs:
  echo_output:
    type: stdout

stdout: echo_output.txt