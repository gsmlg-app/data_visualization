// Generated from: assets/europe/kosovo.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for europe/kosovo.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Kosovo",
        "iso_a2": "-99",
        "iso_a3": "-99",
        "continent": "Europe"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              20.5902465,
              41.8554089
            ],
            [
              20.71731,
              41.84711
            ],
            [
              20.76216,
              42.05186
            ],
            [
              21.3527,
              42.2068
            ],
            [
              21.576636,
              42.2452244
            ],
            [
              21.54332,
              42.32025
            ],
            [
              21.66292,
              42.43922
            ],
            [
              21.77505,
              42.6827
            ],
            [
              21.63302,
              42.67717
            ],
            [
              21.43866,
              42.86255
            ],
            [
              21.27421,
              42.90959
            ],
            [
              21.143395,
              43.068685
            ],
            [
              20.95651,
              43.13094
            ],
            [
              20.81448,
              43.27205
            ],
            [
              20.63508,
              43.21671
            ],
            [
              20.49679,
              42.88469
            ],
            [
              20.25758,
              42.81275
            ],
            [
              20.0707,
              42.58863
            ],
            [
              20.2837545,
              42.3202595
            ],
            [
              20.52295,
              42.21787
            ],
            [
              20.5902465,
              41.8554089
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for europe/kosovo.110m.json
GeoJsonFeatureCollection get europeKosovo110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
