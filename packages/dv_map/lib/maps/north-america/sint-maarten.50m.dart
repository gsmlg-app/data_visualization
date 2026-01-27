// Generated from: assets/north-america/sint-maarten.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for north-america/sint-maarten.50m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE61RPWvDMBDd9SsOzW6QbFmxspVCt5RCl0IJRbhqKrAlo1wHE/zfS+Q62IkLNUTDcbr3wTvpSAAoto2hG6CPRuN3MA++qkyJ1juanODPfnygG3gjAADHWK+FkR6BJvjGBLRRNNABqNN1FLxYh7DVOqBxZxUAtQf/rtPIeL2aZ/18OwZK79A64/CEPfmAX3Bfm2BLTX9J3TnU3vjaYGinkYYdnn3V7r2bmvvwYZ3G0e79GfeXN4A7ma14mjEhVXIB8WLFZKFEnk2AXfIPQ7Fm61k/kTEpl/oxxUSqZg0FF0ymiw3/3pgrXqh8sWF8w/mEueBseULOecHlLf9k0SeTuX7oOjLUHenID8R78qaYAwAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/sint-maarten.50m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaSintMaarten50m {
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
