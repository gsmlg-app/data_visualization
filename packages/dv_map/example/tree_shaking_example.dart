import 'package:dv_map/maps/world.110m.dart';
import 'package:dv_map/maps/africa/nigeria.110m.dart';

/// Example demonstrating tree shaking with dv_map.
///
/// This example only imports 2 maps, so only those 2 maps will be
/// bundled into the final app (not all 680+ maps).
void main() {
  // Maps are available as getters (no async loading)
  final world = world110m;
  final nigeria = africaNigeria110m;

  print('World map: ${world.features.length} features');
  print('Nigeria map: ${nigeria.features.length} features');

  // Example: Find a specific country in world map
  final algeria = world.features.firstWhere(
    (f) => f.properties?['iso_a3'] == 'DZA',
  );
  print('Found: ${algeria.properties?['name']}');
}
