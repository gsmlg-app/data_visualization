// Generated from: assets/africa/equatorial-guinea.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for africa/equatorial-guinea.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WRQYuDMBCF7/6KIWeRTNSY9FaW3d6W3fNSltBNS8AmbhoPUvzvi7ZKrcJiDsPkvXkfGXKNAEhoKk02QN60CrXXL64s9SEYZ0nc2cebfCEb+IoAAK59nQf78d6ovKu0D6YPDeMAxKpzH3j9rVVw3qgSdrWxWo1RAGIu7luxbmz3OdPTXn+fGAdng7Hahs7bHr05KHJ32/FJJ+3OOvhm+qBhgw9XNqf7wiPV+R9jVXjY/HYe++cbgEx4JjEXLH4yWMJEKjjHib6P/6GlNOeYzmiYIKcSMVtHyyQTQvA5jSJFlPk6mkgpExku0HghZCrW0BATJnJayAVaXnCOci2t4Fk2o7GEcaQ5XUVb+6fRUj90bTTUfdRGf5MpnP+CAwAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for africa/equatorial-guinea.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get africaEquatorialGuinea110m {
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
