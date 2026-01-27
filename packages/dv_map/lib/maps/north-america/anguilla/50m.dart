// Generated from: assets/north-america/anguilla.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for north-america/anguilla.50m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WRzWrDMBCE736KRWfX6MeWrNxModBL6b2EIlLVEdiSUZSDCX73Ejk2TmIo1kGs9tsZdtAlAUCh7zTaAXrTKpy9fnVNow/BOIvSK/4d2ye0g68EAOAS72dhHI+g867TPpgomsYBkFVtFFS2PpumUbMCAJmT+1Y00venPhv71RIcnA3Gahuu7MP5cISq1d4cFLoNDfNCtXatDr6/X2fa/9M1fX2LO5s7/2OsCovc41nWjy+AF84yjAmlWKQPiJQZpUQIwe7APv3HkGZSyKKU5Zohz4XM5TZDlmHKMS3yVUMpKOdbDUnBGMVszRBjKjcmZhnhGOPVxEQQVnKxOfG2P0nW6qkakuneJ0PyB3QDN+FDAwAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/anguilla.50m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaAnguilla50m {
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
