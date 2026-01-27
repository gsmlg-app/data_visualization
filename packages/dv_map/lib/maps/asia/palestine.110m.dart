// Generated from: assets/asia/palestine.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for asia/palestine.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WSTWvDMAyG7/kVwucSbMvyR29lbOfCjqOM0HklkMYl8Q6h5L+Ppk3XD8OwD0LWaz28Ej4WACwOB8+WwN58FX86/xKaxm9jHVq2OMnf53LPlvBRAAAcp/jcOD2fhEMXDr6L9dQ0PwdgbbWfGtZV4/tYt38tAKzuw2clJ/n9qY7n+uutsA3tidHGk7bq64pdtPFqZOfD3sduuLcx+16HZthdxrwyQ/dVt1W8mfd8bvPHGwBSic6Q5mbxqIhSWcetvqtvFv/hSJEk4RI4YyVxZfN5WhM+8WSJDp2TmThh0SFP4QglCW6yeKp0RmmV3J7VmqzETH9SknVCp9ZHCpUQ2f44cZ3iaaGNsZTLk0ZxSwkeEioklTlv3u8rUvmcjcUcN8VY/AJQ3yvHIwQAAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for asia/palestine.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get asiaPalestine110m {
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
