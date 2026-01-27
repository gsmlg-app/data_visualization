// Generated from: assets/north-america/aruba.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for north-america/aruba.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE52VTW/bMAyG7/4Vgs9ZwE9R7K0bsOOw2w5DMXid1xlI7MB1D0GR/z7YbYKmVQsoPgiyKD0gxZfUYxVCPe13bX0V6q9tMz2M7Zdhs2lvp27o69Vs/vu0fF9fhZ9VCCE8LuPbg8v2xbAbh107Tt1y6Lg9hLpvtsuB6/Hhd3PaHkLd3Q+/GlpMP96s87L++cxwO/RT17f9NNu+DeP0L1xv27G7bernTYeTN3ftsG2ncX/uy9H578Nmf/cc6wk+jH+6vpleBP30vZy//gvhU/S1e3S2uHplQlqrmSbCM8PN6mOgwRrAUCHlgEkVoxUDJRlHzAAjE4ppMTAignoOSMrOxTz1KJh1EIWEvRxIUUhyQAAAKvfw3SvUxEbxgpARPFJWNQJygWoisLHmgBpdicqBJHkVSkwEUh5xApecaJQNLaYLcgJJszlhRJXyOiGLmiwHJHLWsiTPrUGTxpgLWSITFOZkBpJEy4lGxAjLNPMxDti0nCeK7LmMXApkUMZcHQupG5RpZgZCSkDZjKCZF5Zd9HVKCRxz3V/QClv1jLOltrIBG7uUdcLFP0C3nKZFWTUVe+ioFiF7g26AWg58T4SKTkxlj9Oimcieb1yMRlLWuMof+Co3P84O1XG8qQ7Vf7/fwP6NCQAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/aruba.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaAruba10m {
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
