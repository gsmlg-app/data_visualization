# dv_map

Prebuilt Natural Earth Admin 0 GeoJSON maps packaged for Flutter with **tree shaking support**.

## Features

- ✅ **Tree shaking** - Only imports the maps you use
- ✅ **No asset bundling** - Maps are embedded as Dart constants
- ✅ **Type safe** - Each map is a named getter
- ✅ **680+ maps** - World maps and individual countries at 3 resolutions

## Data source

These GeoJSON files are derived from the Natural Earth Admin 0 – Countries datasets:

- https://naciscdn.org/naturalearth/110m/cultural/ne_110m_admin_0_countries.zip
- https://naciscdn.org/naturalearth/50m/cultural/ne_50m_admin_0_countries.zip
- https://naciscdn.org/naturalearth/10m/cultural/ne_10m_admin_0_countries.zip

The maps are Natural Earth country boundaries converted to GeoJSON at scales 110m (low), 50m (medium), and 10m (high resolution).

## Usage

### Tree-shakeable imports (recommended)

Import only the maps you need. Your app will only bundle the imported maps:

```dart
// Import world map
import 'package:dv_map/maps/world.110m.dart';

// Import specific country maps
import 'package:dv_map/maps/africa/nigeria.50m.dart';
import 'package:dv_map/maps/asia/china.10m.dart';

// Or import all maps from a continent
import 'package:dv_map/maps/africa/africa.dart';

void main() {
  // Maps are available as camelCase getters (no async loading needed)
  final world = world110m;             // GeoJsonFeatureCollection
  final nigeria = africaNigeria50m;    // GeoJsonFeatureCollection
  final china = asiaChina10m;          // GeoJsonFeatureCollection

  print('World has ${world.features.length} countries');
}
```

### Available maps

**Directory structure:**
```
lib/maps/
├── world.{scale}.dart        # World maps
├── index-{scale}.dart        # Country metadata indexes
├── africa/
│   ├── africa.dart          # Exports all African country maps
│   ├── {country}.{scale}.dart
├── asia/
│   ├── asia.dart            # Exports all Asian country maps
│   ├── {country}.{scale}.dart
├── europe/
│   ├── europe.dart          # Exports all European country maps
│   ├── {country}.{scale}.dart
├── north-america/
│   ├── north-america.dart   # Exports all North American country maps
│   ├── {country}.{scale}.dart
├── south-america/
│   ├── south-america.dart   # Exports all South American country maps
│   ├── {country}.{scale}.dart
└── oceania/
    ├── oceania.dart         # Exports all Oceanian country maps
    └── {country}.{scale}.dart
```

**Naming conventions:**
- **Files**: `{country}.{scale}.dart` (kebab-case with dots)
- **Getters**: `{region}{Country}{Scale}` (camelCase)

**World maps:**
- `maps/world.110m.dart` → `world110m` getter (~921 KB)
- `maps/world.50m.dart` → `world50m` getter (~8.4 MB)
- `maps/world.10m.dart` → `world10m` getter (~46 MB)

**Examples:**
- `maps/africa/nigeria.110m.dart` → `africaNigeria110m` getter
- `maps/asia/japan.50m.dart` → `asiaJapan50m` getter
- `maps/europe/france.10m.dart` → `europeFrance10m` getter
- `maps/north-america/usa.110m.dart` → `northAmericaUsa110m` getter

### Legacy API (no tree shaking)

The old dynamic loading API is still available but bundles all assets:

```dart
import 'package:dv_map/dv_map.dart';

Future<void> example() async {
  // ⚠️ Warning: This bundles ALL 112MB of maps
  final world = await DvMapLoader.loadWorld(MapScale.m110);
  final usa = await DvMapLoader.loadCountry(
    scale: MapScale.m110,
    isoA3: 'USA',
  );
}
```

## Tree Shaking Benefits

**Data format:**
- Maps stored as gzipped binary (base64 encoded)
- 80-85% size reduction vs raw JSON
- Decompressed on first access, then cached

**Without tree shaking** (legacy API):
- Bundle size: All 680+ maps (~112 MB uncompressed)
- ❌ No tree shaking support

**With tree shaking** (direct imports):
- Bundle size: Only what you import
- Examples:
  - `world.110m` only: ~171 KB (after gzip)
  - `world.50m` only: ~1.3 MB (after gzip)
  - `world.110m` + 5 countries (110m): ~350 KB
  - Custom selection: You decide

**Size comparison:**

| Map | Raw JSON | Gzipped in Dart | Savings |
|-----|----------|-----------------|---------|
| world.110m | 921 KB | 171 KB | 81% |
| world.50m | 8.4 MB | 1.3 MB | 84% |
| world.10m | 46 MB | 7.3 MB | 84% |
| Country (avg) | ~100 KB | ~15 KB | 85% |

## How It Works

1. **GeoJSON files** are gzip compressed during code generation
2. **Binary data** is base64-encoded and embedded as Dart strings
3. **First access**: Data is decoded, decompressed, and parsed
4. **Subsequent accesses**: Cached `GeoJsonFeatureCollection` is returned
5. **Tree shaking**: Flutter's build system only bundles imported maps

## Generating maps

To regenerate the map files from assets:

```bash
cd packages/dv_map
dart scripts/generate_map_widgets.dart
```

This script:
- Reads all `.json` files from `assets/`
- Gzip compresses each file
- Base64 encodes the compressed data
- Generates Dart files with getter functions
- Creates continent-level index files
