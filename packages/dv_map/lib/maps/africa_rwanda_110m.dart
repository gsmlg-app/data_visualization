// Generated from: assets/africa/rwanda.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for africa/rwanda.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Rwanda",
        "iso_a2": "RW",
        "iso_a3": "RWA",
        "continent": "Africa"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              30.4191049,
              -1.1346591
            ],
            [
              29.8215186,
              -1.4433224
            ],
            [
              29.5794662,
              -1.3413132
            ],
            [
              29.2918868,
              -1.6200558
            ],
            [
              29.2548348,
              -2.21511
            ],
            [
              29.1174789,
              -2.2922112
            ],
            [
              29.0249264,
              -2.8392579
            ],
            [
              29.6321761,
              -2.9178578
            ],
            [
              29.938359,
              -2.3484868
            ],
            [
              30.4696736,
              -2.4138548
            ],
            [
              30.46967,
              -2.41383
            ],
            [
              30.758309,
              -2.2872503
            ],
            [
              30.8161349,
              -1.6989141
            ],
            [
              30.4191049,
              -1.1346591
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for africa/rwanda.110m.json
GeoJsonFeatureCollection get africaRwanda110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
