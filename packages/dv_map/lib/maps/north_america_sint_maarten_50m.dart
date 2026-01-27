// Generated from: assets/north-america/sint-maarten.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for north-america/sint-maarten.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Sint Maarten",
        "iso_a2": "SX",
        "iso_a3": "SXM",
        "continent": "North America"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              -63.1230469,
              18.0689453
            ],
            [
              -63.124707,
              18.0643066
            ],
            [
              -63.0904297,
              18.0414062
            ],
            [
              -63.0230469,
              18.0191895
            ],
            [
              -63.0123047,
              18.0454102
            ],
            [
              -63.0111816,
              18.0689453
            ],
            [
              -63.1230469,
              18.0689453
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for north-america/sint-maarten.50m.json
GeoJsonFeatureCollection get northAmericaSintMaarten50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
