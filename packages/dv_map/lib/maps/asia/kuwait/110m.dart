// Generated from: assets/asia/kuwait.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for asia/kuwait.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WSTWsCMRCG7/srQs4SJpPP8VYKvfTSQ6GHImWxqQTWjayRIuJ/L66uqLtQksMwmXfm4Z2QQ8UYz/tN4HPGX0Kdd114Tk0Tljmmls9O8s+5vOVz9lkxxtihj+PBvr0XNl3ahC7HfmhoZ4y39bofeN391jFf+xnjcZu+auy1j1Fdnevvt8IytTm2oc0n7Wkba37RjlcXq5DWIXf7ew+D6bfU7FeXHa/M1H3Hts43y57Pbf54Y0w7QU4bSXL2oCAJcsZLwjthMfuPpwAt4oinQIAhsERFPCuM9U4qPeEPiABNqT9tyKP0UzxAI0kX8hx4b8CMeF4YtGDRFfG80NICaZziGQTQqpAHpEgrNbGvAotEpTzplfR+vC8Jo7R21ha+X+H/q6byITtWQ1xUx+oP75AJBiMEAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for asia/kuwait.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get asiaKuwait110m {
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
