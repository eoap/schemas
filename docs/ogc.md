# OGC API Processes custom types for CWL

!!! note

    This is Work in Progress

The schema is available at https://raw.githubusercontent.com/eoap/schemas/main/ogc.yaml to support a [Bounding Box value](https://docs.ogc.org/is/18-062r2/18-062r2.html#bounding-box-value).

The schema defines: 

- A `BBox` record,  which describes a [bbox](https://github.com/opengeospatial/ogcapi-processes/blob/master/openapi/schemas/processes-core/bbox.yaml).

## How to use this schema

Import the schema in the CWL description:

```yaml
cwlVersion: v1.2
class: CommandLineTool
requirements:
  ...
  SchemaDefRequirement:
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/ogc.yaml
```

Then define an input of `type` `https://raw.githubusercontent.com/eoap/schemas/main/ogc.yaml#BBox`:

```yaml
cwlVersion: v1.2
class: CommandLineTool
requirements:
  ...
  SchemaDefRequirement:
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/ogc.yaml

inputs:
  aoi:
    type: https://raw.githubusercontent.com/eoap/schemas/main/ogc.yaml#BBox
    label: "Area of interest"
    doc: "Area of interest defined as a bounding box"
```

## Input example

A complete example:

```yaml
cwlVersion: v1.2
class: CommandLineTool
label: "Echo OGC BBox"
baseCommand: echo

requirements:
  InlineJavascriptRequirement: {}
  SchemaDefRequirement:
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
```

Then create an input: 

```
aoi:
  bbox: [100.0, 0.0, 101.0, 1.0]
  crs: "CRS84"
```