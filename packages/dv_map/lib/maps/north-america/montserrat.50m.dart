// Generated from: assets/north-america/montserrat.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for north-america/montserrat.50m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE52RTWvDMAyG7/kVwues+Ntxb2Ow28bYjqMM03ldILGD4x1CyX8fdZqQtoGR+SBkvdKDXnTMAFDsGou2gB6tiT/BPviqsvtYeofyk/w1lFu0hfcMAOCY4u1gak9CE3xjQyzT0NgOgJyp08CTd7G1IZg4zQCgsvUfhib97abOhvrrXNh7F0tnXTxpzz7Eb7ivbSj3Bp2b+mmlg/W1jaG7XGh08OKr7nA2PMF9+CydiTPnw5vn1z+AO0k3hBecKZFfSURuFMeM0Yv6Lv+bp4QqCF3gFVgLhdlqoCZMKL4I5ExzsRZIKcNc6iXHgghJ/wEkkuEloNRaEKJWWxac8mKJVxCKyfqbrLpxtpSPWZ+NcZf12S/v6mLclAMAAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/montserrat.50m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaMontserrat50m {
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
