// Generated from: assets/asia/bahrain.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for asia/bahrain.50m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WTTWsDIRCG7/srxHNYdJzxI7e2UHosvZZQltSmQqJhYw8h5L+XbLohyQrFPcg4r/PwjjseGsZ43m89nzP+7Lv80/untF77ZQ4p8tlJ/jqnd3zO3hvGGDsM67RwOD4I2z5tfZ/DUDQeZ4zHbjMUPHbffRfipYAxHnbpo4NBfJnk1Tn/di0sU8wh+phP2sMudPxPO15srHza+Nzvb02Mrl/Ter9K8ZaZ+s8Qu3zV7fm7ju93jJFotTAAWs/uFKDWWiUF0Y2wmP3LkwatoAlPt0KAQmVqecIZTVN/upWAqMFV8oiMlVDyJ50FJ2txlpwyJRzg6WZr2yWNQhftAWpU1b8DtXMgXYkH1hHV9osEiBKL1ycsCFXLsw5JydK4kEU01TxNTtrCNDtNBNU4QhSoSo9DKXS6eloMOgFFntDGmlpe5eNtSvEYHZtxXTTH5hdtfcpcYQUAAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for asia/bahrain.50m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get asiaBahrain50m {
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
