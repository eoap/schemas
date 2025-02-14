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
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/stac.yaml

inputs:
  stac_catalog:
    type: https://raw.githubusercontent.com/eoap/schemas/main/stac.yaml#STACCatalog
    label: "STAC Catalog Input"
    doc: "Input is a STAC catalog, though the directory is optional."

outputs:
  process_output:
    type: stdout

baseCommand: [echo]
arguments:
  - valueFrom: |
      ${
        // the catalog_directory is set, provide the path to catalog.json
        if (inputs.stac_catalog.catalog_directory) {
          return inputs.stac_catalog.catalog_directory.path + "/catalog.json";
        } else {
          // Return the href of the link where rel='self'
          return inputs.stac_catalog.links.filter(function(link) {
            return link.rel === 'self';
          })[0].href;
        }
      }
    position: 1