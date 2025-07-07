# OGC API Processes custom types for CWL

The schema is available at https://raw.githubusercontent.com/eoap/schemas/main/ogc.yaml and 1:1 reflects the OGC [bbox](https://raw.githubusercontent.com/opengeospatial/ogcapi-features/refs/heads/master/core/openapi/parameters/bbox.yaml)

## How to use this schema

Users have to import the schema in the CWL description via the [SchemaDefRequirement](https://www.commonwl.org/v1.2/CommandLineTool.html#SchemaDefRequirement):

```yaml
cwlVersion: v1.2
class: CommandLineTool
requirements:
  ...
  SchemaDefRequirement:
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/ogc.yaml
```
