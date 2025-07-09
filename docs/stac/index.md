# STAC custom types for CWL

The schema is available at https://raw.githubusercontent.com/eoap/schemas/main/stac.yaml and 1:1 reflects the [SpatioTemporal Asset Catalogs](https://stacspec.org/en) schemas.

The schema defines: 

- A `Catalog` record,  which describes a [Catalog](https://raw.githubusercontent.com/radiantearth/stac-api-spec/refs/tags/v1.0.0/stac-spec/catalog-spec/json-schema/catalog.json);
- A `Collection` record,  which describes a [Collection](https://raw.githubusercontent.com/radiantearth/stac-api-spec/refs/tags/v1.0.0/stac-spec/collection-spec/json-schema/collection.json);
- An `Item` record,  which describes an [Item](https://raw.githubusercontent.com/radiantearth/stac-api-spec/refs/tags/v1.0.0/stac-spec/item-spec/json-schema/item.json).

## How to use this schema

Users have to import the schema in the CWL description via the [SchemaDefRequirement](https://www.commonwl.org/v1.2/CommandLineTool.html#SchemaDefRequirement):

```yaml
cwlVersion: v1.2
class: CommandLineTool
requirements:
  ...
  SchemaDefRequirement:
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/stac.yaml
```
