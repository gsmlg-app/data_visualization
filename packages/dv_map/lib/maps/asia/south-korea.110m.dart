// Generated from: assets/asia/south-korea.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for asia/south-korea.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WUwWrcMBCG734K4fMySJoZzUxupdBLDi3tsYRiUjc1bKzF6xyWsO9e7GSXJDIU+SBk/ZqPf2YkPTfOtfPp0Lc3rv3Sd/PT1H/O+31/Pw95bHeL/Odl+djeuJ+Nc849r2MZuG5fhcOUD/00D2vQZbtz7dg9rgE/8tP8193mqe+uQc61wzH/6uKy4fZ7sY7r+td3wn0e52Hsx3nRPh2Hrn3VzlcrD31+7Ofp9N7Ixfm3vD89vCZ6Zebp9zB285uMX763849/zoWYIAgJq+w+SCggZElZ3wl3u/8CNflAiAUwgRpapFALDEHQxDaAEpmUpBbIbBEDFUCGpMTkuRaIghasrCGBIXGqB5Ly0pYNIJr3xFYHFEBNHKxMmYCEk2BlDRWCsrLfcqjmUaSyywbeAkpKG03xGkkp1gIpKXoqHTIkjIF8qgd6oo0uJxCloFbtMIZowUqHAoQRLVYeGwUkk5DKLiukECPFymOjED0LcXn1FFA8mlSmLCDqPfKWw6VXyJVNEfCC6LWsoULkFAJVP19JUYKVKQuoJ5HaGiaIKIi6CaTlplQDK1/sZmt+mZ2by3jXnJt/vwhTg1sHAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for asia/south-korea.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get asiaSouthKorea110m {
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
