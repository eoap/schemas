# OGC API Processes custom types for CWL

!!! note

    This is Work in Progress

The schema is available at https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml and 1:1 reflects the GeoJSON.org [schema](https://geojson.org/schema/Geometry.json).

The schema defines: 

- A `GeoJSONPoint` which describes specifies a GeoJSON [Point](https://tools.ietf.org/html/rfc7946#section-3.1.2);
- A `GeoJSONLineString` which describes specifies a GeoJSON [LineString](https://tools.ietf.org/html/rfc7946#section-3.1.4);
- A `GeoJSONPolygon` which describes specifies a GeoJSON [Polygon](https://tools.ietf.org/html/rfc7946#section-3.1.6);
- A `GeoJSONMultiPoint` which describes specifies a GeoJSON [MultiPoint](https://tools.ietf.org/html/rfc7946#section-3.1.3);
- A `GeoJSONMultiLineString` which describes specifies a GeoJSON [LineString](https://tools.ietf.org/html/rfc7946#section-3.1.5);
- A `GeoJSONMultiPolygon` which describes specifies a GeoJSON [MultiPolygon](https://tools.ietf.org/html/rfc7946#section-3.1.7).

## How to use this schema

Import the schema in the CWL description:

```yaml
cwlVersion: v1.2
class: CommandLineTool
requirements:
  ...
  SchemaDefRequirement:
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml
```

### GeoJSON Point

Then define an input of `type` `https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#GeoJSONPoint`:

```yaml
cwlVersion: v1.2
class: CommandLineTool
requirements:
  ...
  SchemaDefRequirement:
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml

inputs:
  poi:
    type: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#GeoJSONPoint
    label: "Point of interest"
    doc: "Point of interest"
```

#### Input example

A complete example:

```yaml
cwlVersion: v1.2
class: CommandLineTool
label: "Echo GeoJSON Point"
baseCommand: echo

requirements:
  InlineJavascriptRequirement: {}
  SchemaDefRequirement:
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml

inputs:
  aoi:
    type: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#GeoJSONPoint
    label: "Point of interest"
    doc: "Point of interest"
    inputBinding:
      valueFrom: |
        ${
          TBD
        }

outputs:
  echo_output:
    type: stdout

stdout: echo_output.txt
```

Then create an input: 

```
poi:
  type: Point
  coordinates:
  - 40
  - 5
```

### GeoJSON Polygon

Then define an input of `type` `https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#GeoJSONPolygon`:

```yaml
cwlVersion: v1.2
class: CommandLineTool
requirements:
  ...
  SchemaDefRequirement:
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml

inputs:
  aoi:
    type: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#GeoJSONPolygon
    label: "Area of interest"
    doc: "Area of interest defined as a Polygon"
```

#### Input example

A complete example:

```yaml
cwlVersion: v1.2
class: CommandLineTool
label: "Echo GeoJSON Polygon"
baseCommand: echo

requirements:
  InlineJavascriptRequirement: {}
  SchemaDefRequirement:
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml

inputs:
  aoi:
    type: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#GeoJSONPolygon
    label: "Area of interest"
    doc: "Area of interest defined as a Polygon"
    inputBinding:
      valueFrom: |
        ${
          TBD
        }

outputs:
  echo_output:
    type: stdout

stdout: echo_output.txt
```

Then create an input: 

```
aoi:
  type: Polygon
  coordinates:
  - - - 0
      - 0
    - - 3
      - 6
    - - 6
      - 1
    - - 0
      - 0
```

### GeoJSON MultiPoint

Then define an input of `type` `https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#GeoJSONMultiPoint`:

```yaml
cwlVersion: v1.2
class: CommandLineTool
requirements:
  ...
  SchemaDefRequirement:
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml

inputs:
  aoi:
    type: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#GeoJSONMultiPoint
    label: "Area of interest"
    doc: "Area of interest defined as a MultiPoint"
```

#### Input example

A complete example:

```yaml
cwlVersion: v1.2
class: CommandLineTool
label: "Echo GeoJSON MultiPoint"
baseCommand: echo

requirements:
  InlineJavascriptRequirement: {}
  SchemaDefRequirement:
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml

inputs:
  aoi:
    type: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#GeoJSONMultiPoint
    label: "Area of interest"
    doc: "Area of interest defined as a MultiPoint"
    inputBinding:
      valueFrom: |
        ${
          TBD
        }

outputs:
  echo_output:
    type: stdout

stdout: echo_output.txt
```

Then create an input: 

```
aoi:
  type: MultiPoint
  coordinates:
  - - -73.958
    - 40.8003
  - - -73.9498
    - 40.7968
  - - -73.9737
    - 40.7648
  - - -73.9814
    - 40.7681
```

### GeoJSON MultiLineString

Then define an input of `type` `https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#GeoJSONMultiLineString`:

```yaml
cwlVersion: v1.2
class: CommandLineTool
requirements:
  ...
  SchemaDefRequirement:
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml

inputs:
  aoi:
    type: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#GeoJSONMultiLineString
    label: "Area of interest"
    doc: "Area of interest defined as a MultiLineString"
```

#### Input example

A complete example:

```yaml
cwlVersion: v1.2
class: CommandLineTool
label: "Echo GeoJSON MultiLineString"
baseCommand: echo

requirements:
  InlineJavascriptRequirement: {}
  SchemaDefRequirement:
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml

inputs:
  aoi:
    type: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#GeoJSONMultiLineString
    label: "Area of interest"
    doc: "Area of interest defined as a MultiLineString"
    inputBinding:
      valueFrom: |
        ${
          TBD
        }

outputs:
  echo_output:
    type: stdout

stdout: echo_output.txt
```

Then create an input: 

```
aoi:
  type: MultiLineString
  coordinates:
  - - - -73.96943
      - 40.78519
    - - -73.96082
      - 40.78095
  - - - -73.96415
      - 40.79229
    - - -73.95544
      - 40.78854
  - - - -73.97162
      - 40.78205
    - - -73.96374
      - 40.77715
  - - - -73.9788
      - 40.77247
    - - -73.97036
      - 40.76811
```

### GeoJSON MultiPolygon

Then define an input of `type` `https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#GeoJSONMultiPolygon`:

```yaml
cwlVersion: v1.2
class: CommandLineTool
requirements:
  ...
  SchemaDefRequirement:
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml

inputs:
  aoi:
    type: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#GeoJSONMultiPolygon
    label: "Area of interest"
    doc: "Area of interest defined as a MultiPolygon"
```

#### Input example

A complete example:

```yaml
cwlVersion: v1.2
class: CommandLineTool
label: "Echo GeoJSON MultiPolygon"
baseCommand: echo

requirements:
  InlineJavascriptRequirement: {}
  SchemaDefRequirement:
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml

inputs:
  aoi:
    type: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#GeoJSONMultiPolygon
    label: "Area of interest"
    doc: "Area of interest defined as a MultiPolygon"
    inputBinding:
      valueFrom: |
        ${
          TBD
        }

outputs:
  echo_output:
    type: stdout

stdout: echo_output.txt
```

Then create an input: 

```
aoi:
  type: MultiPolygon
  coordinates:
  - - - - -73.958
        - 40.8003
      - - -73.9498
        - 40.7968
      - - -73.9737
        - 40.7648
      - - -73.9814
        - 40.7681
      - - -73.958
        - 40.8003
  - - - - -73.958
        - 40.8003
      - - -73.9498
        - 40.7968
      - - -73.9737
        - 40.7648
      - - -73.958
        - 40.8003
```
