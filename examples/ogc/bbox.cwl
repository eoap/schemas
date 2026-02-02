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
label: "Echo OGC BBox"
baseCommand: echo

requirements:
  - class: InlineJavascriptRequirement
  - class: SchemaDefRequirement
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/ogc.yaml

inputs:
  aoi:
    type: https://raw.githubusercontent.com/eoap/schemas/main/ogc.yaml#BBox
    label: "Area of interest"
    doc: "Area of interest defined as a bounding box"
    inputBinding:
      valueFrom: |
        ${
          // Validate the length of bbox to be either 4 or 6
          var bboxLength = inputs.aoi.bbox.length;
          if (bboxLength !== 4 && bboxLength !== 6) {
            throw "Invalid bbox length: bbox must have either 4 or 6 elements.";
          }
          // Convert bbox array to a space-separated string for echo
          return inputs.aoi.bbox.join(' ') + " CRS: " + inputs.aoi.crs;
        }

outputs:
  echo_output:
    type: stdout

stdout: echo_output.txt