// Generated from: assets/north-america/the-bahamas.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for north-america/the-bahamas.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE7VUS2vDMAy+51eYnDvjZ+T0tg7GLhuD7TbGCJ3XBpK4pO6hlP730fRBm6iwCuaDsV6fJeuTNwljaVwvfDpm6aMv4qr1D6Gq/DSWoUlHO/PPXr1Mx+wjYYyxTbcPAzv3zrBow8K3seyCju6MpU1RdwHvc88mxbyoi+UpiLG0XIavQu0cJm8Dve70TxeGaWhi2fgm7mwvoY1zdl/7tpwW6cFpe8pp5kPtY7u+zOhYwvOqiuVrqNazQ9mnG0L7XTZFPKt/v87PfWkoM3YHjuduNNCrjEPe03723a7ASRTOKAoccKdQOOuIcBaFc4ZWrMWLdUB8u7+2IrkmXVx0OxuAQ46kAFyQHgg4OCfwDubKyowGqg3OCU2Es5nB+ygEaEsDlaAsxjXLHeSSyF6B102a1Bta/V9sc1zmwgH6SkoKUjsdN8IZbI4Mt2Az4qALbQTWTsOVyySRI4ClqTlIGpzVJstwRJsDMUeLzZrhmvgfOIxzlkvih3kbf67zOOmftslx/0y2yS8sAIcFkggAAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/the-bahamas.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaTheBahamas110m {
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
