// Generated from: assets/north-america/saint-lucia.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for north-america/saint-lucia.50m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE52STWsCMRCG7/srhpztksnXJN5E6ElKocciZbGpDehG1ngQ8b+XXV3R7kJJcwiTeWceMh+nAoCl486zKbBnX6VD4+dxs/GrFGLNJq38dXHv2RTeCwCAU3cPE7vwTtg1ceebFLqkPhyA1dW2S3irQp1gcViF6pYEwMI+flSiDVjMB3558c/uhVWsU6h9nVrtJTbpG2Zb34RVxa5B59uf1j5ufWqOjz/qS3iNm+P6WvENHpvPUFfprvTLubd/vwCeDC+t0wKVnfySUJZWoCNBD8Jy8jfQGjJkBkBVckSUwuYCHbfItR4DOim1U9lApbTlOAYkYTWabKAzhhyNlsydJJ0HxJIbqUmJkaE41JqMyAaSRKWGPZSlNf8DGm7GgWRlO67sHmpUONwaWRKSJovZa5i318WY3Vvnor+Xxbn4AWNt2jCKBAAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/saint-lucia.50m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaSaintLucia50m {
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
