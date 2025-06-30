cwlVersion: v1.2
class: CommandLineTool
label: "Echo URI string format"
baseCommand: echo

requirements:
  - class: InlineJavascriptRequirement
  - class: SchemaDefRequirement
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/string_format.yaml

inputs:
  product_uri:
    type: https://raw.githubusercontent.com/eoap/schemas/main/string_format.yaml#URI
    label: "Product URI"
    doc: "Product URI in string format"
    inputBinding:
      valueFrom: |
        ${
          // parse the URI provided in the input
          var product_uri = inputs.product_uri.value;

          // Validate the URI format
          var uriPattern = /^(https?|ftp):\/\/[^\s/$.?#].[^\s]*$/i;
          if (!uriPattern.test(product_uri)) {
            throw "Invalid URI format: " + product_uri;
          }
          // Return the URI as a string
          return "Product URI: " + product_uri;
        }

outputs:
  echo_output:
    type: stdout

stdout: echo_output.txt