// Generated from: assets/europe/montenegro.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for europe/montenegro.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Montenegro",
        "iso_a2": "ME",
        "iso_a3": "MNE",
        "continent": "Europe"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              20.0707,
              42.58863
            ],
            [
              20.25758,
              42.81275
            ],
            [
              20.3398,
              42.89852
            ],
            [
              19.95857,
              43.10604
            ],
            [
              19.63,
              43.21378
            ],
            [
              19.48389,
              43.35229
            ],
            [
              19.21852,
              43.52384
            ],
            [
              19.03165,
              43.43253
            ],
            [
              18.70648,
              43.20011
            ],
            [
              18.56,
              42.65
            ],
            [
              18.4500169,
              42.4799922
            ],
            [
              18.88214,
              42.28151
            ],
            [
              19.16246,
              41.95502
            ],
            [
              19.3717682,
              41.8775507
            ],
            [
              19.3044861,
              42.1957451
            ],
            [
              19.7380514,
              42.6882474
            ],
            [
              19.8016134,
              42.5000935
            ],
            [
              20.0707,
              42.58863
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for europe/montenegro.110m.json
GeoJsonFeatureCollection get europeMontenegro110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
