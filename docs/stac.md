# STAC custom types for CWL

!!! note

    This is Work in Progress

The schema is available at https://raw.githubusercontent.com/eoap/schemas/main/stac-cwl.yaml

The schema defines: 

- A `STACCatalog` record;
- A `STACCollection` record;
- A `Link` record, referenced in both `STACCatalog` and `STACCollection` records;
- A `Range` record, referenced in the `STACCollection` record.

The `STACCAtalog` is a STAC Catalog but for allowing mounting the directory for a staged catalog, it includes an optional field of type `Directory` named `catalog_directory`.

## How to use this schema

Import the schema in the CWL description:

```yaml
cwlVersion: v1.2
class: CommandLineTool
requirements:
  ...
  SchemaDefRequirement:
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/stac-cwl.yaml
```

### STACCatalog

Then define an input of `type` `https://raw.githubusercontent.com/eoap/schemas/main/stac-cwl.yaml#STACCatalog`:

```yaml
cwlVersion: v1.2
class: CommandLineTool
requirements:
  ...
  SchemaDefRequirement:
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/stac-cwl.yaml

inputs:
  stac_catalog:
    type: https://raw.githubusercontent.com/eoap/schemas/main/stac-cwl.yaml#STACCatalog
    label: "STAC Catalog Input"
    doc: "Input is a STAC catalog, though the directory is optional."
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

#### Staged STAC Catalog

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

#### STAC Catalog with a STAC Item

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

### STACCollection

Then define an input of `type` `https://raw.githubusercontent.com/eoap/schemas/main/stac-cwl.yaml#STACCollection`:

```yaml
cwlVersion: v1.2
class: CommandLineTool
requirements:
  ...
  SchemaDefRequirement:
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/stac-cwl.yaml

inputs:
  stac_collection:
    type: https://raw.githubusercontent.com/eoap/schemas/main/stac-cwl.yaml#STACCollection
    label: "STAC STACCollection Input"
    doc: "Input is a STAC catalog, though the directory is optional."
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

#### Staged STAC Collection

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
