// Generated from: assets/africa/lesotho.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for africa/lesotho.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Lesotho",
        "iso_a2": "LS",
        "iso_a3": "LSO",
        "continent": "Africa"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              28.9782626,
              -28.9555966
            ],
            [
              28.5417001,
              -28.6475017
            ],
            [
              28.0743384,
              -28.8514686
            ],
            [
              27.532511,
              -29.2427109
            ],
            [
              26.9992619,
              -29.8759539
            ],
            [
              27.749397,
              -30.6451059
            ],
            [
              28.1072046,
              -30.5457321
            ],
            [
              28.2910694,
              -30.2262167
            ],
            [
              28.8483997,
              -30.0700506
            ],
            [
              29.0184152,
              -29.7437656
            ],
            [
              29.3251665,
              -29.257387
            ],
            [
              28.9782626,
              -28.9555966
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for africa/lesotho.110m.json
GeoJsonFeatureCollection get africaLesotho110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
