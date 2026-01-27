// Generated from: assets/north-america/barbados.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for north-america/barbados.50m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WSTWvDMAyG7/kVwueu2HLij97WwY5j7DrK8Fq3CyRxcb1DKfnvo24TmtYw7IOQ9UoPkuxTAUDCcW/JAsirNeHX2xfXNHYdateR2VneXsIHsoDPAgDgFO1jYUyPwt67vfWhjkVDOgDpTBsLlsZ/m407jBUApD64L4NRXT7EeYx/TIS160Ld2S6ctTfnww88t9bXa0OuSf3Y0M661gZ/nLYz9P/umuPuOu4Id35TdybczH05t/79DeCp0vNSc85oNbuTGJ9TxbTCciKsZv8DUQouZALIKpSKYzZQSaWpSAG1UCiygZVmgrIUkDMpZKVygaIUQurUyJxyhlU+D6XkZXKFFDXP5jHGUbEUjyLVWmRvEJmSyT8jEKnMfuG8P1ik/MHri8Guir74A94+rcUzBAAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/barbados.50m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaBarbados50m {
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
