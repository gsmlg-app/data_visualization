// Generated from: assets/europe/vatican.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for europe/vatican.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE62RTYvCMBCG7/kVQ85Fmo+mxpss69mDeBFZQjcrgZqUGA9F+t+l6VZa7bJ02RyGyTx538wkNwSAQ11pvAK80SpcvX5zZamLYJzFSYu/uvIFr+CAAABuMb4K4/EIKu8q7YOJov44ALbqHAV7FUyh7EMAgM3FfSga4fqlzrr6bggKZ4Ox2oaWvV/bG/E3bR6NnLQ76+DrcRt931tX1idnx67OfxqrwmDebg3z5x0AoQueMcKETJ4IJwuZ0jwjcgSOye9+PGUZ/0c/JpdUTPqxpfiLX8oInfaThOez/Wgufng/xtn89mhOOJm2S4mg88ed871oKu+zBvXxiBp0By+7BIWFAwAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for europe/vatican.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get europeVatican10m {
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
