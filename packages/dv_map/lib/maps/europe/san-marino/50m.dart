// Generated from: assets/europe/san-marino.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for europe/san-marino.50m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WRTWvDMAyG7/4VwudQ4s/YvY7tVhjbcZRhOq8YUju47iGU/PeRpAlpaxjxQch6pcev8BUB4NQ2Fm8Bv1mTLtG+hLq2h+SCx0Uv/47lM97CFwIAuA7xeXBoH4QmhsbG5IahqR0Ae3MaBj6Nh52Jzod5BgC7c/g2dNB3T3U21j+WwiH45Lz1qddeL/2j+KZ2s5ejDSebYnvvZLL+Hur2eNt0pob447xJi5XHs8wfbwCEbrgSVDBdPCicbXRJOJF39X3xH04QLrniOZygulJiLa9kFSmz9pSuuCQreZwTQhjL8iinRK/kMS1VJXI4xkVVsrX2qGSyohme0rzURK3lrfpdlMunrENT3KMO/QGJJApAhgMAAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for europe/san-marino.50m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get europeSanMarino50m {
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
