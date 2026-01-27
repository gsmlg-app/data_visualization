// Generated from: assets/oceania/pitcairn-islands.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for oceania/pitcairn-islands.50m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE52SP2vDMBDFd3+KQ7MbpDvZsrIGCl3a7CUU4ahB4EjBVocQ8t1LlDjkj4a6GsTp3r0f90CHAoDF/c6yObBXa+JPbxeh62wbXfCsPMnf5/bA5vBZAAAc0v1sTONJ2PVhZ/vokmkcB2DebJNh6WJrXO/hbeiMXw9XJwBzQ/gymKben/qU+os7oQ0+Om99PGkfrTXeGXaRj9eVNjZsbez39wuNCZah228uga/Y0K+dN/Em+fnc1o8vgBeBzQw1543S5aOGckZaUU10p6zKPyEb5JRF1rKWjZyMJE61oDySqNLUTEcSF6iyRCSUiNOJFRe6yi8pOZL8R26JolFVFqm44iSmI5HXlcxvqbXiajoxx5ICK62mw6b+xyJXj9WxGO9VcSx+AWJKm+JDBAAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for oceania/pitcairn-islands.50m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get oceaniaPitcairnIslands50m {
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
