// Generated from: assets/north-america/bajo-nuevo-bank-petrel-is.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for north-america/bajo-nuevo-bank-petrel-is.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WQy2rDMBBF9/qKQasWHIP8kpRdUyh0E7IvoQh3mqq1JSMrBRP878VObPJwIdZiGOnOPVzNgQBQ31RIl0BfUPm9w2dbFJh7bQ0NOvnz+FzTJbwRAIBDX2+N/XgvVM5W6LzuTcM4ADWq7A0r9W1hvcdfCytlfuBhg95hAa91+DhSAKiu7buKOsdCyhshnhBya7w2aHynra3zX/BUotO5oqehdky5Q1uid81lxuFTG1s0u9MORrh1H9oof7aM4znvr28ACy5DKWQkuAyuJJaGXCYyEdmFsA3uAAqWiGwayHiazgdmsRT/JEyY5POBXETxJC+L2HzarAWSqX7oWjLULWnJHz4JAFsFAwAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/bajo-nuevo-bank-petrel-is.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaBajoNuevoBankPetrelIs10m {
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
