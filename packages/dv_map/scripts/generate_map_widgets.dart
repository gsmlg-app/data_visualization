#!/usr/bin/env dart

import 'dart:io';

/// Generates Dart files for each GeoJSON map asset.
/// Organized as: lib/maps/<continent>/<country>/<scale>.dart
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
      final content = await entity.readAsString();

      final parts = relativePath.split('/');
      String outputPath;
      String importPath;

      if (parts.length == 1) {
        // Top-level files like world.110m.json or index-110m.json
        final name = parts[0].replaceAll('.json', '');
        outputPath = 'lib/maps/$name.dart';
        importPath = 'package:dv_map/maps/$name.dart';
      } else {
        // Continent/country files like africa/nigeria.110m.json
        final continent = parts[0];
        final countryFile = parts[1].replaceAll('.json', '');
        outputPath = 'lib/maps/$continent/$countryFile.dart';
        importPath = 'package:dv_map/maps/$continent/$countryFile.dart';
      }

      // Generate camelCase getter name
      final identifier = relativePath
          .replaceAll('.json', '')
          .replaceAll('/', '_')
          .replaceAll('-', '_')
          .replaceAll('.', '_')
          .toLowerCase();
      final getterName = _toCamelCase(identifier);

      // Create output directory
      final outputFile = File(outputPath);
      outputFile.parent.createSync(recursive: true);

      // Generate the Dart code
      final dartCode = generateMapFile(getterName, relativePath, content);
      await outputFile.writeAsString(dartCode);

      allMaps[identifier] = MapInfo(
        getterName: getterName,
        importPath: importPath,
        assetPath: relativePath,
      );
      print('Generated: $outputPath');
    }
  }

  // Generate index file
  await _generateIndexFile(mapsDir, allMaps);

  // Generate continent index files
  await _generateContinentIndexes(mapsDir, allMaps);

  print('\nGenerated ${allMaps.length} map files');
  print('Index file: lib/maps/maps.dart');
}

/// Generates the main index file that exports all maps
Future<void> _generateIndexFile(
  Directory mapsDir,
  Map<String, MapInfo> allMaps,
) async {
  final indexFile = File('${mapsDir.path}/maps.dart');

  final continents = <String>{};
  for (final info in allMaps.values) {
    final parts = info.importPath.split('/');
    if (parts.length > 4) {
      continents.add(parts[3]); // Extract continent from path
    }
  }

  final exports = StringBuffer();
  exports.writeln('/// Generated map exports.');
  exports.writeln('/// Import specific continents or individual maps.');
  exports.writeln('library dv_map.maps;');
  exports.writeln();

  // Export continent indexes
  for (final continent in continents.toList()..sort()) {
    exports.writeln("export '$continent/$continent.dart';");
  }

  // Export top-level maps (world, index files)
  for (final info in allMaps.values) {
    if (!info.importPath.contains('africa') &&
        !info.importPath.contains('asia') &&
        !info.importPath.contains('europe') &&
        !info.importPath.contains('north_america') &&
        !info.importPath.contains('south_america') &&
        !info.importPath.contains('oceania') &&
        !info.importPath.contains('antarctica') &&
        !info.importPath.contains('seven_seas')) {
      final fileName = info.importPath.split('/').last;
      exports.writeln("export '$fileName';");
    }
  }

  await indexFile.writeAsString(exports.toString());
}

/// Generates continent-level index files
Future<void> _generateContinentIndexes(
  Directory mapsDir,
  Map<String, MapInfo> allMaps,
) async {
  final continentMaps = <String, List<MapInfo>>{};

  for (final info in allMaps.values) {
    final parts = info.assetPath.split('/');
    if (parts.length > 1) {
      final continent = parts[0];
      continentMaps.putIfAbsent(continent, () => []).add(info);
    }
  }

  for (final entry in continentMaps.entries) {
    final continent = entry.key;
    final maps = entry.value;

    final indexFile = File('${mapsDir.path}/$continent/$continent.dart');
    final exports = StringBuffer();
    exports.writeln('/// Maps for $continent.');
    exports.writeln('library dv_map.maps.$continent;');
    exports.writeln();

    for (final info in maps) {
      final fileName = info.assetPath.split('/').last.replaceAll('.json', '');
      exports.writeln("export '$fileName.dart';");
    }

    await indexFile.writeAsString(exports.toString());
    print('Generated continent index: ${indexFile.path}');
  }
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
  String jsonContent,
) {
  final escaped = jsonContent.replaceAll("'", r"\'");

  return """
// Generated from: assets/$assetPath
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for $assetPath
const String _kGeoJson = '''$escaped''';

/// Parses the GeoJSON for $assetPath
GeoJsonFeatureCollection get $getterName {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
""";
}

class MapInfo {
  final String getterName;
  final String importPath;
  final String assetPath;

  MapInfo({
    required this.getterName,
    required this.importPath,
    required this.assetPath,
  });
}
