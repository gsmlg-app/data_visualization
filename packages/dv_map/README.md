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
import 'package:dv_map/maps/world_110m.dart';
import 'package:dv_map/maps/africa_nigeria_50m.dart';
import 'package:dv_map/maps/asia_china_10m.dart';

void main() {
  // Maps are available as camelCase getters (no async loading needed)
  final world = world110m;           // GeoJsonFeatureCollection
  final nigeria = africaNigeria50m;  // GeoJsonFeatureCollection
  final china = asiaChina10m;        // GeoJsonFeatureCollection

  print('World has ${world.features.length} countries');
}
```

### Available maps

**File naming:** `{region}_{country}_{scale}.dart` (snake_case)
**Getter naming:** `{region}{Country}{Scale}` (camelCase)

**World maps:**
- `world_110m.dart` → `world110m` (~921 KB) - Low resolution
- `world_50m.dart` → `world50m` (~8.4 MB) - Medium resolution
- `world_10m.dart` → `world10m` (~46 MB) - High resolution

**Country maps:**
- `africa_*.dart` → `africa*` - African countries
- `asia_*.dart` → `asia*` - Asian countries
- `europe_*.dart` → `europe*` - European countries
- `north_america_*.dart` → `northAmerica*` - North American countries
- `south_america_*.dart` → `southAmerica*` - South American countries
- `oceania_*.dart` → `oceania*` - Oceanian countries

**Examples:**
- `africa_nigeria_110m.dart` → `africaNigeria110m` getter
- `asia_japan_50m.dart` → `asiaJapan50m` getter
- `europe_france_10m.dart` → `europeFrance10m` getter
- `north_america_usa_110m.dart` → `northAmericaUsa110m` getter

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
