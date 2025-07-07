# GeoJSON custom types for CWL

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

Users have to import the schema in the CWL description via the [SchemaDefRequirement](https://www.commonwl.org/v1.2/CommandLineTool.html#SchemaDefRequirement):

```yaml
cwlVersion: v1.2
class: CommandLineTool
requirements:
  ...
  SchemaDefRequirement:
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml
```
