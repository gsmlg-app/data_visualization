// Generated from: assets/asia/syria.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for asia/syria.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5VWy2rcQBC871cMOpumX9MP30Ig55CcQjBhcRSzYK/MWjksxv8eVvYa2yMCo4MYTc0U3VOlkh43pQzz8X4cLsvwZdzOfw/j5+n2dryed9N+uDjBf56nH4bL8nNTSimPy73duCxfgPvDdD8e5t2y6by8lGG/vVs2fD8edtvX5aUMu4fp15YX6EczL8/z394C19N+3u3H/XzCPj3stsML9vRaxM043Y3z4fi+hHPNX6fb481Li6+c0+H3br+d3/T6fL0df3wqRSo4ZVLwxUeEwTEpWd8BVxf/5zMIUTSmFT4hTvHaxRfgyaJYGz4B8bCwrvqUANGoRjZ8CkopztLJJyFpVRq+CsYhZNbJx5GO3vZrIDWCtJcvxNG01dfAsEaV6OJjEM2a1OrrwJzh3KXvqV9ijGz7dUBXqZ16IJgL12z1cMAk9j6/SEJlroFr5+dk2Hl+EmCZkaSrfJzsffUFkLnzql8SiQn7+BzQzG1FXwNjQTHuzAOX1NRWD4Mgr4x9eWBgJ8+2r68B17TM3vKUvFZcaxcVjbyTjjTdOFbSIJiqaB9fhcSKLK37KighYvadXoXMUOTWLQqmmtQb9qpBuRIuCjUlpfaqYUS+poYCI3lEV/idNDRTw/ZlEwjWpM6P2yIiIfoKH7srW68cISZprZsZwoJYusLv9DFH9Gzdx0tWkfS6r/PfYLM2Po+eNuf71eZp8w8k7YEKvgkAAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for asia/syria.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get asiaSyria110m {
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
