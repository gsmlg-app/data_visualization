// Generated from: assets/asia/northern-cyprus.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for asia/northern-cyprus.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Northern Cyprus",
        "iso_a2": "-99",
        "iso_a3": "-99",
        "continent": "Asia"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              32.7317802,
              35.1400259
            ],
            [
              32.9195724,
              35.0878327
            ],
            [
              33.190977,
              35.1731247
            ],
            [
              33.3838334,
              35.1627119
            ],
            [
              33.4559221,
              35.1014237
            ],
            [
              33.4758175,
              35.0003446
            ],
            [
              33.5256853,
              35.0386885
            ],
            [
              33.6753919,
              35.0178629
            ],
            [
              33.8664397,
              35.0935947
            ],
            [
              33.9736166,
              35.0585064
            ],
            [
              33.9008045,
              35.2457559
            ],
            [
              34.5764738,
              35.6715956
            ],
            [
              33.667227,
              35.3732158
            ],
            [
              32.9469609,
              35.3867034
            ],
            [
              32.8024736,
              35.1455036
            ],
            [
              32.7317802,
              35.1400259
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for asia/northern-cyprus.110m.json
GeoJsonFeatureCollection get asiaNorthernCyprus110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
