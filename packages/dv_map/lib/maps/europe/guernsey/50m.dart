// Generated from: assets/europe/guernsey.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for europe/guernsey.50m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5VRy2rDMBC86ysWnd1gPaxHrqXNtddSQjGpGgyOZGz5YIL/vViOjZMIinRYVjua0Yx0RQDYD43Be8DvpvR9a15dXZuTr5zF2QT/zuMO7+ELAQBcQ30mhuMBaFrXmNZXgbQcB8C2vATCoTet7cywMgBw1bnvkgb08DRn8/xzC5yc9ZU11k/YWz9diW/ouDo5G3cxvh3ufSzGP1w9nG85V1XX/lS29JvA89r2jzuAF7orCGU5l9kDwvWOa14wQu+AY/avHs2VVjyiV+SCaqVS9TglShZxvUKTVD3BBeFUxPIKRQnVqXpM54RF36/INZUyOa9kgrGYHlWS5Kn+Ev8XxfqlG9FSj2hEf4gHQ/GHAwAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for europe/guernsey.50m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get europeGuernsey50m {
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
