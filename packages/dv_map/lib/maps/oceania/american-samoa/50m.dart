// Generated from: assets/oceania/american-samoa.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for oceania/american-samoa.50m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE51SwWoCMRC971cMOVtJZjeTxFsp9FZa8FikhG2UgJvImh5E9t+Lu65oDZQ1h2Eyb97jPZJjAcDSYefYAtirs+mndS9xu3V18jGw2QleD+M9W8BnAQBw7Os9sV/vgV0bd65NvieN6wAs2KYnPDeu9bUNsLRNtBceAPP7+GWx31nezcth/nYN1DEkH1xIJ+y9djZ4y85wdzG0cbFxqT3c2hn9f8TtYXOOe5GN7bcPNl3lHs51//cG8CQUnyskJCNnd1g1L6UQSpgbZDX7X5IqXimdlUSNiESTJSVpISRmJYmUoQdcaiOI5yWlqvCB4Aq5rgxlJZU06oHgGrnkSmefR6DgpprukgyWusy/uFEkp7uc+omKXD92XTHWVdEVvw7ngvr2AwAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for oceania/american-samoa.50m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get oceaniaAmericanSamoa50m {
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
