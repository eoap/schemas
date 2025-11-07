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
label: "Echo Landsat-9 inputs"
baseCommand: echo

requirements:
  - class: InlineJavascriptRequirement
  - class: SchemaDefRequirement
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/develop/experimental/landsat9_inputs.yaml
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/string_format.yaml


inputs:
  stac_api_endpoint:
    type: https://raw.githubusercontent.com/eoap/schemas/develop/experimental/landsat9_inputs.yaml#STACApiEndpoint
    label: "STAC API endpoint"
    doc: "STAC API endpoint for Landsat-9 data"
  stac_api_search_request:
    type: https://raw.githubusercontent.com/eoap/schemas/develop/experimental/landsat9_inputs.yaml#STACSearchSettings
    label: "STAC API search request"
    doc: "STAC API search request"
  ogc_api_processes_endpoint:
    type: https://raw.githubusercontent.com/eoap/schemas/develop/experimental/landsat9_inputs.yaml#OGCApiProcessesEndpoint
    label: "OGC API Processes endpoint"
    doc: "OGC API Processes endpoint for Landsat-9 data"
  ogc_api_processes_execute_request:
    type: https://raw.githubusercontent.com/eoap/schemas/develop/experimental/landsat9_inputs.yaml#OGCExecuteProcessSettings
    label: "OGC API Processes Execute request"
    doc: "OGC API Processes Execute request"
  process_id:
    type: string
    label: "Process Id"
    doc: "Process Id"

outputs:
  echo_output:
    type: stdout

stdout: echo_output.txt
