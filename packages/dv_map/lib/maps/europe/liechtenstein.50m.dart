// Generated from: assets/europe/liechtenstein.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for europe/liechtenstein.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Liechtenstein",
        "iso_a2": "LI",
        "iso_a3": "LIE",
        "continent": "Europe"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              9.5802734,
              47.057373
            ],
            [
              9.5957031,
              47.0758301
            ],
            [
              9.6105469,
              47.1071289
            ],
            [
              9.6011719,
              47.1320801
            ],
            [
              9.571875,
              47.1579102
            ],
            [
              9.5557617,
              47.185498
            ],
            [
              9.5510742,
              47.2122559
            ],
            [
              9.5421875,
              47.2341309
            ],
            [
              9.5368164,
              47.2546387
            ],
            [
              9.5275391,
              47.270752
            ],
            [
              9.4842773,
              47.1726562
            ],
            [
              9.4794922,
              47.0975098
            ],
            [
              9.4876953,
              47.0622559
            ],
            [
              9.5023438,
              47.0627441
            ],
            [
              9.5802734,
              47.057373
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for europe/liechtenstein.50m.json
GeoJsonFeatureCollection get europeLiechtenstein50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
