// Generated from: assets/europe/estonia.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for europe/estonia.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Estonia",
        "iso_a2": "EE",
        "iso_a3": "EST",
        "continent": "Europe"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              27.9811269,
              59.4753733
            ],
            [
              27.9811141,
              59.4753881
            ],
            [
              26.9491358,
              59.4458033
            ],
            [
              25.8641891,
              59.6110904
            ],
            [
              24.6042143,
              59.4658538
            ],
            [
              23.3397954,
              59.1872403
            ],
            [
              23.4265601,
              58.6127534
            ],
            [
              24.0611984,
              58.2573746
            ],
            [
              24.4289279,
              58.3834134
            ],
            [
              24.3128626,
              57.7934236
            ],
            [
              25.1645935,
              57.970157
            ],
            [
              25.6028097,
              57.8475288
            ],
            [
              26.4635323,
              57.4763887
            ],
            [
              27.2881848,
              57.4745283
            ],
            [
              27.7166858,
              57.7918991
            ],
            [
              27.42015,
              58.72457
            ],
            [
              28.1316993,
              59.3008251
            ],
            [
              27.98112,
              59.47537
            ],
            [
              27.9811269,
              59.4753733
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for europe/estonia.110m.json
GeoJsonFeatureCollection get europeEstonia110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
