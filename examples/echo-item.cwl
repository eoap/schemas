cwlVersion: v1.2
class: CommandLineTool
requirements:
  NetworkAccess:
    networkAccess: true
  DockerRequirement:
    dockerPull: node:slim
  InlineJavascriptRequirement: {}
  SchemaDefRequirement:
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/stac-cwl.yaml

inputs:
  stac_catalog:
    type: https://raw.githubusercontent.com/eoap/schemas/main/stac-cwl.yaml#STACCatalog
    label: "STAC Catalog Input"
    doc: "Input is a STAC catalog, though the directory is optional."

outputs:
  process_output:
    type: stdout

baseCommand: [echo]
arguments:
  - valueFrom: |
      ${
        // Return the href of the link where rel='item'
        return inputs.stac_catalog.links.filter(function(link) {
          return link.rel === 'item';
        })[0].href;
      }
    position: 1