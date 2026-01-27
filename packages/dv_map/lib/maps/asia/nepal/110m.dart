// Generated from: assets/asia/nepal.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for asia/nepal.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WVTWsbMRCG7/4VYs9hmC/NR26l0FMpuZdQTLoNBsdrnO3BBP/3EicOSbQUtAeh1Ss9vDPSSE+rUob5uB+H6zJ8G9fz38P4ddpux7t5M+2Gq2f5z8vw43Bdfq5KKeXp3LYLz9PPwv4w7cfDvDkvukwvZditH84Lfoz79fZteinD5nH6teazdNOMy8v49/fC3bSbN7txNz9rXx436+FVO72ZuB+nh3E+HD9auHi+mbbH+9cQ35jT4fdmt57fxfryve9//islAohRFf3qk8IO4VaV/INwe/V/nkFWrbSES1c2ii5chWARymx4AYxS3TpxSGQSvIAzZXftwimwaPVsow0IyUjpS55AZGRKg0sQRmajTpyIE1Va4KmJC/Vlj0HYK7F95gkCUWWLPn8ElWug1gWeMnvn0SMgIq7WhPtsL0QDs4uHoG7O1B6WBOcMq9zJwwjlNlwO8FR17E0fVmdst4MDlAyzSicvMzNcl2qXq3r2xSsgqKzR1q6DmFasffurYF6RfInHoonU568CV3KPNn8GzkYZfbeBAbJKcuvPwAQztK/cHJhdvT1+BpIe2VltAWjI4u1lZaCkRrUv3AByDdT2tjIIQsXO8ghAFRKOhe1VrUHRl77ul2211L/0TqtLe7s6rf4BgpRgPXwIAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for asia/nepal.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get asiaNepal110m {
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
