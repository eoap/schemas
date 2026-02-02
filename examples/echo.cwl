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