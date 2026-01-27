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

**Without tree shaking** (legacy API):
- Bundle size: ~13 MB compressed (112 MB uncompressed)
- All 680+ maps included

**With tree shaking** (direct imports):
- Bundle size: Only what you import
- Examples:
  - `world_110m` only: ~921 KB
  - `world_110m` + 5 countries (110m): ~1.5 MB
  - Custom selection: You decide

## Generating maps

To regenerate the map files from assets:

```bash
cd packages/dv_map
dart scripts/generate_map_widgets.dart
```
