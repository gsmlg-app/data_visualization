// Generated from: assets/north-america/aruba.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for north-america/aruba.50m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE52STWsCMRCG7/srhpytzOQ73myhx9JbD0XK1qZ2Yd1IjAcR/3txdcWPQElzCJN5Zx7eIbOrAFjarjybAHv2ddpE/xTa1s9TEzo2Osjfx/SaTeC9AgDY9fd9Y1/eC6sYVj6mpm8aygFYVy/7hmncfNbncgDWrMNHzXvp7S4v+vzjlTAPXWo636WD9hJi+oHp0sdmXrNT0f7sZuHD0qe4vfYymH8N7XZxmvUMD/Gr6ep0MfTxXMa3L4AH7cbWOeJEoxuJ+Fgqjsiv8rPRnzxHZEnLHM+i1NYWA40gKVUGqLTR3BTxDI5RKEKTM6hJEpEoBiq0xrqcQWfQYDlQayIhckCpnfnHyChJYW5khSitLXN4+BPJyZrcn0hhFVeyFGidMiiyW8i5c8VLU7bVVS4eon013LNqX/0CjVgEYoEEAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/aruba.50m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaAruba50m {
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
