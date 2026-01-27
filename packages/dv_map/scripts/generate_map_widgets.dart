#!/usr/bin/env dart

import 'dart:convert';
import 'dart:io';

/// Generates Dart files for each GeoJSON map asset.
/// Structure: lib/maps/<continent>/<country>/<scale>.dart
/// Variable names convert hyphens to underscores.
void main() async {
  final assetsDir = Directory('assets');
  final mapsDir = Directory('lib/maps');

  if (mapsDir.existsSync()) {
    mapsDir.deleteSync(recursive: true);
  }
  mapsDir.createSync(recursive: true);

  final allMaps = <String, MapInfo>{};

  // Process all JSON files
  await for (final entity in assetsDir.list(recursive: true)) {
    if (entity is File && entity.path.endsWith('.json')) {
      final relativePath = entity.path.replaceFirst('assets/', '');
      final jsonContent = await entity.readAsString();

      // Gzip compress the JSON
      final jsonBytes = utf8.encode(jsonContent);
      final gzipBytes = gzip.encode(jsonBytes);
      final base64Data = base64Encode(gzipBytes);

      final originalSize = jsonBytes.length;
      final compressedSize = gzipBytes.length;
      final ratio = (compressedSize / originalSize * 100).toStringAsFixed(1);

      final parts = relativePath.split('/');
      String outputPath;
      String importPath;

      if (parts.length == 1) {
        // Top-level files like world.110m.json or index-110m.json
        // Extract scale from filename: world.110m.json -> world/110m.dart
        final fileName = parts[0].replaceAll('.json', '');
        final fileParts = fileName.split('.');

        if (fileParts.length == 2) {
          // Has a scale part: world.110m -> world/110m.dart
          final baseName = fileParts[0];
          final scale = fileParts[1];
          outputPath = 'lib/maps/$baseName/$scale.dart';
          importPath = 'package:dv_map/maps/$baseName/$scale.dart';
        } else {
          // No scale part: keep flat structure for index files
          outputPath = 'lib/maps/$fileName.dart';
          importPath = 'package:dv_map/maps/$fileName.dart';
        }
      } else {
        // Continent/country files: africa/nigeria.110m.json -> africa/nigeria/110m.dart
        final continent = parts[0];
        final countryFile = parts[1].replaceAll('.json', '');
        final countryParts = countryFile.split('.');

        if (countryParts.length == 2) {
          final country = countryParts[0];
          final scale = countryParts[1];
          outputPath = 'lib/maps/$continent/$country/$scale.dart';
          importPath = 'package:dv_map/maps/$continent/$country/$scale.dart';
        } else {
          // Fallback for unexpected format
          outputPath = 'lib/maps/$continent/$countryFile.dart';
          importPath = 'package:dv_map/maps/$continent/$countryFile.dart';
        }
      }

      // Generate camelCase getter name with underscores instead of hyphens
      final identifier = relativePath
          .replaceAll('.json', '')
          .replaceAll('/', '_')
          .replaceAll('-', '_')  // Convert hyphens to underscores
          .replaceAll('.', '_')
          .toLowerCase();
      final getterName = _toCamelCase(identifier);

      // Create output directory
      final outputFile = File(outputPath);
      outputFile.parent.createSync(recursive: true);

      // Generate the Dart code
      final dartCode = generateMapFile(getterName, relativePath, base64Data);
      await outputFile.writeAsString(dartCode);

      allMaps[identifier] = MapInfo(
        getterName: getterName,
        importPath: importPath,
        assetPath: relativePath,
        outputPath: outputPath,
      );
      print('Generated: $outputPath ($ratio% of original)');
    }
  }

  // Generate continent index files
  await _generateContinentIndexes(mapsDir, allMaps);

  // Generate world index file
  await _generateWorldIndex(mapsDir, allMaps);

  // Generate top-level index file
  await _generateMainIndexFile(mapsDir, allMaps);

  print('\nGenerated ${allMaps.length} map files');
  print('Index file: lib/maps/maps.dart');
}

/// Generates continent-level index files
Future<void> _generateContinentIndexes(
  Directory mapsDir,
  Map<String, MapInfo> allMaps,
) async {
  // Group maps by continent
  final continentMaps = <String, Set<String>>{};

  for (final info in allMaps.values) {
    final parts = info.outputPath.split('/');
    if (parts.length >= 4 && parts[0] == 'lib' && parts[1] == 'maps') {
      final continent = parts[2];
      if (continent != 'world' && !continent.endsWith('.dart')) {
        continentMaps.putIfAbsent(continent, () => {}).add(info.outputPath);
      }
    }
  }

  // Generate index file for each continent
  for (final entry in continentMaps.entries) {
    final continent = entry.key;
    final indexFile = File('${mapsDir.path}/$continent/$continent.dart');

    final exports = StringBuffer();
    exports.writeln('/// Maps for $continent.');
    exports.writeln();

    // Get all unique country directories
    final countries = <String>{};
    for (final path in entry.value) {
      final parts = path.split('/');
      if (parts.length >= 5) {
        countries.add(parts[3]); // country name
      }
    }

    // Export each country's index
    for (final country in countries.toList()..sort()) {
      exports.writeln("export '$country/$country.dart';");
    }

    await indexFile.writeAsString(exports.toString());
    print('Generated continent index: ${indexFile.path}');
  }

  // Generate country-level index files
  await _generateCountryIndexes(mapsDir, allMaps);
}

