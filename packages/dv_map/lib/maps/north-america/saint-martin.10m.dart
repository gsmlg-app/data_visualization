// Generated from: assets/north-america/saint-martin.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for north-america/saint-martin.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE52VS2vcMBCA7/4VwudtmNGMpFFuoZBbQqHHEorZOqlhV1oc5bCE/e9lnW7IJkPpxAchz+NjXh4/d871bb8b+0vXX49De5rHr3WzGddtqqVfHdX3L+LH/tL96Jxz7nk5Pzou5otiN9fdOLdpcTqZO9eXYbs4fB+m0tzNMLepvHo510+P9efgjxY31x/ktMivzhTrWtpUxtKOuts6t9/uajvO03ro/xodXoN6GOt2bPP+PKRTDt/qZv9Qyzm8zr+mMrQ3ub88b+/v35z7EukCMIUocfVOhXIBRJQxnCnuVv8BhESoAhmEJNuBCDmJBkyQOHo7MGWipAARIBDSJ4CRJWtA75GSmIGEDB5VIEqmaAYGj0isATEK2wNMIAmDygNAj3ZghgxqCYExE5uBQoJaBUFSDmIPMEfIWasgJBHw5hIiUgrq0ByHOnhzxsgUfdB6Aokxsjll5Ch6wuCzmGcQmSRmdTFEjkLmzw6JiUXtcciczJsLCYInrwYInu0zgxgIghpgDJSCHQgJgNWexJjtm/BfPI+Y7btagkhUSxgk4KdWq+X31Gn30+3Qnc677tD9AUQro5VSCAAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/saint-martin.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaSaintMartin10m {
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
