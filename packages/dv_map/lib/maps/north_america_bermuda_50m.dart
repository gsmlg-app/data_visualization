// Generated from: assets/north-america/bermuda.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for north-america/bermuda.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Bermuda",
        "iso_a2": "BM",
        "iso_a3": "BMU",
        "continent": "North America"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              -64.7302734,
              32.293457
            ],
            [
              -64.6683105,
              32.3819336
            ],
            [
              -64.6946289,
              32.3869141
            ],
            [
              -64.7711914,
              32.3077148
            ],
            [
              -64.8628418,
              32.273877
            ],
            [
              -64.8450684,
              32.2623047
            ],
            [
              -64.8201172,
              32.2596191
            ],
            [
              -64.7302734,
              32.293457
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for north-america/bermuda.50m.json
GeoJsonFeatureCollection get northAmericaBermuda50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
