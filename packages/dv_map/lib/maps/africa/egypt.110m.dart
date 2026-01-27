// Generated from: assets/africa/egypt.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for africa/egypt.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Egypt",
        "iso_a2": "EG",
        "iso_a3": "EGY",
        "continent": "Africa"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              36.86623,
              22.0
            ],
            [
              36.69069,
              22.20485
            ],
            [
              35.52598,
              23.10244
            ],
            [
              35.49372,
              23.75237
            ],
            [
              35.69241,
              23.92671
            ],
            [
              34.79507,
              25.03375
            ],
            [
              34.47387,
              25.59856
            ],
            [
              34.10455,
              26.14227
            ],
            [
              33.34876,
              27.69989
            ],
            [
              32.73482,
              28.70523
            ],
            [
              32.32046,
              29.76043
            ],
            [
              32.42323,
              29.85108
            ],
            [
              33.13676,
              28.41765
            ],
            [
              33.58811,
              27.97136
            ],
            [
              33.92136,
              27.6487
            ],
            [
              34.15451,
              27.8233
            ],
            [
              34.42655,
              28.34399
            ],
            [
              34.64174,
              29.09942
            ],
            [
              34.9226,
              29.50133
            ],
            [
              34.8232433,
              29.7610808
            ],
            [
              34.26544,
              31.21936
            ],
            [
              34.2654347,
              31.2193573
            ],
            [
              33.7734,
              30.96746
            ],
            [
              32.99392,
              31.02407
            ],
            [
              32.19247,
              31.26034
            ],
            [
              31.96041,
              30.9336
            ],
            [
              31.68796,
              31.4296
            ],
            [
              30.97693,
              31.55586
            ],
            [
              30.09503,
              31.4734
            ],
            [
              29.68342,
              31.18686
            ],
            [
              28.91353,
              30.87005
            ],
            [
              28.45048,
              31.02577
            ],
            [
              27.45762,
              31.32126
            ],
            [
              26.49533,
              31.58568
            ],
            [
              25.16482,
              31.56915
            ],
            [
              24.80287,
              31.08929
            ],
            [
              24.95762,
              30.6616
            ],
            [
              24.70007,
              30.04419
            ],
            [
              25.0,
              29.2386545
            ],
            [
              25.0,
              25.6825
            ],
            [
              25.0,
              22.0
            ],
            [
              29.02,
              22.0
            ],
            [
              32.9,
              22.0
            ],
            [
              36.86623,
              22.0
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for africa/egypt.110m.json
GeoJsonFeatureCollection get africaEgypt110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
