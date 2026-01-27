// Generated from: assets/north-america/antigua-and-barbuda.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for north-america/antigua-and-barbuda.50m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE52UO2/bMBCAd/0KQnNq8MjjPbKlBdqpRYduRVCotuoKsCVDoQcj8H8vrMRGYlNDTwMh8u4+Hu/1XDlX58Oure9d/blt8n5sPw2bTbvM3dDXdyfxn5fjp/re/aycc+55Wm8NJ/VJsBuHXTvmbjI6qztX9812Mnjoc7feN67pV+5jM/7er5qLsXN19zT8asKk+OXmPE7nP94JlkOfu77t80n2bRjzX/ewbcdu2dSvSseLb+t22LZ5PLz37PyUr/tN7r4Pm8P69fmXG4Zx1fVNfhOHl+/t//Xudu/cB4IFA3nCdHcjBF74yB6Ar0SP17plMCkqey6DUTQkMYKFkJHKYFIJGMxgH1Mog1UwcrKB2UvwEYpg8MmzgBEcJTGWPYYoyEQ2sAAHmQkFkCimaAQLg1ecizEgGmMsU4hnkkcRIhrLTZISSZkLMUZvzR1Ory2AaaHKQEZ/DQ1dze3eXWmaLsgAWq78xKgJjL3KqDRXR0QQg7mlmDhxOd+kHlmsBQqqAXQGTGIdLpICIpQjwYCeghVMBBTKuWOPQUmtYOFyfZIkRDWWxGlAq5Qzl5QAg3EYMoVT15TBKCRgBf9/d8y3anX9d6zO62N1rP4BN4Tuw18JAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/antigua-and-barbuda.50m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaAntiguaAndBarbuda50m {
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
