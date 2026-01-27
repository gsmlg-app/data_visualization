/// Prebuilt Natural Earth GeoJSON maps packaged for Flutter.
///
/// ## Using Generated Widgets (Recommended)
///
/// Each map file exports both data and a widget class:
/// ```dart
/// import 'package:dv_map/maps/world/110m.dart';
/// import 'package:dv_map/maps/asia/china/110m.dart';
/// import 'package:dv_geo_core/dv_geo_core.dart';
///
/// // Use the generated widgets
/// World110mWidget(
///   projection: MercatorProjection(),
///   fillColor: Colors.blue,
/// )
///
/// AsiaChina110mWidget(
///   projection: MercatorProjection(),
///   fillColor: Colors.red,
/// )
/// ```
///
/// ## Accessing Raw Data
///
/// Each map file also exports the raw GeoJSON data:
/// ```dart
/// import 'package:dv_map/maps/world/110m.dart';
///
/// final GeoJsonFeatureCollection data = world110m;
/// print('${data.features.length} features');
/// ```
///
/// ## Dynamic Loading (for runtime selection)
///
/// Use the dynamic loader when you need to select maps at runtime:
/// ```dart
/// import 'package:dv_map/dv_map.dart';
///
/// final world = await DvMapLoader.loadWorld(MapScale.m110);
/// final usa = await DvMapLoader.loadCountry(scale: MapScale.m110, isoA3: 'USA');
/// ```
library dv_map;

// Export all generated maps
export 'maps/maps.dart';

// Export base map widget
export 'src/map_widget.dart';

// Export dynamic loading API
export 'src/map_assets.dart';
export 'src/map_index.dart';
export 'src/map_loader.dart';
