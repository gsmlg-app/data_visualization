// Generated from: assets/north-america/trinidad-and-tobago.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for north-america/trinidad-and-tobago.50m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE6VWu27cMBDs7yuIqx1hH+Q+3AUB0uVRuAuM4OJTHAHnkyHLhWH43wPpbMO+o4psVAgilxyNRrO7fFyltB4fbtv1eVp/bjfj/dB+6ne79mrs+v36bAr/Pkzfrc/Tj1VKKT3O99ON8/I5cDv0t+0wdvOml+Uprfebm3nDxdDtu+1mmzb7bbrof22u+9fNKa27u/7nhuaFFyfzfJj/9jZw1e/Hbt/uxyn2tR/GP+njTTt0V5v186KnV27XbX/TjsPDe2Yvn/Llfjd23/vdw/Xz57++oR+23X4zvtHhcL19Ph6djlP6INBoEXKzs5MgYoNqBYschS6P19aBS5ZsOVeBSVgJNAhMJZtxFZipsEOUsZD6Ei4XLhTDVTDnUupKqFIWjAEbZHLxOjAYu+UgMILkXGeMYgJcglL8u9tWS6N3r/x362MDSAhecyg0yJlJQj8cG4CMgFIHFjUijsnn7rLEmASz5qD1XSwXreIyMZuFcnWSWDII1YFNWKO4rDV3QpONSEvI9hNbZy61fIKmFEMoIdtPdFkz1GUQcdOwH0TJ6kooCgoFK4ujCtX9YBmIc1ThQ47XgXmSP2TgqXiwMtSVMGAmCEmMDSsA+oLELhYuEnN75FophEan6suhf4dNcVxMZs3q2YOMpSAq1tND0UAk6ArhwrBgN3FniXVebEoGx7rE8j8SZzcjwzowm4lGTaFGinW3CTCLRxnL1BzqjAubS7aoFM4oSy3JSsnBEl/IrOgCcGGkYC0WJsVcNwVlzmDR9Dg04HrXdxSP5p2DIHDdFCCOOXbgxUYVRb2ed2AFigWBi8sysMyVL1rmM4nWNQY1oFgnDZ0Flw+mq+Onp9XL/XL1tPoLfVFF3eoOAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/trinidad-and-tobago.50m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaTrinidadAndTobago50m {
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
