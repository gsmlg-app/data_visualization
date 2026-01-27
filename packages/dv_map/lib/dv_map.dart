/// Prebuilt Natural Earth GeoJSON maps packaged for Flutter.
///
/// Each map is available as a getter that returns a GeoJsonFeatureCollection.
/// Import only the maps you need to enable tree shaking.
///
/// Example:
/// ```dart
/// import 'package:dv_map/maps/world/110m.dart';
/// import 'package:dv_map/maps/africa/nigeria/50m.dart';
///
/// // Use the maps directly
/// final world = world110m;
/// final nigeria = africaNigeria50m;
/// ```
library dv_map;

// Export all generated maps
export 'maps/maps.dart';

// Export MapScale enum (still useful for scale selection)
export 'src/map_assets.dart' show MapScale;

// Deprecated APIs (removed in v2.0.0)
export 'src/map_index.dart';
export 'src/map_loader.dart';
