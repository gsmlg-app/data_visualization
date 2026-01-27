// Generated from: assets/africa/comoros.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for africa/comoros.50m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE7WWTWvcMBCG7/4VwudUaL6l3EqglxLaewllSZ1g2F0HxzmEkP9e7E1CsmsVMtA9GMtjPTsavfNaT00I7fR417Xnof3WbaaHsbsYttvueuqHfXs2h28Oj+/b8/CrCSGEp+V6OnF5fQncjcNdN079Mun19RDa/Wa3TLgYdsM43L9NCKHt74ffG5yD3y9PntMy6ceHwPWwn/p9t5/m2Nebsb/etC/R57dEbrth103j48c0XvO+fNhO/c9h+3j7stY39DD+6feb6d2iD7/398ej03EIzJFNSQ3PTmJfAGPKIExHoavjd9e5AllEKlwDymo+MKAUswq4YNGcfeBkiYDWwYAJwNAFJiuQQCtgFUXxcYnZsFIJMEqsxQXGgpiloglQNlbwgQ9VrGXsFwWZMQOvg1EQvRmzJhCtiIJI5qALLIlLTpX+IFFv3wkqaqlxkYTEp2JBNbFcKTEUIXA6xecdqKmNPvzjp92QouWsBqVSvYNBOBZJ0RJj0QoYRYp4hE9RCYhrbohsc8pOMBZIlV3BbFrECZ53u1pixmzgaVWKWXLJXPEA0owKvhp7RPHfFMoqGdOqIUEsCebmd62SC0ii1VVCzIqQCvvAbFqxUIgmKFR8G05WqPCq1UFUYNDksTqKdDhFrIM5ZSnkOWJQJP5HjUkzO10AS0lIq9KHSMYCTuljTqoMFXCBWRU+sGgSXvUtiEwImJ1gVNV135rVthxKfXuXiKqNl5mT64NNkUS4KrYsJuBtaFYzqzkFsEjyqdhjQXU/bI7vnpvX61Xz3PwFbKsZeAMOAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for africa/comoros.50m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get africaComoros50m {
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
