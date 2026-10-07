# Custom types and their limits

## Why custom types?

Earth Observation applications use structured data such as spatial geometries, bounding boxes, and product metadata. Named CWL record types make those structures explicit in a tool's input and output interface. A shared schema lets multiple tools describe the same structure without repeating its definition.

This repository proposes schemas for GeoJSON, OGC bounding boxes, STAC metadata, and string formats. The [reference](../reference/index.md) describes the available types.

## How the pieces fit together

A schema YAML file defines named types. A CWL tool imports those definitions through `SchemaDefRequirement`, then refers to a type by its schema identifier and name. An input document supplies values for the fields of that type. The tool's bindings determine how those values become command arguments.

The [first-input tutorial](../tutorials/first-input.md) demonstrates that relationship with a GeoJSON Point. The schema describes the record, while the example tool checks its `type` value and formats its coordinates.

## Structural types and format validation

A CWL type describes the values a field can hold. It does not automatically enforce every rule from the external specification that inspired it.

For example, the string-format schema represents formats such as `DateTime` and `URI` as records with a string-valued `value` field. Their names and descriptions express the intended format; a string field alone does not validate a timestamp or URI. Applications needing those checks must implement them.

STAC records have explicitly declared fields, so declaring an extension does not automatically add that extension’s properties to the CWL type. The Item schema allows `null` or one of its named geometry records; the [STAC Item example](../stac/item.ipynb) uses `null`. Passing a URI to a STAC document can avoid embedding that document in the restricted record, but the consuming application must then load and validate it.

## Experimental schemas

The discovery and process examples explore additional interfaces. They are separated from the main schema reference because they are experimental. Use their [worked examples](../tutorials/index.md#experimental-examples) to understand the current behavior.
