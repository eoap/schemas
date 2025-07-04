# GeoJSON custom types for CWL

!!! note

    This is Work in Progress

The schema is available at https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml and 1:1 reflects the geojson.org [Geometry](https://geojson.org/schema/Geometry.json) and [Feature](https://geojson.org/schema/Feature.json) schemas.

The schema defines: 

- A `Point`,  which describes a [Point](https://tools.ietf.org/html/rfc7946#section-3.1.2);
- A `LineString`,  which describes a [LineString](https://tools.ietf.org/html/rfc7946#section-3.1.4);
- A `Polygon`,  which describes a [Polygon](https://tools.ietf.org/html/rfc7946#section-3.1.6);
- A `MultiPoint`,  which describes a [MultiPoint](https://tools.ietf.org/html/rfc7946#section-3.1.3);
- A `MultiLineString`,  which describes a [LineString](https://tools.ietf.org/html/rfc7946#section-3.1.5);
- A `MultiPolygon`,  which describes a [MultiPolygon](https://tools.ietf.org/html/rfc7946#section-3.1.7);
- A `Feature`,  which describes a [Feature](https://datatracker.ietf.org/doc/html/rfc7946#section-3.2);
- A `GeometryCollection`,  which describes a [GeometryCollection](https://datatracker.ietf.org/doc/html/rfc7946#section-3.1.8).

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

###  Point

Then define an input of `type` `https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#Point`:

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
    type: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#Point
    label: "Point of interest"
    doc: "Point of interest"
```

#### Input example

A complete example:

```yaml
cwlVersion: v1.2
class: CommandLineTool
label: "Echo Point"
baseCommand: echo

requirements:
  InlineJavascriptRequirement: {}
  SchemaDefRequirement:
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml

inputs:
  aoi:
    type: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#Point
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

```yaml
poi:
  type: Point
  coordinates:
  - 40
  - 5
```

###  Polygon

Then define an input of `type` `https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#Polygon`:

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
    type: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#Polygon
    label: "Area of interest"
    doc: "Area of interest defined as a Polygon"
```

#### Input example

A complete example:

```yaml
cwlVersion: v1.2
class: CommandLineTool
label: "Echo Polygon"
baseCommand: echo

requirements:
  InlineJavascriptRequirement: {}
  SchemaDefRequirement:
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml

inputs:
  aoi:
    type: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#Polygon
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

```yaml
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

###  MultiPoint

Then define an input of `type` `https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#MultiPoint`:

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
    type: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#MultiPoint
    label: "Area of interest"
    doc: "Area of interest defined as a MultiPoint"
```

#### Input example

A complete example:

```yaml
cwlVersion: v1.2
class: CommandLineTool
label: "Echo MultiPoint"
baseCommand: echo

requirements:
  InlineJavascriptRequirement: {}
  SchemaDefRequirement:
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml

inputs:
  aoi:
    type: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#MultiPoint
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

```yaml
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

###  MultiLineString

Then define an input of `type` `https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#MultiLineString`:

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
    type: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#MultiLineString
    label: "Area of interest"
    doc: "Area of interest defined as a MultiLineString"
```

#### Input example

A complete example:

```yaml
cwlVersion: v1.2
class: CommandLineTool
label: "Echo MultiLineString"
baseCommand: echo

requirements:
  InlineJavascriptRequirement: {}
  SchemaDefRequirement:
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml

inputs:
  aoi:
    type: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#MultiLineString
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

```yaml
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

###  MultiPolygon

Then define an input of `type` `https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#MultiPolygon`:

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
    type: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#MultiPolygon
    label: "Area of interest"
    doc: "Area of interest defined as a MultiPolygon"
```

#### Input example

A complete example:

```yaml
cwlVersion: v1.2
class: CommandLineTool
label: "Echo MultiPolygon"
baseCommand: echo

requirements:
  InlineJavascriptRequirement: {}
  SchemaDefRequirement:
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml

inputs:
  aoi:
    type: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#MultiPolygon
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

```yaml
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

###  Feature

Then define an input of `type` `https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#Feature`:

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
    type: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#Feature
    label: "Area of interest"
    doc: "Area of interest defined as a Feature"
```

#### Input example

A complete example:

```yaml
cwlVersion: v1.2
class: CommandLineTool
label: "Echo Feature"
baseCommand: echo

requirements:
  InlineJavascriptRequirement: {}
  SchemaDefRequirement:
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml

inputs:
  aoi:
    type: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#Feature
    label: "Area of interest"
    doc: "Area of interest defined as a Feature"
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

```yaml
aoi:
  type: "Feature"
  id: "3f4fd03e-ce04-4946-90c2-8f10bbc8cb32"
  bbox: [73.958, - 40.8003, 73.9737, - 40.7648]
  geometry:
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

###  GeometryCollection

Then define an input of `type` `https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#GeometryCollection`:

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
    type: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#GeometryCollection
    label: "Area of interest"
    doc: "Area of interest defined as a GeometryCollection"
```

#### Input example

A complete example:

```yaml
cwlVersion: v1.2
class: CommandLineTool
label: "Echo GeometryCollection"
baseCommand: echo

requirements:
  InlineJavascriptRequirement: {}
  SchemaDefRequirement:
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml

inputs:
  aoi:
    type: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#GeometryCollection
    label: "Area of interest"
    doc: "Area of interest defined as a Feature"
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

```yaml
aoi:
  type: "GeometryCollection"
  id: "3f4fd03e-ce04-4946-90c2-8f10bbc8cb32"
  bbox: [73.958, - 40.8003, 73.9737, - 40.7648]
  geometries:
    - type: MultiPolygon
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
