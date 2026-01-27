# dv_map

Prebuilt Natural Earth Admin 0 GeoJSON maps packaged for Flutter with **tree shaking support**.

## Features

- ✅ **Flutter widgets** - Ready-to-use widgets for rendering maps
- ✅ **Tree shaking** - Only imports the maps you use
- ✅ **No asset bundling** - Maps are embedded as Dart constants
- ✅ **Type safe** - Each map is a named getter
- ✅ **680+ maps** - World maps and individual countries at 3 resolutions
- ✅ **Interactive** - Tap detection and event handling
- ✅ **Customizable** - Full control over styling and projections

## Data source

These GeoJSON files are derived from the Natural Earth Admin 0 – Countries datasets:

- https://naciscdn.org/naturalearth/110m/cultural/ne_110m_admin_0_countries.zip
- https://naciscdn.org/naturalearth/50m/cultural/ne_50m_admin_0_countries.zip
- https://naciscdn.org/naturalearth/10m/cultural/ne_10m_admin_0_countries.zip

The maps are Natural Earth country boundaries converted to GeoJSON at scales 110m (low), 50m (medium), and 10m (high resolution).

## Usage

### Map Widgets (Recommended)

Use the provided widgets to render maps in your Flutter app:

```dart
import 'package:flutter/material.dart';
import 'package:dv_map/dv_map.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_map/maps/world/110m.dart';

class MyMapApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WorldMapWidget(
        geoJson: world110m,
        projection: MercatorProjection(),
        fillColor: Colors.grey.shade300,
        strokeColor: Colors.grey.shade700,
        onCountryTap: (country, position) {
          print('Tapped: ${country.properties!['name']}');
        },
      ),
    );
  }
}
```

**Available widgets:**
- `MapWidget` - Base widget for rendering any GeoJSON data
- `WorldMapWidget` - Specialized for world maps with default styling
- `CountryMapWidget` - Specialized for country maps with default styling

All widgets support:
- Custom projections (Mercator, Orthographic, Albers, etc.)
- Custom fill and stroke colors
- Interactive tap detection
- Full customization via parameters

### Raw Data Access

Two APIs are available for accessing the raw map data:



### 1. Tree-shakeable imports (recommended)

Import only the maps you need. Your app will only bundle the imported maps:

```dart
// Import world map
import 'package:dv_map/maps/world/110m.dart';

// Import specific country maps
import 'package:dv_map/maps/africa/nigeria/50m.dart';
import 'package:dv_map/maps/asia/china/10m.dart';

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

**Best for:** Apps that know which maps they need at compile time.

### 2. Dynamic asset loading

Load maps at runtime based on user input or dynamic data:

```dart
import 'package:dv_map/dv_map.dart';

Future<void> example() async {
  // Load world map
  final world = await DvMapLoader.loadWorld(MapScale.m110);

  // Load country by ISO code
  final usa = await DvMapLoader.loadCountry(
    scale: MapScale.m110,
    isoA3: 'USA',
  );

  // Load country by name
  final japan = await DvMapLoader.loadCountry(
    scale: MapScale.m50,
    name: 'Japan',
  );

  // Get metadata about available countries
  final index = await DvMapIndex.load(MapScale.m110);
  print('${index.countries.length} countries available');
}
```

**Best for:** Apps that need to load maps dynamically (e.g., user selects country from dropdown).

**Note:** Dynamic loading bundles ALL assets (~112 MB), so use tree-shakeable imports when possible.

### Available maps

**Directory structure:**
```
lib/maps/
├── world/
│   ├── 110m.dart           # World map (low resolution)
│   ├── 50m.dart            # World map (medium resolution)
│   ├── 10m.dart            # World map (high resolution)
│   └── world.dart          # Exports all world scales
├── africa/
│   ├── africa.dart         # Exports all African countries
│   ├── nigeria/
│   │   ├── 110m.dart
│   │   ├── 50m.dart
│   │   ├── 10m.dart
│   │   └── nigeria.dart    # Exports all Nigeria scales
│   └── ... (other countries)
├── asia/
│   ├── asia.dart           # Exports all Asian countries
│   └── {country}/{scale}.dart
├── europe/
│   ├── europe.dart         # Exports all European countries
│   └── {country}/{scale}.dart
├── north-america/
│   ├── north-america.dart  # Exports all North American countries
│   └── {country}/{scale}.dart
├── south-america/
│   ├── south-america.dart  # Exports all South American countries
│   └── {country}/{scale}.dart
└── oceania/
    ├── oceania.dart        # Exports all Oceanian countries
    └── {country}/{scale}.dart
```

**Naming conventions:**
- **Directory structure**: `{continent}/{country}/{scale}.dart`
- **Getters**: `{continent}{Country}{Scale}` (camelCase with underscores replacing hyphens)

**World maps:**
- `maps/world/110m.dart` → `world110m` getter (~171 KB compressed)
- `maps/world/50m.dart` → `world50m` getter (~1.3 MB compressed)
- `maps/world/10m.dart` → `world10m` getter (~7.3 MB compressed)

**Examples:**
- `maps/africa/nigeria/110m.dart` → `africaNigeria110m` getter
- `maps/asia/japan/50m.dart` → `asiaJapan50m` getter
- `maps/europe/france/10m.dart` → `europeFrance10m` getter
- `maps/north-america/united-states-of-america/110m.dart` → `northAmericaUnitedStatesOfAmerica110m` getter
- `maps/africa/south-sudan/50m.dart` → `africaSouthSudan50m` getter (hyphens → underscores)

## Choosing the Right API

### Tree-shakeable imports vs Dynamic loading

| Feature | Tree-shakeable imports | Dynamic asset loading |
|---------|----------------------|----------------------|
| Bundle size | Only imported maps | All maps (~112 MB) |
| Async loading | ❌ No (synchronous) | ✅ Yes (async) |
| Runtime selection | ❌ Compile-time only | ✅ ISO/name lookup |
| Tree shaking | ✅ Yes | ❌ No |
| Use case | Known maps at build time | User-driven selection |

**Data format** (both APIs):
- Maps stored as gzipped binary (base64 encoded) in generated code
- Assets stored as raw JSON for dynamic loading
- 80-85% size reduction with generated code
- Decompressed on first access, then cached

**Bundle size examples:**

Tree-shakeable imports:
- `world.110m` only: ~171 KB
- `world.50m` only: ~1.3 MB
- `world.110m` + 5 countries: ~350 KB

Dynamic asset loading:
- All maps bundled: ~112 MB (assets must be included)

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
