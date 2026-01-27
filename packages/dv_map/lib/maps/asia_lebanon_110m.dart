// Generated from: assets/asia/lebanon.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for asia/lebanon.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Lebanon",
        "iso_a2": "LB",
        "iso_a3": "LBN",
        "continent": "Asia"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              35.8211007,
              33.2774265
            ],
            [
              36.0664604,
              33.8249124
            ],
            [
              36.6117501,
              34.2017886
            ],
            [
              36.4481942,
              34.5939352
            ],
            [
              35.9984025,
              34.644914
            ],
            [
              35.9795923,
              34.6100583
            ],
            [
              35.4822067,
              33.9054501
            ],
            [
              35.1260527,
              33.0909004
            ],
            [
              35.4607093,
              33.08904
            ],
            [
              35.5527967,
              33.2642748
            ],
            [
              35.8211007,
              33.2774265
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for asia/lebanon.110m.json
GeoJsonFeatureCollection get asiaLebanon110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
