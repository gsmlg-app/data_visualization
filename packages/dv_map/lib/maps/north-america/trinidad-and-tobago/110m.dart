// Generated from: assets/north-america/trinidad-and-tobago.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for north-america/trinidad-and-tobago.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WRwWqEMBCG73mKIWcrpmLUvZVCj20P3spSUs3agGYkmx5k8d3LxlXc3UCbHMLkn/k/ZiYnAkDtOEi6A/oihf0x8hm7TtZWoabROX2Y5SPdwQcBADi5+97oyl1iMDhIY5UzLeUAVIveGSqjtGpEA0I3UOGXaHE1A1B1xE/x6AqrOz2d9bdtokZtlZbannOvaOw3PPXSqFrQS9G09tZK7KU143Vnyyjv2I3tZfIVjqZRWtjNCuazjW9fAA+cxbyIblSWxDm/0vbR3xjuwaQ8C+WUmYeTlKGYPPdhwihJXKa+bhgL5RTeqYoseDss8YKC1/OvTye+eIkmstx7MpFf/wt7H6UDAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/trinidad-and-tobago.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaTrinidadAndTobago110m {
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
