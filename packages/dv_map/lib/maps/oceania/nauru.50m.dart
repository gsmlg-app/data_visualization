// Generated from: assets/oceania/nauru.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for oceania/nauru.50m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE62SPWvDMBCGd/+KQ7MbJOs7a6FjWwqdSijCVYPAkYwjDyb4v5fYsXESDXWphuN0793Dq49TBoBiV1u0BfRkTWwb+xiqypbRBY/ys/w9lo9oCx8ZAMBpiPeDQ/sg1E2obRPdMDS1AyBvDsPAs2mbdm4HQO4YPk0xSG93dTrW35dCGXx03vp41l5Ka7wz6CL3s4+9DQcbm+7axWT7NVTd/nLKGRuaL+dNXBx3XMv8dgdAhNhorqhWLL+RHvCGEyEwEVfCLv8FkAvBSALItNCykKuBVGnBVAqoNOWcrwYSyiUrkg41KQhZDcQSU0JTd1hQSfEfHAqGRRLIBFOM/d8dco6lIsX6V171bbJUPmV9NsVd1mc/TYkgYt0DAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for oceania/nauru.50m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get oceaniaNauru50m {
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
