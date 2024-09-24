#  custom types for CWL

!!! note

    This is Work in Progress

The schema is available at https://raw.githubusercontent.com/eoap/schemas/main/stac.yaml

The schema defines: 

- A `Catalog` record;
- A `Collection` record;
- An `Item` record.

The `CAtalog` is a  Catalog but for allowing mounting the directory for a staged catalog, it includes an optional field of type `Directory` named `catalog_directory`.

## How to use this schema

Import the schema in the CWL description:

```yaml
cwlVersion: v1.2
class: CommandLineTool
requirements:
  ...
  SchemaDefRequirement:
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/stac.yaml
```

### Catalog

Then define an input of `type` `https://raw.githubusercontent.com/eoap/schemas/main/stac.yaml#Catalog`:

```yaml
cwlVersion: v1.2
class: CommandLineTool
requirements:
  ...
  SchemaDefRequirement:
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/stac.yaml

inputs:
  stac_catalog:
    type: https://raw.githubusercontent.com/eoap/schemas/main/stac.yaml#Catalog
    label: " Catalog Input"
    doc: "Input is a  catalog, though the directory is optional."
```

Then use it with e.g.:

```yaml
...
baseCommand: [echo]
arguments:
  - valueFrom: |
      ${
        // the catalog_directory is set, provide the path to catalog.json
        if (inputs.stac_catalog.catalog_directory) {
          return inputs.stac_catalog.catalog_directory.path + "/catalog.json";
        } else {
          // Return the href of the link where rel='self'
          return inputs.stac_catalog.links.filter(function(link) {
            return link.rel === 'self';
          })[0].href;
        }
      }
    position: 1
...
```

#### Input examples

```yaml
stac_catalog:
  id: catalog-id
  description: catalog description
  links: 
  - rel: "self"
    href: "http://example.com/catalog.json"
    type: "application/json"
    title: "This catalog"
```

#### Staged  Catalog

```yaml
stac_catalog:
  id: catalog-id
  description: a catalog description
  links: 
  - rel: "self"
    href: "./catalog.json"
    type: "application/json"
    title: "This catalog"
  catalog_directory: 
    class: Directory
    path: staged-stac-catalog
```

####  Catalog with a  Item

```yaml
stac_catalog:
  id: catalog-id
  description: a catalog description
  links: 
  - rel: "self"
    href: "http://example.com/catalog.json"
    type: "application/json"
    title: "This catalog"
  - rel: item
    href: "https://earth-search.aws.element84.com/v0/collections/sentinel-s2-l2a-cogs/items/S2A_10TFK_20220524_0_L2A"
    type: "application/json"
    title: "This is the input item"
```

This can be processed with: 

```yaml
...
arguments:
  - valueFrom: |
      ${
        // Return the href of the link where rel='item'
        return inputs.stac_catalog.links.filter(function(link) {
          return link.rel === 'item';
        })[0].href;
      }
    position: 1
...
```

### Collection

Then define an input of `type` `https://raw.githubusercontent.com/eoap/schemas/main/stac.yaml#Collection`:

```yaml
cwlVersion: v1.2
class: CommandLineTool
requirements:
  ...
  SchemaDefRequirement:
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/stac.yaml

inputs:
  stac_collection:
    type: https://raw.githubusercontent.com/eoap/schemas/main/stac.yaml#Collection
    label: " Collection Input"
    doc: "Input is a  catalog, though the directory is optional."
```

Then use it with e.g.:

```yaml
...
baseCommand: [echo]
arguments:
  - valueFrom: |
      ${
        // the catalog_directory is set, provide the path to catalog.json
        if (inputs.stac_catalog.catalog_directory) {
          return inputs.stac_catalog.catalog_directory.path + "/catalog.json";
        } else {
          // Return the href of the link where rel='self'
          return inputs.stac_catalog.links.filter(function(link) {
            return link.rel === 'self';
          })[0].href;
        }
      }
    position: 1
...
```

#### Input examples

```yaml
stac_collection:
  links:
    - rel: self
      href: https://api.up42.dev/catalog/hosts/oneatlas/stac/search
  stac_extensions:
    - https://api.up42.com/stac-extensions/up42-order/v1.0.0/schema.json
  title: ORT_SPOT7_20190922_094920500_000
  description: High-resolution 1.5m SPOT images acquired daily on a global basis. The datasets are available starting from 2012.
  keywords:
    - berlin
    - optical
  license: proprietary
  providers:
    - name: Airbus
      roles:
      - producer
      url: https://www.airbus.com
  extent:
    spatial:
      bbox:
      - - -86.07022916666666
        - 11.900145833333333
        - -86.05072916666667
        - 11.942270833333334
    temporal:
      interval:
        - - '2017-01-01T00:00:00Z'
          - '2021-12-31T00:00:00Z'
  stac_version: 1.0.0
  id: 123e4567-e89b-12d3-a456-426614174000
  type: Collection
```

#### Staged Collection

```yaml
stac_collection:
  id: collection-id
  description: a collection description
  links: 
  - rel: "self"
    href: "./collection.json"
    type: "application/json"
    title: "This collection"
  collection_directory: 
    class: Directory
    path: staged-stac-collection
```

This can be processed with: 

```yaml
...
arguments:
  - valueFrom: |
      ${
        TBD
      }
    position: 1
...
```

### Item

Then define an input of `type` `https://raw.githubusercontent.com/eoap/schemas/main/stac.yaml#Item`:

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
    label: " Collection Input"
    doc: "Input is a  catalog, though the directory is optional."
```

Then use it with e.g.:

```yaml
...
baseCommand: [echo]
arguments:
  - valueFrom: |
      ${
        // the catalog_directory is set, provide the path to catalog.json
        if (inputs.stac_catalog.catalog_directory) {
          return inputs.stac_catalog.catalog_directory.path + "/catalog.json";
        } else {
          // Return the href of the link where rel='self'
          return inputs.stac_catalog.links.filter(function(link) {
            return link.rel === 'self';
          })[0].href;
        }
      }
    position: 1
...
```

#### Input examples

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

#### Staged Collection

```yaml
stac_item:
  id: collection-id
  description: a collection description
  links: 
  - rel: "self"
    href: "./item.json"
    type: "application/json"
    title: "This collection"
  collection_directory: 
    class: Directory
    path: staged-stac-collection
```

This can be processed with: 

```yaml
...
arguments:
  - valueFrom: |
      ${
        TBD
      }
    position: 1
...
```

