// Generated from: assets/asia/qatar.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for asia/qatar.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WSQWsCMRCF7/srhpwlzCSZJOtNCj230FuREmwqC7qRNT2I+N+LqyvqLoXkECbzZj7egxwrAJEPuyjmIF5jyL9dfEmbTVzlJrVidpZ/Lu29mMNnBQBw7O/xYj/eC7su7WKXm35pGAcQbdj2C+8hh+42DiCaffoKqpcWo76+9D/uhVVqc9PGNp+1xb4J4qqdbibWMW1j7g6PFgbPb2lzWF8j3pip+27akO+yXs59/fwCYJSekNDr2ZOijHRsnFH8ICxn//NIEilDbCZ4zFZrrAt52tcWnZ/gWeW0t4U4i9Yh8gjHUhFbh6Vx2dfo/NgeS49EpHwhT3lrLNkRz0oiw14V4pC0ZnITOERb1+SKeCid0TXhVFzjlVGmzF/x76um6qE6VcO9rE7VH/D4raEgBAAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for asia/qatar.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get asiaQatar110m {
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
