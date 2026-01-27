// Generated from: assets/north-america/jamaica.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for north-america/jamaica.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Jamaica",
        "iso_a2": "JM",
        "iso_a3": "JAM",
        "continent": "North America"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              -77.5696008,
              18.4905254
            ],
            [
              -77.7973647,
              18.5242185
            ],
            [
              -78.2177266,
              18.4545328
            ],
            [
              -78.3377193,
              18.2259679
            ],
            [
              -77.7660229,
              17.8615974
            ],
            [
              -77.2063413,
              17.7011162
            ],
            [
              -76.9025614,
              17.8682378
            ],
            [
              -76.1996586,
              17.8868672
            ],
            [
              -76.3653591,
              18.1607006
            ],
            [
              -76.8966186,
              18.4008668
            ],
            [
              -77.5696008,
              18.4905254
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for north-america/jamaica.110m.json
GeoJsonFeatureCollection get northAmericaJamaica110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
