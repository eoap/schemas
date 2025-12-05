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
label: "Echo Datetime string format"
baseCommand: echo

requirements:
  - class: InlineJavascriptRequirement
  - class: SchemaDefRequirement
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/string_format.yaml

inputs:
  start_time:
    type: https://raw.githubusercontent.com/eoap/schemas/main/string_format.yaml#DateTime
    label: "Start Time"
    doc: "Start time in ISO 8601 format"
    inputBinding:
      valueFrom: |
        ${
          // Parse ISO datetime and extract parts
          var date = new Date(inputs.start_time.value);
          if (isNaN(date.getTime())) {
            throw "Invalid ISO 8601 date format for start_time.";
          }

          var dateParts = [
            "Date Breakdown:",
            "Year: " + date.getUTCFullYear(),
            "Month: " + (date.getUTCMonth() + 1),
            "Day: " + date.getUTCDate(),
            "Hour: " + date.getUTCHours(),
            "Minute: " + date.getUTCMinutes(),
            "Second: " + date.getUTCSeconds()
          ].join("\n * ");

          return dateParts;
        }

outputs:
  echo_output:
    type: stdout

stdout: echo_output.txt