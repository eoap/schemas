# Define new input and output types

Use this guide to add a reusable record type to a CWL tool. You need an existing CWL tool and `cwltool` installed; the [first-input tutorial](tutorials/first-input.md) covers environment setup.

## Define the schema

Create `custom.yaml` beside your tool. The file contains an array of named type definitions. For each record, provide a `name`, `type: record`, and its `fields`:

```yaml
- name: Observation
  type: record
  doc: An observation with a label and numeric measurements.
  fields:
    - name: label
      type: string
    - name: measurements
      type:
        type: array
        items: double
```

Each field needs a name and type. Arrays specify their element type with `items`. You can define additional named records in the same schema and refer to those names from field types.

## Import the schema

Add the schema to your tool's `SchemaDefRequirement`, preserving any requirements it already has:

```yaml
requirements:
  SchemaDefRequirement:
    types:
      - $import: custom.yaml
```

## Declare an input

Reference the schema file and type name in your tool's inputs:

```yaml
inputs:
  observation:
    type: custom.yaml#Observation
```

Add the bindings needed to consume this record in your command. The [GeoJSON Point example](geojson/point.ipynb) demonstrates reading record fields in an input binding.

Create `inputs.yaml` with values for your new input:

```yaml
observation:
  label: sample
  measurements: [1.0, 2.5]
```

## Validate the tool and input

Run these commands beside `tool.cwl`, `custom.yaml`, and `inputs.yaml`:

```bash
cwltool --validate tool.cwl
cwltool tool.cwl inputs.yaml
```

The first command checks the complete tool definition; the second also loads the input and executes the tool. For an output record, use the same type identifier in an output declaration and supply an output binding that produces the matching structure.

Compare your definitions with the [schema reference](reference/index.md). See [custom types and their limits](explanation/custom-types.md) for validation constraints.
