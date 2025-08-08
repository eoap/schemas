cwlVersion: v1.2
class: CommandLineTool
label: "geo API"
baseCommand: cat

requirements:
  - class: InlineJavascriptRequirement
  - class: SchemaDefRequirement
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/experimental/geo-api.yaml
  - class: InitialWorkDirRequirement
    listing:
      - entryname: inputs.yaml
        entry: |-
          $(inputs.stac_api)
          ---
          $(inputs.stac_api.api_endpoint.url.value)
          ---
          $(inputs.stac_api.search_request.collections[0])
          ---
          ${ 
            const aoi = inputs.stac_api?.search_request?.aoi;
            return (Array.isArray(aoi) && aoi.length >= 4) ? "--bbox " + aoi[0] + " " + aoi[1] + " " + aoi[2] + " " + aoi[3] : "";
          }
inputs:
  stac_api:
    type: https://raw.githubusercontent.com/eoap/schemas/main/experimental/geo-api.yaml#STACAPI
    label: "STAC API settings"
    doc: "STAC API settings for Landsat-9 data"

arguments:
- inputs.yaml

outputs:
  echo_output:
    type: stdout

stdout: discovery-output.yaml
