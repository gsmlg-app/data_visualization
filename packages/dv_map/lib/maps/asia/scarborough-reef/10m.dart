// Generated from: assets/asia/scarborough-reef.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for asia/scarborough-reef.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE72Qy2rDMBBF9/qKQWs3RFbkR3al0HVJliUUxZ24AkdjZGVhgv+9WIlNHg60XVSLYaQz9+pKRwbAfVsjXwJ/Re0PDl+oqrDwhiyPerw7HTd8Ce8MAOAY6r0wjAdQO6rReRNEwzgAt3ofBOtCuy05OpRfsELcjUoAbhr60HE/9ZTnd0BOgIKsNxat79lzYzQ/s24MVCLt0bv2Os6Q/42qtjw/d/Qk92ms9hfvPq3L/nYHIEQ6S5XMsjSObpGaCbWQSS6vwCb6gaHIVLKYNBT9Vb83fJxwPs/+4KeSPJb/E3DiC9lUP3QdG+qGdewbbuGcUPICAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for asia/scarborough-reef.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get asiaScarboroughReef10m {
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
