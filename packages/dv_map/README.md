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

Each map file exports both the GeoJSON data AND a ready-to-use widget:

```dart
import 'package:flutter/material.dart';
import 'package:dv_geo_core/dv_geo_core.dart';

// Import specific maps - each exports both data and widget
import 'package:dv_map/maps/world/110m.dart';
import 'package:dv_map/maps/asia/china/110m.dart';
import 'package:dv_map/maps/africa/nigeria/50m.dart';

class MyMapApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Use the generated World110mWidget
          Expanded(
            child: World110mWidget(
              projection: MercatorProjection(),
              fillColor: Colors.grey.shade300,
              strokeColor: Colors.grey.shade700,
              onFeatureTap: (feature, position) {
                print('Tapped: ${feature.properties!['name']}');
              },
            ),
          ),
          // Use the generated China110mWidget (no continent prefix!)
          Expanded(
            child: China110mWidget(
              projection: MercatorProjection(),
              fillColor: Colors.red.shade200,
              strokeColor: Colors.red.shade700,
            ),
          ),
          // Use the generated Nigeria50mWidget
          Expanded(
            child: Nigeria50mWidget(
              projection: MercatorProjection(),
              fillColor: Colors.green.shade300,
            ),
          ),
        ],
      ),
    );
  }
}
```

**Generated widgets:**
Each map file (e.g., `world/110m.dart`, `asia/china/110m.dart`) exports:
- **Data getter**: `world110m`, `asiaChina110m`, etc.
- **Widget class**: `World110mWidget`, `AsiaChina110mWidget`, etc.

All generated widgets support:
- Custom projections (Mercator, Orthographic, Albers, etc.)
- Custom fill and stroke colors
- Interactive tap detection
- Full customization via parameters

**Base widget** (for advanced custom use):
- `MapWidget` - Base widget for rendering any GeoJSON data with full control

### Accessing Raw GeoJSON Data

Each map file exports the raw GeoJSON data as a getter:

```dart
import 'package:dv_map/maps/world/110m.dart';
import 'package:dv_map/maps/africa/nigeria/50m.dart';

void main() {
  // Access the raw GeoJSON data (no async loading needed)
  final world = world110m;             // GeoJsonFeatureCollection
  final nigeria = africaNigeria50m;    // GeoJsonFeatureCollection

  print('World has ${world.features.length} countries');
  print('Nigeria has ${nigeria.features.length} features');

  // Access feature properties
  for (final feature in world.features) {
    print(feature.properties!['name']);
  }
}
```

**Tree-shakeable:** Your app only bundles the maps you import.

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
- **Data getters**: `{continent}{Country}{Scale}` (camelCase, includes continent)
- **Widget classes**: `{Country}{Scale}Widget` (PascalCase + Widget, NO continent prefix)

**World maps:**

| File | Data Getter | Widget Class | Size |
|------|-------------|--------------|------|
| `maps/world/110m.dart` | `world110m` | `World110mWidget` | ~171 KB |
| `maps/world/50m.dart` | `world50m` | `World50mWidget` | ~1.3 MB |
| `maps/world/10m.dart` | `world10m` | `World10mWidget` | ~7.3 MB |

**Country maps examples:**

| File | Data Getter | Widget Class |
|------|-------------|--------------|
| `maps/africa/nigeria/110m.dart` | `africaNigeria110m` | `Nigeria110mWidget` |
| `maps/asia/japan/50m.dart` | `asiaJapan50m` | `Japan50mWidget` |
| `maps/europe/france/10m.dart` | `europeFrance10m` | `France10mWidget` |
| `maps/asia/china/110m.dart` | `asiaChina110m` | `China110mWidget` |
| `maps/asia/afghanistan/110m.dart` | `asiaAfghanistan110m` | `Afghanistan110mWidget` |
| `maps/africa/south-sudan/50m.dart` | `africaSouthSudan50m` | `SouthSudan50mWidget` |

**Note:**
- Data getters include continent prefix for namespacing (e.g., `asiaChina110m`)
- Widget classes omit continent prefix for cleaner usage (e.g., `China110mWidget`)
- Hyphens in country names are converted to underscores in data getters and PascalCase in widget names

## Tree Shaking & Bundle Size

**Bundle size** - Only imported maps are included:
- `world.110m` only: ~171 KB
- `world.50m` only: ~1.3 MB
- `world.110m` + 5 countries: ~350 KB
- Import what you need!

**Size comparison:**

| Map | Raw JSON | Gzipped in Dart | Savings |
|-----|----------|-----------------|---------|
| world.110m | 921 KB | 171 KB | 81% |
| world.50m | 8.4 MB | 1.3 MB | 84% |
| world.10m | 46 MB | 7.3 MB | 84% |
| Country (avg) | ~100 KB | ~15 KB | 85% |

Maps are stored as gzipped binary (base64 encoded) for maximum compression.

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
