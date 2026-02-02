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