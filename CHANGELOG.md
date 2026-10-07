# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- A proposed `Pattern` record in `string_format.yaml`, carrying a string value and an ECMA-262 regular expression.
- Generated schema reference documentation for GeoJSON, OGC, STAC, and string formats, with a task to regenerate it.
- A scheduled dependency check comparing the released OData client's container version with the latest `pygeofilter-odata-cdse` release.

### Changed

- **Breaking:** `BasicDescriptiveFields.title` and `BasicDescriptiveFields.description` in `stac.yaml` now require strings instead of accepting `null`.
- Updated the OData client container from `pygeofilter-odata-cdse:0.4.0` to `0.9.0`.
- Reorganized documentation into tutorials, how-to guides, reference, and explanation, and expanded schema field descriptions.
- Upgraded project metadata to CodeMeta 3.0 and added authors, project links, and descriptive metadata.

### Fixed

- Release automation skips publishing versions that already exist and serializes publishing runs.
- STAC API integration tests pin compatible server dependencies and wait for server readiness.
- Corrected the license identifier in project metadata and the README license badge to Apache-2.0.

### Removed

- The ES6 polyfill from the documentation configuration.
- The redundant `NOTICE` file.

## [0.3.2] - 2026-02-06

### Changed

- Updated the OData client container from `pygeofilter-odata-cdse:0.3.0` to `0.4.0`.

## [0.3.1] - 2026-02-06

### Changed

- Switched the OData client container from a digest-pinned image to `ghcr.io/terradue/pygeofilter-odata-cdse:0.3.0`.

## [0.3.0] - 2026-02-03

### Added

- An experimental OData discovery client using the shared API endpoint and STAC search settings types, with an example job and release packaging.

### Changed

- Relicensed the project under the Apache License, Version 2.0.
- **Breaking:** OGC `CRS` enum values now use the full CRS84 and CRS84h URIs instead of short names.

### Fixed

- Corrected GeoJSON `Polygon.coordinates` to use three nested array levels instead of two.
- Updated the STAC API client to use the published `ghcr.io/eoap/schemas/stac-api-client:0.2.0` container.
- Updated STAC API integration tests to use local tool and job files and avoid assertions tied to exact output content.

## [0.2.0] - 2025-09-11

### Added

- A Streamlit discovery playground for editing CWL search jobs and viewing returned features on a map.
- STAC API integration tests for collection and item-ID searches, backed by local GeoParquet fixtures.
- An optional `max-items` field in the experimental discovery search settings.

### Changed

- The STAC API client now honors `max-items`, defaulting to 20 results instead of a hard-coded limit of 5.

### Fixed

- Corrected CWL expressions in the discovery example, including handling an absent bounding box.

## [0.1.0] - 2025-08-11

### Added

- Initial tagged release of custom CWL types for Earth Observation Application Package inputs and outputs.
- Schemas for GeoJSON geometries and features, OGC bounding boxes and coordinate reference systems, and STAC catalogs, collections, and items.
- String-format records for dates, times, durations, URIs, email addresses, and other common formats.
- Experimental API endpoint, discovery, and processing types, plus a containerized STAC API discovery client.
- CWL examples and notebooks covering schema usage, discovery, processing, and staging STAC inputs.
- Documentation and automated schema validation, container builds, and release packaging.

[Unreleased]: https://github.com/eoap/schemas/compare/0.3.2...HEAD
[0.3.2]: https://github.com/eoap/schemas/compare/0.3.1...0.3.2
[0.3.1]: https://github.com/eoap/schemas/compare/0.3.0...0.3.1
[0.3.0]: https://github.com/eoap/schemas/compare/0.2.0...0.3.0
[0.2.0]: https://github.com/eoap/schemas/compare/0.1.0...0.2.0
[0.1.0]: https://github.com/eoap/schemas/releases/tag/0.1.0
