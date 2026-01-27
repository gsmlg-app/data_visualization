/// Prebuilt Natural Earth GeoJSON maps packaged for Flutter.
///
/// Each map is available as a getter that returns a GeoJsonFeatureCollection.
/// Import only the maps you need to enable tree shaking.
///
/// Example:
/// ```dart
/// import 'package:dv_map/maps/world_110m.dart';
/// import 'package:dv_map/maps/africa_nigeria_50m.dart';
///
/// // Use the maps directly
/// final world = world_110m;
/// final nigeria = africa_nigeria_50m;
/// ```
library dv_map;

// Export all generated maps
export 'maps/maps.dart';

// Legacy API (kept for backward compatibility, but uses dynamic loading)
export 'src/map_assets.dart';
export 'src/map_index.dart';
export 'src/map_loader.dart';
