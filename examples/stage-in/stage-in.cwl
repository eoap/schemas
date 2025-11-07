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

class: CommandLineTool
id: main
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


