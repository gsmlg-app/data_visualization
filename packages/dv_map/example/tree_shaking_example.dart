import 'package:dv_map/maps/world/110m.dart';
import 'package:dv_map/maps/africa/nigeria/110m.dart';

/// Example demonstrating tree shaking with dv_map.
///
/// This example only imports 2 maps, so only those 2 maps will be
/// bundled into the final app (not all 680+ maps).
///
/// The maps are stored as gzipped binary data and decompressed on first
/// access. Subsequent accesses use the cached parsed GeoJSON.
void main() {
  // First access: decompresses and parses the gzipped data
  print('Loading world map...');
  final world = world110m;
  print('World map: ${world.features.length} features');

  // Second access: uses cached result (no decompression)
  final worldAgain = world110m;
  print('World map (cached): ${worldAgain.features.length} features');

  // Load another map
  print('\nLoading Nigeria map...');
  final nigeria = africaNigeria110m;
  print('Nigeria map: ${nigeria.features.length} features');

  // Example: Find a specific country in world map
  final algeria = world.features.firstWhere(
    (f) => f.properties?['iso_a3'] == 'DZA',
  );
  print('\nFound: ${algeria.properties?['name']}');
  print('Coordinates: ${algeria.geometry}');
}
