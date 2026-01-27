// Generated from: assets/europe/latvia.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for europe/latvia.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WVTWvcMBCG7/4VwudFzIfmQ7mV0p566KmXEopJ3WDY2MvGKSxh/3tZb3bZxKIgH4SsV/N4RjMjvzYhtPNh17d3of3ad/PLvv88bbf9wzxMY7s5yX/Oy8/tXfjZhBDC6zKuDZfti7DbT7t+Pw+L0WV7CO3YPS0G37r579Bd94fQDs/Tr44W7cdqnc/rn26Fh2mch7Ef55P25eX0wfZNPV79eOynp37eH957cXH7+7Q9PL5FeaVO+9/D2M034Z6f2/nHtxDIIrmjJ998UMRisiTk/E643/yfpzEpCxMXecruVsWTqEAO2Qo8TybkXslDTZJZCrxsgFLnXoqM5EpawFnmRKyVPCQwyiUekGimOv84MnqSUjYAlFilCkdRKHHCEs+E2VJdtWAUR1ctZSMhukHd8WGEDKdDX/E0mrMb1VULRhBxgFTgASOYpsrzI0AUzQUeszlgnX8c3ZyU192rkYzVsM6/FF1BPZXiZSMhr+NJBIDMaV0vuvQhQ+1tIMyQCvWiEQEoa669rXJixjVPoqIgVPIsIlCSvM6HnOqPkevi9YimBrmUD9SMdd1m0UXIqdQckpkqLwOLZgAo62K2SCmROFbyKn9FTWl+mR2by3jfHJt/Ealh7DAIAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for europe/latvia.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get europeLatvia110m {
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
