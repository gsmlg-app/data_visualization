// Generated from: assets/europe/slovenia.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for europe/slovenia.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Slovenia",
        "iso_a2": "SI",
        "iso_a3": "SVN",
        "continent": "Europe"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              13.8064755,
              46.5093061
            ],
            [
              13.69811,
              46.0167781
            ],
            [
              13.9376302,
              45.5910159
            ],
            [
              13.7150598,
              45.5003238
            ],
            [
              14.4119682,
              45.4661657
            ],
            [
              14.5951095,
              45.6349409
            ],
            [
              14.9352438,
              45.4716951
            ],
            [
              15.3276746,
              45.4523164
            ],
            [
              15.3239539,
              45.7317825
            ],
            [
              15.6715296,
              45.8341536
            ],
            [
              15.7687329,
              46.2381082
            ],
            [
              16.5648084,
              46.5037509
            ],
            [
              16.370505,
              46.8413272
            ],
            [
              16.2022982,
              46.852386
            ],
            [
              16.0116639,
              46.6836107
            ],
            [
              15.1370919,
              46.6587027
            ],
            [
              14.6324716,
              46.4318173
            ],
            [
              13.8064755,
              46.5093061
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for europe/slovenia.110m.json
GeoJsonFeatureCollection get europeSlovenia110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