/// Generates country-level index files
Future<void> _generateCountryIndexes(
  Directory mapsDir,
  Map<String, MapInfo> allMaps,
) async {
  // Group maps by continent/country
  final countryMaps = <String, List<MapInfo>>{};

  for (final info in allMaps.values) {
    final parts = info.outputPath.split('/');
    if (parts.length >= 5 && parts[0] == 'lib' && parts[1] == 'maps') {
      final continent = parts[2];
      final country = parts[3];
      final key = '$continent/$country';
      countryMaps.putIfAbsent(key, () => []).add(info);
    }
  }

  // Generate index file for each country
  for (final entry in countryMaps.entries) {
    final parts = entry.key.split('/');
    final continent = parts[0];
    final country = parts[1];
    final indexFile = File('${mapsDir.path}/$continent/$country/$country.dart');

    final exports = StringBuffer();
    exports.writeln('/// Maps for $country ($continent).');
    exports.writeln();

    for (final info in entry.value) {
      final pathParts = info.outputPath.split('/');
      final scaleFile = pathParts.last;
      exports.writeln("export '$scaleFile';");
    }

    await indexFile.writeAsString(exports.toString());
    print('Generated country index: ${indexFile.path}');
  }
}

/// Generates world-level index file
Future<void> _generateWorldIndex(
  Directory mapsDir,
  Map<String, MapInfo> allMaps,
) async {
  final worldMaps = <MapInfo>[];

  for (final info in allMaps.values) {
    final parts = info.outputPath.split('/');
    if (parts.length >= 4 && parts[0] == 'lib' && parts[1] == 'maps' && parts[2] == 'world') {
      worldMaps.add(info);
    }
  }

  if (worldMaps.isEmpty) return;

  final indexFile = File('${mapsDir.path}/world/world.dart');
  final exports = StringBuffer();
  exports.writeln('/// World maps at different scales.');
  exports.writeln();

  for (final info in worldMaps) {
    final pathParts = info.outputPath.split('/');
    final scaleFile = pathParts.last;
    exports.writeln("export '$scaleFile';");
  }

  await indexFile.writeAsString(exports.toString());
  print('Generated world index: ${indexFile.path}');
}

/// Generates the main index file
Future<void> _generateMainIndexFile(
  Directory mapsDir,
  Map<String, MapInfo> allMaps,
) async {
  final indexFile = File('${mapsDir.path}/maps.dart');

  // Get all continents
  final continents = <String>{};
  for (final info in allMaps.values) {
    final parts = info.outputPath.split('/');
    if (parts.length >= 4 && parts[0] == 'lib' && parts[1] == 'maps') {
      final continent = parts[2];
      if (continent != 'world' && !continent.endsWith('.dart')) {
        continents.add(continent);
      }
    }
  }

  final exports = StringBuffer();
  exports.writeln('/// Generated map exports.');
  exports.writeln('/// Import specific continents, countries, or scales as needed.');
  exports.writeln();

  // Export continents
  exports.writeln('// Continent exports');
  for (final continent in continents.toList()..sort()) {
    exports.writeln("export '$continent/$continent.dart';");
  }

  // Export world maps
  exports.writeln();
  exports.writeln('// World maps');
  exports.writeln("export 'world/world.dart';");

  await indexFile.writeAsString(exports.toString());
}

/// Converts snake_case to camelCase
String _toCamelCase(String snake) {
  final parts = snake.split('_');
  if (parts.isEmpty) return snake;

  final buffer = StringBuffer(parts[0]);
  for (int i = 1; i < parts.length; i++) {
    if (parts[i].isNotEmpty) {
      buffer.write(parts[i][0].toUpperCase());
      if (parts[i].length > 1) {
        buffer.write(parts[i].substring(1));
      }
    }
  }
  return buffer.toString();
}

String generateMapFile(
  String getterName,
  String assetPath,
  String base64Data,
) {
  return """
// Generated from: assets/$assetPath
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for $assetPath (base64 encoded)
const String _kCompressedData = '$base64Data';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for $assetPath
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get $getterName {
  if (_cached != null) return _cached!;

  // Decode base64 and decompress
  final compressed = base64Decode(_kCompressedData);
  final decompressed = gzip.decode(compressed);
  final jsonString = utf8.decode(decompressed);

  // Parse GeoJSON
  final data = parseGeoJson(
    jsonDecode(jsonString) as Map<String, dynamic>,
  );

  if (data is! GeoJsonFeatureCollection) {
    throw StateError('Invalid GeoJSON format');
  }

  _cached = data;
  return _cached!;
}
""";
}

class MapInfo {
  final String getterName;
  final String importPath;
  final String assetPath;
  final String outputPath;

  MapInfo({
    required this.getterName,
    required this.importPath,
    required this.assetPath,
    required this.outputPath,
  });
}
