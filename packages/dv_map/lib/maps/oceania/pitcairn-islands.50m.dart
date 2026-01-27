// Generated from: assets/oceania/pitcairn-islands.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for oceania/pitcairn-islands.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Pitcairn Islands",
        "iso_a2": "PN",
        "iso_a3": "PCN",
        "continent": "Oceania"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              -128.2900879,
              -24.3973633
            ],
            [
              -128.2908203,
              -24.3646484
            ],
            [
              -128.3036133,
              -24.3335938
            ],
            [
              -128.330127,
              -24.3232422
            ],
            [
              -128.3501953,
              -24.3402344
            ],
            [
              -128.3421875,
              -24.3707031
            ],
            [
              -128.3206543,
              -24.399707
            ],
            [
              -128.3,
              -24.4125977
            ],
            [
              -128.2900879,
              -24.3973633
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for oceania/pitcairn-islands.50m.json
GeoJsonFeatureCollection get oceaniaPitcairnIslands50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
