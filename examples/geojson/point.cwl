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
label: "Echo GeoJSON Point"
baseCommand: echo

requirements:
  - class: InlineJavascriptRequirement
  - class: SchemaDefRequirement
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml

inputs:
  point_of_interest:
    type: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#Point
    label: "Point of Interest"
    doc: "Point of interest defined in GeoJSON format"
    inputBinding:
      valueFrom: |
        ${
          // Validate if type is 'Point'
          if (inputs.point_of_interest.type !== 'Point') {
            throw "Invalid GeoJSON type: expected 'Point', got '" + inputs.point_of_interest.type + "'";
          }
          var coordinates = inputs.point_of_interest.coordinates;

          return "Point Coordinates: " + coordinates.join(', ');
        }

outputs:
  echo_output:
    type: stdout

stdout: echo_output.txt