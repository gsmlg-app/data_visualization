// Generated from: assets/oceania/coral-sea-islands.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for oceania/coral-sea-islands.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE62PT2vDMAzF7/4Uwue0xE6axL0WBjt1sOMow6RaMbhWcNxDKPnuI24T+ic7jM0HIfmn99A7MwAeugb5GvgL6nDyuCFrsQ6GHE8G/HX5bvkaPhgAwDnWZ2Fcj6Dx1KAPJorGdQDu9DEKNuS1hXfU8Npa7fbtJAXgpqVPLYe1hVJPIJsBNblgHLowsG2N2hnNr7ifjjogHTH47v6kMcMb2e5wjTzZkt8bp8NN9su77R8nALHKl5kSsirK5AEtpFimWZrmmbwju+RPjrIqcyF+7VhVK6F+cFRpUZT/eeNcajbXj13PxrpjPfsGhpT7mKoCAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for oceania/coral-sea-islands.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get oceaniaCoralSeaIslands10m {
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
