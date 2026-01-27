// Generated from: assets/north-america/sint-maarten.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for north-america/sint-maarten.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE62STWvDMAyG7/kVwuesWPFH7N7GYLeOwS6DUYbJvM6Q2MX1DqX0v4+mS0laX8Lmg5D1Sg+SrUMBQNJ+a8kSyKM16Tvah9C2tkkueFKe5M9zeEeW8FYAABx6e1vYp/fCNoatjcn1RUM6APGm6wtenE+wMiYm6y9VAMTtwrup+ozXmzg7x1djoQk+OW99OmlPIaYvuO9sdI0hv0nHS1MbGzqb4n7a0jDDc2j3m+Cn8BA/nDdpNPv5jP3rG8CdZAukNaWcl1cSqgWVFaLWE2Fd/gUoNK/FbB4qpYTO8pBrXc8HVlhXOR5nlMlqLo/qWnIhc0AmtJA4G8iorLIDo0akfDYPayFVvkHGNM7+EqqEUjL7hEIJRPaPO5NbwiLnD96xGOy6OBY/577HuTgEAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/sint-maarten.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaSintMaarten10m {
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
