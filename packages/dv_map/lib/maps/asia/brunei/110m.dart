// Generated from: assets/asia/brunei.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for asia/brunei.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WSMWvDMBCFd/+KQ7MxkqWTrGxpoWMpXUsoJlWDwJGMrQwm+L+XKLFJYkORBnF67+7jHeicAZAwtIZsgLyZOpw68+qbxuyD9Y7kF/v3KvdkA18ZAMA53svB2B6NtvOt6YKNQ1M7AHH1MQ68dCdn7NwPQGzvv+syeu8LnUf988HYexesMy5cvG1va3LzxjnFwfijCd3wmGEK/eGb4XDbcWb67se6Otwtez339fMLgDEsBFLFKOZPFhZCKFXq6kHf5f/wRIFaa8nEM08UmlLKGE/llVRQJuWShyVWiutUnkSNegVHqZJcJq9bSY2o+JLHRcUZV2k8LLhQQrIVHJOSS5aKExQVpSvxNGJZKpnMS/ot2Vo9VWM23btszP4AsBO6v9EDAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for asia/brunei.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get asiaBrunei110m {
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
