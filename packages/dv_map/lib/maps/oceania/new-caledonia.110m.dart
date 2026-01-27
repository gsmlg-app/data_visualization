// Generated from: assets/oceania/new-caledonia.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for oceania/new-caledonia.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "New Caledonia",
        "iso_a2": "NC",
        "iso_a3": "NCL",
        "continent": "Oceania"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              165.7799899,
              -21.080005
            ],
            [
              165.4600094,
              -20.8000221
            ],
            [
              165.0200362,
              -20.4599911
            ],
            [
              164.4599671,
              -20.1200119
            ],
            [
              164.0296057,
              -20.1056458
            ],
            [
              164.1679952,
              -20.4447466
            ],
            [
              164.8298153,
              -21.1498198
            ],
            [
              165.4743754,
              -21.6796066
            ],
            [
              166.1897323,
              -22.1297083
            ],
            [
              166.7400346,
              -22.3999761
            ],
            [
              167.1200114,
              -22.1599907
            ],
            [
              166.5999915,
              -21.7000188
            ],
            [
              165.7799899,
              -21.080005
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for oceania/new-caledonia.110m.json
GeoJsonFeatureCollection get oceaniaNewCaledonia110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
