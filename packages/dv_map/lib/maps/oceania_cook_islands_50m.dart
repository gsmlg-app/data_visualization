// Generated from: assets/oceania/cook-islands.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for oceania/cook-islands.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Cook Islands",
        "iso_a2": "CK",
        "iso_a3": "COK",
        "continent": "Oceania"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              -159.7405273,
              -21.2492188
            ],
            [
              -159.7368652,
              -21.240625
            ],
            [
              -159.739502,
              -21.2081055
            ],
            [
              -159.7683594,
              -21.1884766
            ],
            [
              -159.8105957,
              -21.1864258
            ],
            [
              -159.8320312,
              -21.2004883
            ],
            [
              -159.8424805,
              -21.2291016
            ],
            [
              -159.8395996,
              -21.2380859
            ],
            [
              -159.8130859,
              -21.2420898
            ],
            [
              -159.7725586,
              -21.2495117
            ],
            [
              -159.7405273,
              -21.2492188
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for oceania/cook-islands.50m.json
GeoJsonFeatureCollection get oceaniaCookIslands50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
