// Generated from: assets/oceania/ashmore-and-cartier-islands.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for oceania/ashmore-and-cartier-islands.10m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Ashmore and Cartier Islands",
        "iso_a2": "-99",
        "iso_a3": "-99",
        "continent": "Oceania"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              123.5970158,
              -12.428318
            ],
            [
              123.5750432,
              -12.426609
            ],
            [
              123.5756128,
              -12.4367815
            ],
            [
              123.5977482,
              -12.4385719
            ],
            [
              123.5970158,
              -12.428318
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for oceania/ashmore-and-cartier-islands.10m.json
GeoJsonFeatureCollection get oceaniaAshmoreAndCartierIslands10m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
