# STAC custom types for CWL

The schema is available at https://raw.githubusercontent.com/eoap/schemas/main/stac-cwl.yaml

The schema defines: 

- A `STACCatalog` record
- A `Link` record used by the `STACCatalog`

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

## Input examples

### STAC Catalog

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

### Staged STAC Catalog

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

### STAC Catalog with a STAC Item

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