# Changelog

## 1.1.0

- **BREAKING**: Removed dynamic loading API (`DvMapLoader`, `DvMapIndex`, `map_loader.dart`)
- **BREAKING**: Removed generic `WorldMapWidget` and `CountryMapWidget`
- **NEW**: Each map file now exports its own widget class (e.g., `China110mWidget`, `Nigeria50mWidget`)
- **NEW**: Simplified widget naming - country maps no longer include continent prefix
- **NOTE**: Includes 110m and 50m resolution maps only (10m maps excluded to fit pub.dev 100MB limit)
- **IMPROVED**: Tree-shaking support - only imported maps are bundled
- Updated all examples to use new generated widget API

## 1.0.0

- Initial release with Natural Earth Admin 0 GeoJSON assets and loaders.
