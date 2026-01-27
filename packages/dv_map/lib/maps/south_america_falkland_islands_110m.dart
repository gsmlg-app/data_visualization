// Generated from: assets/south-america/falkland-islands.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for south-america/falkland-islands.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Falkland Islands",
        "iso_a2": "FK",
        "iso_a3": "FLK",
        "continent": "South America"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              -61.2,
              -51.85
            ],
            [
              -60.7,
              -52.3
            ],
            [
              -59.85,
              -51.85
            ],
            [
              -59.4,
              -52.2
            ],
            [
              -58.05,
              -51.9
            ],
            [
              -57.75,
              -51.55
            ],
            [
              -58.55,
              -51.1
            ],
            [
              -59.15,
              -51.5
            ],
            [
              -60.0,
              -51.25
            ],
            [
              -61.2,
              -51.85
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for south-america/falkland-islands.110m.json
GeoJsonFeatureCollection get southAmericaFalklandIslands110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
