// Generated from: assets/europe/monaco.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for europe/monaco.50m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WRTYvDIBCG7/6KwXMoMaNRey3d27J7X8oSsm4JpBpSewgl/32JaUI/hEUPwzjvzOM7eCUA1A+doVugb6byl97sXNua2jfO0mySf+fymW7hiwAAXEN8HQztQeh615neN2FoaQegtjqFgXdnq9qt/QC0Obvvqgja7qWOc/3jXqid9Y011k/a/jI9SG/quPo4Gncyvh8eXSy2P107HG9brlTX/zS28nfrzuc+f74ByA1HVUqmsyeB40aKnKMWD8Ih+xdXasZZDFcyLnmZiGOcC4ziZK604mk41CJnWkTdCcQikabyXKqoOYFFUchEnJQSOY/hkElUmPoTSR9LYvmSjWSJBzKSP8BnKIh9AwAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for europe/monaco.50m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get europeMonaco50m {
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
