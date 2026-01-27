// Generated from: assets/seven-seas-open-ocean/clipperton-island.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for seven-seas-open-ocean/clipperton-island.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE52RTWvDMAyG7/kVwqcN0mIpH457LQx2G+w4yjCpWgKpHRJvEEr/+0jalH74sNYHIft99ViW9xGA8H3DYgHijY3/aXnp6ppLXzkr4kHeHI87sYCvCABgP8b7wtE+Ck3rGm59NRZNdgBhzW4sWNZVMxichfeuNnZ9LgUQVee+DQ22mdZ3QhIQSmd9Zdn6QfvkX7bQsengxTVswZVs7Ks42Q/nJrfsduzb/rrF6U0fru63pxGcr3HturLGX8ziuC7z2x3ADKWeE5KkLItvNJTzRFKudHElrOJ/ECnTKQaJiJKQHicmKaWUBHtUmopneiwk5ipAJE2Y4uNALDKV5yFggVmO+RNEmWSKgsRCUfIE8KGfjkL5lB2iKa6iQ/QH6pjHN64DAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for seven-seas-open-ocean/clipperton-island.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get sevenSeasOpenOceanClippertonIsland10m {
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
