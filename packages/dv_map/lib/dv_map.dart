/// Prebuilt Natural Earth GeoJSON maps packaged for Flutter.
///
/// Two APIs are available:
///
/// 1. **Tree-shakeable imports** (recommended for static maps):
/// ```dart
/// import 'package:dv_map/maps/world/110m.dart';
/// import 'package:dv_map/maps/africa/nigeria/50m.dart';
///
/// final world = world110m;
/// final nigeria = africaNigeria50m;
/// ```
///
/// 2. **Dynamic asset loading** (for runtime map selection):
/// ```dart
/// import 'package:dv_map/dv_map.dart';
///
/// final world = await DvMapLoader.loadWorld(MapScale.m110);
/// final usa = await DvMapLoader.loadCountry(scale: MapScale.m110, isoA3: 'USA');
/// ```
library dv_map;

// Export all generated maps
export 'maps/maps.dart';

// Export dynamic loading API
export 'src/map_assets.dart';
export 'src/map_index.dart';
export 'src/map_loader.dart';
