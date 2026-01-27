// Generated from: assets/europe/liechtenstein.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for europe/liechtenstein.50m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE52UTWvDMAyG7/kVxudSZNmy7F5HB4Mddh9llM7bAq1dUvdQSv/7aLqUfngMLwej6JWeyHmd7BshZN6tg5wI+RjmeduFh7RchkVuU5Sjo/xxSm/kRLw2Qgix79f7xr68F9ZdWocut33TUC6EjPNV3/DchsVXDnGTQxvPbULIdpPe5tiXPN3l9Sk/vRQWKeY2hpiP2nR7fK78UQ/ncT5DWoXc7a6HGaZ/ScvdZ4rX1NS9t3GeL3Z9ui7j2zsh/JgcIGszuhEMj4FYs77Kz0Z/0TwxaFWiMTkNqg5nFZCxvoBTwAqdr8SBUqyKOI3gaqcjVo6pRCP2CrCSRsRWcQnnyHhXS1PABgs0VIhElW+ODP6yV9RGaajFaeuULR06JGO140ocMmlfOnXIwFRphHEGmXXJCEZLthbH3ngsOQGeCWqNNY6tp9J0YP9jLKA22pVxbEztJ1H1N2lK8RAdmmGdNYfmG6XkU074BQAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for europe/liechtenstein.50m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get europeLiechtenstein50m {
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
