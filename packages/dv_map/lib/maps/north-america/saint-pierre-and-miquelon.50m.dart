// Generated from: assets/north-america/saint-pierre-and-miquelon.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for north-america/saint-pierre-and-miquelon.50m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE51VTYvbMBC9+1cIn7dG0mi+9lYKvaUEeixLMVnt1pDYqdc5hCX/vSSblE0iX8YHYWlmnsbPT0/vlXP1tN/m+tHV33M77cb8bViv82rqhr5+OIZfPpbf6kf3q3LOuffTeF94Sj8FtuOwzePUnYou6c7Vfbs5Ffxsu35yyy6PY3Zt/+wW3d9dXp93PCd3b8PvNh7Tl4u7dTjBXAdWQz91fe6nY+zHME5/3NdNHrtVW5+TDv87fM3DJk/j/rq/ywctduupWw7r/et1S6thGJ+7vp0+sfHxfH6/nd3PnfuC1AT0DDE93AUTNUwx+Qg3oafb3Blg0IgsZWAWohiswAwIWAQWH5AiGoExEhCXgUPwkoy4gh6FZhrmyGgEjl4Da7lhVokpRiNwgkhhBpg4CFsp5kCzHWMUMDZsUHE1N7va0nKkIrEXLStfQBITGX8LYiKZESh5FTKe1SjKmrQMrKpmE4CQRGNZ+oogyFbpswBpKABz4wG9V7FSMecu3Hj2qmS0LaBESUoS5carKCejKoBZY/FMceNFEb2RChDSkGY4JlYSNgIDKGDZwRWQUjLaC0BEKnJMjQZUIisVzDFRiQpqjgcayWhc8FE9c+doArCqAlNQjTN3A0Kw3pIGd5u32ur27VBdxqfqUP0DrgMH3RoKAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/saint-pierre-and-miquelon.50m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaSaintPierreAndMiquelon50m {
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
