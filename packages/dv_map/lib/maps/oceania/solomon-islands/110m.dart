// Generated from: assets/oceania/solomon-islands.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for oceania/solomon-islands.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE7WWTWscMQyG7/srzJxToy9bUo4tFAotLfRYSlmSaVjYzITdySGE/Pcykw+SrLdQlexhGI/sZ2XpleXbVUrddHPVd6ep+9ivp+td/2HcbvuzaTMO3cls/n3/ed+dph+rlFK6XZ6HC5fpi+FqN171u2mzLHqcnlI3rC+XBd/H7Xg5DunTfrsezvdPC1PqNvvx15qWSe8PvvPy/fMLw9k4TJuhH6bZ9vWsXw+bdfdgvnvy6KIfL/tpd/PSn8cNfLneTptv4/bm4mHTT+xxd74Z1tOz3d//nr+/Hh2OU8JKGdGBRE8OjO8Qshgp+ivTz9dzW2DMjsrGfAQsVQFKjMzo6kc8JhAtGAQrADBRm2wEgIgRMmV2q1L8GLlyVY6RA/lbHRu9+Mt/FxPmqu6GLWc8F3c3olhmyACgYhOMS2JCKYfsBEDWAltmAgCrMXBRd9eWlv4TrGZUuA121CIcjHEhZ6+1GWM1YQxyA6J4K4VCtkJE1t6kKTlrqMIhV7OC2t5lRcBKEgNzJS+1lW/PAsAgEekXzwrkItYEk5CLawxcBQCoddh5ruyubjGwiYtoaSvUBUhDEoUslYpZq1d5Ni8EHizWgNzeSPt/zYtlmM/BUL5t6YyArehpLnXuqRHpF8tc3LVZU7qcoRjSkWVCRPGWjjQLoWmoTRXLxSoitx3WIkYcrFVkrnqkmyAKGoZC7HPHEGhzCxuZR25/c6lqAdKWJiwzKxOEQhwR8VsVlGacfQFpphsIK1vkUldqLkJG2jo26twymS2ko5rFkYu2olez1uLCQY8dCBjaJYVaTSUE1szsgt7qUpoFRGMX56KzvIXKkcNF1DAm/ZAqjkt09frtbvX4/Lm6W/0BooBOVysPAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for oceania/solomon-islands.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get oceaniaSolomonIslands110m {
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
