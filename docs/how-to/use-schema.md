# Use an existing schema

To accept a structured input in a CWL tool, import its schema through `SchemaDefRequirement` and use the schema's named type in the input declaration.

## Choose the schema and type

Find the type in the [schema reference](../reference/index.md). The schema URLs are:

| Schema | Import URL | Example type |
| --- | --- | --- |
| GeoJSON | `https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml` | `Point` |
| OGC API Processes | `https://raw.githubusercontent.com/eoap/schemas/main/ogc.yaml` | `BBox` |
| STAC | `https://raw.githubusercontent.com/eoap/schemas/main/stac.yaml` | `Catalog` |
| String formats | `https://raw.githubusercontent.com/eoap/schemas/main/string_format.yaml` | `URI` |

## Import and declare the input

Merge the following entries into your tool's existing requirements and inputs. This fragment uses GeoJSON `Feature`; substitute the import URL and type name for another schema.

```yaml
requirements:
  SchemaDefRequirement:
    types:
      - $import: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml

inputs:
  feature:
    type: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#Feature
```

Use the same schema URL in the import and the type identifier, followed by `#` and the type name. Add command bindings and outputs as needed by your tool.

## Validate and run

With `cwltool` installed, validate your complete tool and run it with an input document matching the selected record:

```bash
cwltool --validate tool.cwl
cwltool tool.cwl inputs.yaml
```

Use the [worked examples](../tutorials/index.md) as input-document templates. See [custom types and their limits](../explanation/custom-types.md) for the distinction between a CWL record and validation against an external standard.
