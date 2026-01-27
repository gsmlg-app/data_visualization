// Generated from: assets/asia/sri-lanka.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for asia/sri-lanka.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Sri Lanka",
        "iso_a2": "LK",
        "iso_a3": "LKA",
        "continent": "Asia"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              81.787959,
              7.5230553
            ],
            [
              81.3043193,
              8.5642062
            ],
            [
              80.838818,
              9.2684268
            ],
            [
              80.1478007,
              9.8240777
            ],
            [
              79.6951669,
              8.2008434
            ],
            [
              79.8724687,
              6.7634634
            ],
            [
              80.348357,
              5.9683699
            ],
            [
              81.2180196,
              6.1971414
            ],
            [
              81.6373222,
              6.4817752
            ],
            [
              81.787959,
              7.5230553
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for asia/sri-lanka.110m.json
GeoJsonFeatureCollection get asiaSriLanka110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
