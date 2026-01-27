// Generated from: assets/europe/jersey.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for europe/jersey.50m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE52STWvDMAyG7/kVwues2HL81WvpDjvtOkYZofNKII1D4h5CyX8fSZqQtobh+SBkvdJjSfiaABDf1ZZsgbza3F8au3NlaY++cBVJB/lnCrdkC58JAMB1tM+FY/oo1I2rbeOLsWhOByBVfh4L3mzT2m7JByBF675yHLX9U5xP8Y+1cHSVLypb+UHbX4YHyU3tlz5O1p2tb7r7Lua2313ZnW5TLlTXfBdV7lfjTmftP94AXnBDmZYCefqgZGaDnKG4Cx/SP2kaEaUM0YTgirFIHiIVVOkQT0ouVBbL40JzE+IxJblUGMljUkjFgzytMoo8dn+GUSZC+/snT3AlwvNKozGLnZdSYxiyYH9UMxr9X2J+XxLyZ69PZntI+uQX0N55OCEEAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for europe/jersey.50m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get europeJersey50m {
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
