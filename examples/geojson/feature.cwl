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
label: "Echo GeoJSON Feature"
baseCommand: echo

requirements:
  - class: InlineJavascriptRequirement
  - class: SchemaDefRequirement
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml

inputs:
  aoi:
    type: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#Feature
    label: "Area of interest"
    doc: "Area of interest defined in GeoJSON format"
    inputBinding:
      valueFrom: |
        ${
          // Validate if type is 'Feature'
          if (inputs.aoi.type !== 'Feature') {
            throw "Invalid GeoJSON type: expected 'Feature', got '" + inputs.aoi.type + "'";
          }
          // get the Feature geometry type

          return "Feature with id '" + inputs.aoi.id + "' is of type: " + inputs.aoi.geometry.type;
        }

outputs:
  echo_output:
    type: stdout

stdout: echo_output.txt