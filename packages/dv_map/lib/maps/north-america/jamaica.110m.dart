// Generated from: assets/north-america/jamaica.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for north-america/jamaica.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WTwWrDMAyG73kKkXNnbNmW7N7KYIfBxu6jjNB5XaCJS+odSum7j6ZNaZfAsA9G1i99/LLxoQAo034byjmUT6FKP114jJtNWKU6tuXsJH+d07tyDu8FAMCh38eNfXkvbLu4DV2q+6ahHKBsq6ZveK6aql5V1waAst7Fjwp78WWU131+cSesYpvqNrTppL3GLn3DogndCXspOl79rENsQur2924G+29xs19fpr3CY/dZt1W6Gfu8buO/J4AHZmHJk5Ru9kdSThgvLVpzJyxn/wLZsybDE0CLBpWzeUAnUDEj0ZRDa6xGlwvUmll5PQFEtJ7YZ49MJBH9CMjCkbKes+8QJWmjxg5ZsFRKEeYBSXiJlpSZdOhQc+YdklDek3XjR2HhHDnibIearLZeTTyKIslSUi7QeSI14dAJI6Ujyhw5+6cUU/EQHYthXxbH4hd+uAeg2AQAAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/jamaica.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaJamaica110m {
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
