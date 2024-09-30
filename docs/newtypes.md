# How to define new Input/Output types

Defining new Input/Output is a smooth process:

- Define a `*.yaml` file first that will contain the new input/Output data schema/format, i.e.`geojson.yaml` and edit it;
- Namespace needs to be defined in order to qualify elements inside the schema:

```yaml
$base: "https://stacspec.org/schema#"
```

- New objects format have to be defined inside the `$graph` element, which is an array of elements;
- Each new type has few fields that have to be fulfilled:
    * `name` is the new element name to unambiguously identify it inside the new schema;
    * `type` is a self-explanatory field, for the native supported type please refer to the official [documentation](https://www.commonwl.org/user_guide/topics/inputs.html);
    * `documentRoot` (optional) to help the documentation generator identify this is the root element;
    * `fields` where itemize the new fields; please take note: there is a mandatory `class` field that needs to be defined.

```yaml
- name: Point
  type: record
  documentRoot: true
  fields:
    class:
      type: string
      doc: "Always ' Point'"
      jsonldPredicate:
        "_id": "@type"
        "_type": "@vocab"
```

- If there is the need to reuse elements from other schema(s), there's a simple way to import the elements:
    * Define first the namespace to qualify the imported elements, in the dedicated `$namespaces` field;
    * import the schema via the URL pointing to the physical file containing the elements, inside the `$graph.$import` field, i.e.:

```yaml
$namespaces:
  geojson: "https://geojson.org/schema#"
$graph:
- $import: https://raw.githubusercontent.com/eoap/schemas/refs/heads/main/geojson.yaml
```

- Users can now define their own types:

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

- name: Item
  type: record
  extends: [geojson:Feature, BasicDescriptiveFields, DateTime, Instrument, Licensing, Provider]
  documentRoot: true
  doc: |
    "This object represents the metadata for an item in a SpatioTemporal Asset Catalog"
  fields:
    class:
      type: string
      doc: "Always 'STAC Item'"
      jsonldPredicate:
        "_id": "@type"
        "_type": "@vocab"
    stac_version:
      type: string
      doc: |
        "STAC version"
    stac_extensions:
      type: string[]
      doc: |
        "STAC extensions"
    collection:
      type: string
      doc: |
        "The ID of the STAC Collection this Item references to."
    links:
      type: Link[]
      doc: |
        "Links"
    assets:
      type: Asset[]
```

- Users can now use the new defined type as a validated input, importing first the schema in the CWL description;
- Then define an input of `type` `https://raw.githubusercontent.com/eoap/schemas/main/stac.yaml#Item`:

```yaml
cwlVersion: v1.2
class: CommandLineTool
requirements:
  ...
  SchemaDefRequirement:
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/stac.yaml

inputs:
  stac_item:
    type: https://raw.githubusercontent.com/eoap/schemas/main/stac.yaml#Item
    label: " Item Input"
    doc: "Input is an Item."
```

- Users can now describe their input:

```yaml
stac_item:
  id: swissbuildings3d_2_2018-07_1091-13
  collection: ch.swisstopo.swissbuildings3d_2
  type: Feature
  stac_version: 0.9.0
  geometry:
    type: Polygon
    coordinates:
    - - - 8.399153
        - 47.4058268
      - - 8.3986668
        - 47.3788462
      - - 8.456594
        - 47.3783503
      - - 8.4571096
        - 47.4053306
      - - 8.399153
        - 47.4058268
  bbox:
  - 8.3986668
  - 47.3783503
  - 8.4571096
  - 47.4058268
  properties:
    datetime: '2018-07-01T00:00:00Z'
    created: '2021-02-10T14:06:20.891429Z'
    updated: '2021-02-10T17:44:40.788143Z'
  links:
  - rel: self
    href: https://data.geo.admin.ch/api/stac/v0.9/collections/ch.swisstopo.swissbuildings3d_2/items/swissbuildings3d_2_2018-07_1091-13
  - rel: root
    href: https://data.geo.admin.ch/api/stac/v0.9/
  - rel: parent
    href: https://data.geo.admin.ch/api/stac/v0.9/collections/ch.swisstopo.swissbuildings3d_2
  - rel: collection
    href: https://data.geo.admin.ch/api/stac/v0.9/collections/ch.swisstopo.swissbuildings3d_2
  - rel: alternate
    title: STAC Browser
    type: text/html
    href: https://data.geo.admin.ch/browser/index.html#/collections/ch.swisstopo.swissbuildings3d_2/items/swissbuildings3d_2_2018-07_1091-13
  assets:
    swissbuildings3d_2_2018-07_1091-13_2056_5728.dxf.zip:
      type: application/x.dxf+zip
      href: https://data.geo.admin.ch/ch.swisstopo.swissbuildings3d_2/swissbuildings3d_2_2018-07_1091-13/swissbuildings3d_2_2018-07_1091-13_2056_5728.dxf.zip
      created: '2021-02-10T14:06:21.558510Z'
      updated: '2021-02-10T17:44:40.790957Z'
  stac_extensions:
  - https://stac-extensions.github.io/timestamps/v1.1.0/schema.json
```
