cwlVersion: v1.2
class: CommandLineTool
label: "geo API - Discovery"
baseCommand: cat

requirements:
- class: InlineJavascriptRequirement
- class: SchemaDefRequirement
  types:
  - $import: https://raw.githubusercontent.com/eoap/schemas/main/string_format.yaml
  - $import: https://raw.githubusercontent.com/eoap/schemas/main/experimental/api-endpoint.yaml
  - $import: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml
  - $import: https://raw.githubusercontent.com/eoap/schemas/main/experimental/discovery.yaml
- class: InitialWorkDirRequirement
  listing:
  - entryname: inputs.yaml
    entry: |-
      $(inputs.api_endpoint.url.value)
      ---
      $(inputs.search_request.collections[0])
      ---
      ${ 
        const bbox = inputs.search_request?.bbox;
        if (bbox && Array.isArray(bbox) && bbox.length >= 4) {
          return "--bbox " + bbox.join(" ");
        }
        return "";
      }

inputs:
  api_endpoint:
    type: https://raw.githubusercontent.com/eoap/schemas/main/experimental/api-endpoint.yaml#APIEndpoint
    label: "STAC API endpoint"
    doc: "STAC API endpoint for Landsat-9 data"
  search_request:
    type: https://raw.githubusercontent.com/eoap/schemas/main/experimental/discovery.yaml#STACSearchSettings
    label: "STAC API settings"
    doc: "STAC API settings for Landsat-9 data"

arguments:
- inputs.yaml

outputs:
  echo_output:
    type: stdout

stdout: discovery-output.yaml
