# Copyright 2025 Terradue
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

cwlVersion: v1.2

$graph:
- class: Workflow
  id: main
  requirements:
    InlineJavascriptRequirement: {}
    SchemaDefRequirement:
      types:
      - $import: https://raw.githubusercontent.com/eoap/schemas/main/stac-cwl.yaml
    NetworkAccess:
      networkAccess: true
  
  inputs:
    reference: 
      type: string
  
  outputs:
  - id: stac_catalog
    outputSource:
    - step_describe/process_output
    type: File
  
  steps:
    step_stage:
      in:
        reference: reference
      out:
      - staged
      run: "#stage-in"
    step_describe:
      in:
        stac_catalog: step_stage/staged
      out:
      - process_output
      run: "#read_catalog"

- class: CommandLineTool
  id: stage-in
  inputs:
    reference:
      type: string
  outputs:
    staged:
      type: https://raw.githubusercontent.com/eoap/schemas/main/stac-cwl.yaml#STACCatalog
      outputBinding:
        glob: .
        outputEval: |
          ${
            return {
              "catalog_directory": {
                "class": "Directory",
                "path": self[0].path, 
                "location": self[0].path,
              }, 
              "id": "catalog",
              "description": "staged catalog",
              "links": [
                {
                  "rel": "self",
                  "href": "catalog.json",
                  "type": "application/json",
                  "title": "staged catalog"
                }
              ]
            };
          }
  baseCommand: 
  - python
  - stage.py
  arguments:
  - $( inputs.reference )
  requirements:
    DockerRequirement:
      dockerPull: ghcr.io/eoap/mastering-app-package/stage:1.0.0
    InlineJavascriptRequirement: {}
    SchemaDefRequirement:
      types:
      - $import: https://raw.githubusercontent.com/eoap/schemas/main/stac-cwl.yaml
    NetworkAccess:
      networkAccess: true
    InitialWorkDirRequirement:
      listing:
        - entryname: stage.py
          entry: |-
            import pystac
            import stac_asset
            import asyncio
            import os
            import sys

            config = stac_asset.Config(warn=True)

            async def main(href: str):
                
                item = pystac.read_file(href)
                
                os.makedirs(item.id, exist_ok=True)
                cwd = os.getcwd()
                
                os.chdir(item.id)
                item = await stac_asset.download_item(item=item, directory=".", config=config)
                os.chdir(cwd)
                
                cat = pystac.Catalog(
                    id="catalog",
                    description=f"catalog with staged {item.id}",
                    title=f"catalog with staged {item.id}",
                )
                cat.add_item(item)
                
                cat.normalize_hrefs("./")
                cat.save(catalog_type=pystac.CatalogType.SELF_CONTAINED)

                return cat

            href = sys.argv[1]

            cat = asyncio.run(main(href))

- class: CommandLineTool
  id: read_catalog
  requirements:
    NetworkAccess:
      networkAccess: true
    DockerRequirement:
      dockerPull: ghcr.io/eoap/mastering-app-package/stage:1.0.0
    InlineJavascriptRequirement: {}
    SchemaDefRequirement:
      types:
      - $import: https://raw.githubusercontent.com/eoap/schemas/main/stac-cwl.yaml
    InitialWorkDirRequirement:
      listing:
        - entryname: describe.py
          entry: |-
            import pystac
            import sys
            
            cat = pystac.read_file(sys.argv[1])
            cat.describe()
            
            item = next(cat.get_items())
            
            for _, asset in item.get_assets().items():
              if not "data" in asset.to_dict()["roles"]:
                  continue

              eo_asset = pystac.extensions.eo.AssetEOExtension(asset)
              if not eo_asset.bands:
                  continue
              for b in eo_asset.bands:
                  if ("common_name" in b.properties.keys()):
                      print(b.properties["common_name"], asset.get_absolute_href())
                      
  inputs:
    stac_catalog:
      type: https://raw.githubusercontent.com/eoap/schemas/main/stac-cwl.yaml#STACCatalog
      label: "STAC Catalog Input"
      doc: "Input is a STAC catalog, though the directory is optional."

  outputs:
    process_output:
      type: stdout

  baseCommand: 
  - python
  - describe.py
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
