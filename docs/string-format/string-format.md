# String Format custom types for CWL

The schema is available at https://raw.githubusercontent.com/eoap/schemas/main/string_format.yaml and tries to supply the missing CWL string format support for [JSON Schema 2.x](https://opis.io/json-schema/2.x/formats.html) and [OpenAPI](https://swagger.io/docs/specification/v3_0/data-models/data-types/#strings) _String Formats_.

- `Date`: `{ "type": "string", "format": "date" }`
- `DateTime`: `{ "type": "string", "format": "date-time" }`
- `Duration`: `{ "type": "string", "format": "duration}`
- `Email`: `{ "type": "string", "format": "email" }`
- `Hostname`: `{ "type": "string", "format": "hostname" }`
- `IDNEmail`: `{ "type": "string", "format": "idn-email" }`
- `IDNHostname`: `{ "type": "string", "format": "idn-hostname" }`
- `IPv6`: `{ "type": "string", "format": "ipv6" }`
- `IRI`: `{ "type": "string", "format": "iri" }`
- `IRIReference`: `{ "type": "string", "format": "iri-reference" }`
- `JsonPointer`: `{ "type": "string", "format": "json-pointer" }`
- `Password`: `{ "type": "string", "format": "password" }`
- `RelativeJsonPointer`: `{ "type": "string", "format": "relative-json-pointer" }`
- `UUID`: `{ "type": "string", "format": "uuid" }`
- `URI`: `{ "type": "string", "format": "uri" }`
- `URIReference`: `{ "type": "string", "format": "uri-reference" }`
- `URITemplate`: `{ "type": "string", "format": "uri-template" }`
- `Time`: `{ "type": "string", "format": "time" }`

[!WARNING]
Due to CWL Inputs/Outputs schema limitations,  `{ "type": "string", "format": "regex" }` aside to `pattern` cannot be supported.

## How to use this schema

Import the schema in the CWL description:

```yaml
cwlVersion: v1.2
class: CommandLineTool
requirements:
  ...
  SchemaDefRequirement:
    types:
    - $import: https://raw.githubusercontent.com/eoap/schemas/main/string_format.yaml
```
