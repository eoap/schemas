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
label: "Echo STAC Catalog"
baseCommand: echo

requirements:
  - class: InlineJavascriptRequirement
  - class: SchemaDefRequirement
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/stac.yaml

inputs:
  stac_catalog:
    type: https://raw.githubusercontent.com/eoap/schemas/main/stac.yaml#Catalog
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