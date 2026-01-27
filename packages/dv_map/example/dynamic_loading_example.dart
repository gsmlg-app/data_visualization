import 'package:dv_map/dv_map.dart';

/// Example demonstrating dynamic asset loading with dv_map.
///
/// This approach loads maps at runtime based on ISO codes or names.
/// Note: This bundles ALL assets (~112 MB), so use tree-shakeable imports
/// when you know which maps you need at compile time.
Future<void> main() async {
  // Load world map
  print('Loading world map...');
  final world = await DvMapLoader.loadWorld(MapScale.m110);
  print('World map: ${world.features.length} features');

  // Load country by ISO-3 code
  print('\nLoading USA by ISO code...');
  final usa = await DvMapLoader.loadCountry(
    scale: MapScale.m110,
    isoA3: 'USA',
  );
  print('USA map: ${usa.features.length} features');

  // Load country by name
  print('\nLoading Japan by name...');
  final japan = await DvMapLoader.loadCountry(
    scale: MapScale.m50,
    name: 'Japan',
  );
  print('Japan map: ${japan.features.length} features');

  // Load country by explicit slugs
  print('\nLoading Nigeria by slug...');
  final nigeria = await DvMapLoader.loadCountryBySlug(
    scale: MapScale.m110,
    continentSlug: 'africa',
    countrySlug: 'nigeria',
  );
  print('Nigeria map: ${nigeria.features.length} features');

  // Get metadata about available countries
  print('\nLoading country index...');
  final index = await DvMapIndex.load(MapScale.m110);
  print('Total countries available: ${index.countries.length}');

  // Find country metadata
  final franceEntry = index.find(name: 'France');
  if (franceEntry != null) {
    print('\nFrance metadata:');
    print('  Name: ${franceEntry.name}');
    print('  ISO-2: ${franceEntry.isoA2}');
    print('  ISO-3: ${franceEntry.isoA3}');
    print('  Continent: ${franceEntry.continent}');
    print('  Slug: ${franceEntry.countrySlug}');
  }
}
