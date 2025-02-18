# How to define new Input/Output types

Defining new Input/Output is a smooth process:

- Define a `*.yaml` file that will contain the new Input/Output data schema/format, i.e.`geojson.yaml`;
- New objects format has to be defined inside an array element;
- Each new type has few fields that have to be fulfilled:
    * `name` is the new element name to uniquely identify it inside the new schema;
    * `type` is a self-explanatory field, for the native supported type please refer to the official [documentation](https://www.commonwl.org/v1.2/CommandLineTool.html#SchemaDefRequirement);
    * `fields` here is where new fields are itemized;

```yaml
- name: Point
  type: record
  fields:
```

- Users can now define their own types (please have a deep look at the array definition):

```yaml
- name: Item
  type: record
  doc: "This object represents the metadata for an item in a SpatioTemporal Asset Catalog"
  fields:
    - name: stac_version
      type: string
      doc: "STAC version"
    - stac_extensions
      type:
      - type: array
        items: string
      doc: "STAC extensions"
    - name: collection
      type:
      - type: array
        items: string
      doc: "The ID of the STAC Collection this Item references to."
    - name: links
      type:
      - type: array
        items: Link
      doc: "Links"
    - name: assets
      type:
      - type: array
        items: Asset
```

where fields can be defined as complex types:

```yaml
- name: BasicDescriptiveFields
  ...

- name: DateTime
  ...

- name: Instrument
  ...

- name: Licensing
  ...

- name: Provider
  ...

- name: Link
  ...

- name: Asset
  ...
```

- Users can now use the new defined type as a validated input, importing first the schema in the CWL description;
- Then define an input of `type` `https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#Feature`:

```yaml
cwlVersion: v1.2
class: CommandLineTool
requirements:
  ...
  SchemaDefRequirement:
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml

inputs:
  feature:
    type: https://raw.githubusercontent.com/eoap/schemas/main/geojson.yaml#Feature
    label: " Feature Input"
    doc: "Input is a Feature."
```
