// Generated from: assets/asia/singapore.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for asia/singapore.50m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WSTWvDMAyG7/kVwudSbMtf6m0Mtmthx1FG6LxiSO2QeodS+t9H06akTWDYByHrtR5e2T5VACwfW89WwN58nX87/5qaxm9zSJEtLvLPtXxgK/isAABOfZw29sd7oe1S67sc+qbhOACL9b5v+AhxV7dp1ALAwiF91bKX3yd1vNbXY2GbYg7Rx3zRXg6hZjftfDey82nvc3d8tDH4XqfmuLuNeWem7jvEOo/mva5x/rwDEByXZMhKYxbP0hJRKKXxob5Z/M8jg87YGZ7REpUq5hnukNwMj6REU+6PO3JKTXlKaDLGlfKcsGTcjD+lLLe82J/lWlqc8ydRodWlPKO5II0z9ye1RivK5yWSgqY8aTQ6TuXvW/L/qrl8yM7VEDfVufoDGnEyOCYEAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for asia/singapore.50m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get asiaSingapore50m {
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
