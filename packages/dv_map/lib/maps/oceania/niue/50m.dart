// Generated from: assets/oceania/niue.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for oceania/niue.50m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE52SwWoDIRCG7/sUg+c0qOPqmGuh0EvbS08llCU1QUh02ZjDEvLuJSabJo1Qth5knH/m4x91XwGw1LeOzYA9uSbtOvcY12u3SD4GNjnKy1N6y2bwUQEA7PN+35jLs9B2sXVd8rlpKAdgodnkhhe/+6kGYH4bPxuZlfe7POb8842wiCH54EI6aq8L1wTfsLN8uNhYubhxqetvTQyu3+K6X52HvGBj9+VDk66mPa3r+PcJ4EFoOyWOStDkTrJTTsi5oRtlPvmbaCwqTrKIVLI2JEYjCRVHLCBparXmotbjkVrURmIZSbqWOBppORnFyy4tl6jUeKQiRFt+HiOpFuMHtxyJky4hBRqy/B93Oe4PVaV4iA7VsM+rQ/UNBXwvwOoDAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for oceania/niue.50m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get oceaniaNiue50m {
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
