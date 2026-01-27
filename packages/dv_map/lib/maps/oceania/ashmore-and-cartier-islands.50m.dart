// Generated from: assets/oceania/ashmore-and-cartier-islands.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for oceania/ashmore-and-cartier-islands.50m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WQO2vDMBCAd/2KQ7MTqpdtZSuBQqd2L6EIW00EtmQkdTDB/71YiU0ehmINx0nf3cedzggAx77TeAf4Tav46/XeNY2uonEWZyP+uTwHvIMvBABwTvG5MZUn0HnXaR9NaprKAbBVbWp4DafWeQ3K1rBXY6GH99AoW4dZAoBNcN+Kjg0bKZ8AWwCVs9FYbePIPiqtrFH4iod5vKN2rY6+vx9u2ubTNf3xuvysdb42VsWbX7ic2/zxBkAo2wrJBSM0e0AbQrecirxk+R05ZP8bC8rzF7lsZJKKcr2REc7FopFxUshitVEKSni5bBSSFWK9cd0/oqV8ygY0xQMa0B+nFYuCBgMAAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for oceania/ashmore-and-cartier-islands.50m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get oceaniaAshmoreAndCartierIslands50m {
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
