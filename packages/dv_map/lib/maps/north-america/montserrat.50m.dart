// Generated from: assets/north-america/montserrat.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for north-america/montserrat.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Montserrat",
        "iso_a2": "MS",
        "iso_a3": "MSR",
        "continent": "North America"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              -62.1484375,
              16.740332
            ],
            [
              -62.1757812,
              16.8095703
            ],
            [
              -62.1913574,
              16.8043945
            ],
            [
              -62.2230469,
              16.7515625
            ],
            [
              -62.2216309,
              16.6995117
            ],
            [
              -62.154248,
              16.6812012
            ],
            [
              -62.1484375,
              16.740332
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for north-america/montserrat.50m.json
GeoJsonFeatureCollection get northAmericaMontserrat50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
