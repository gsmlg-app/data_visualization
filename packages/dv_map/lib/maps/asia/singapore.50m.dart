// Generated from: assets/asia/singapore.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for asia/singapore.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Singapore",
        "iso_a2": "SG",
        "iso_a3": "SGP",
        "continent": "Asia"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              103.9697266,
              1.3314453
            ],
            [
              103.9963867,
              1.3652344
            ],
            [
              103.9608398,
              1.3922363
            ],
            [
              103.9089844,
              1.4159668
            ],
            [
              103.8179688,
              1.4470703
            ],
            [
              103.7052734,
              1.4234375
            ],
            [
              103.6501953,
              1.3255371
            ],
            [
              103.8199219,
              1.2653809
            ],
            [
              103.9697266,
              1.3314453
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for asia/singapore.50m.json
GeoJsonFeatureCollection get asiaSingapore50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
