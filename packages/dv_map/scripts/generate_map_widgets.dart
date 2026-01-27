#!/usr/bin/env dart

import 'dart:io';

/// Generates Dart files for each GeoJSON map asset.
/// Each generated file contains a const String with the GeoJSON data.
void main() async {
  final assetsDir = Directory('assets');
  final outputDir = Directory('lib/maps');

  if (outputDir.existsSync()) {
    outputDir.deleteSync(recursive: true);
  }
  outputDir.createSync(recursive: true);

  final allMaps = <String, String>{};

  // Process all JSON files
  await for (final entity in assetsDir.list(recursive: true)) {
    if (entity is File && entity.path.endsWith('.json')) {
      final relativePath = entity.path.replaceFirst('assets/', '');
      final content = await entity.readAsString();

      // Generate Dart-safe file name (lowercase with underscores)
      final fileName = relativePath
          .replaceAll('.json', '')
          .replaceAll('/', '_')
          .replaceAll('-', '_')
          .replaceAll('.', '_')
          .toLowerCase();

      // Generate camelCase getter name
      final getterName = _toCamelCase(fileName);

      // Create Dart file
      final dartFileName = '$fileName.dart';
      final outputFile = File('${outputDir.path}/$dartFileName');

      // Generate the Dart code
      final dartCode = generateMapFile(getterName, relativePath, content);
      await outputFile.writeAsString(dartCode);

      allMaps[fileName] = dartFileName;
      print('Generated: $dartFileName');
    }
  }

  // Generate index file that exports all maps
  final indexFile = File('${outputDir.path}/maps.dart');
  final exports =
      allMaps.values.map((fileName) => "export '$fileName';").join('\n');

  await indexFile.writeAsString('''
/// Generated map exports.
/// Import only the maps you need for tree shaking.
library dv_map.maps;

$exports
''');

  print('\nGenerated ${allMaps.length} map files');
  print('Index file: lib/maps/maps.dart');
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
  // Use single quotes for the JSON content to avoid escaping issues
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
