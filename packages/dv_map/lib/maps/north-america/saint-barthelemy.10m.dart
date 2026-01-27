// Generated from: assets/north-america/saint-barthelemy.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for north-america/saint-barthelemy.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE52TTWsCMRCG7/srhpyt7OQ73mqhp7YUeixSgqa6sLuRmB4W8b8XV1f8SCkxhzCZd+Yhb4ZsCwASu7UjEyDPzsaf4J58Xbt5rHxLRnv5+5DekAl8FgAA236/bezLe2Ed/NqFWPVNQzkAaW3TN3zYqo0wtSGuXO2a7tQJQKqN/7J0XzV9ucmzQ/71XJj7Nlata+Nee/MhruCxcaGaW3Is2p0utnS+cTF0l9cafLz7ulsebZ/gPiyq1sYz/4d1Hl+fAB4kHWumtZBydCWhGmuNRnN9IcxG/wMp0xxNEsgolzQbiCVSw1NAQ6kyPBeojDbMpCybknMt7wCiFBJTQBRcUZVtWSiOyFJAKkrGTTZQSkSdGoqhBjmX+UDF/nhDWjJzx5QlMlQiORTBKWX5b1gajimg7secD8z7KUUqHqJdMeyzYlf8AnfSRevhBAAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/saint-barthelemy.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaSaintBarthelemy10m {
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
