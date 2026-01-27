// Generated from: assets/north-america/trinidad-and-tobago.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for north-america/trinidad-and-tobago.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Trinidad and Tobago",
        "iso_a2": "TT",
        "iso_a3": "TTO",
        "continent": "North America"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              -61.68,
              10.76
            ],
            [
              -61.66,
              10.365
            ],
            [
              -61.95,
              10.09
            ],
            [
              -61.77,
              10.0
            ],
            [
              -60.935,
              10.11
            ],
            [
              -60.895,
              10.855
            ],
            [
              -61.105,
              10.89
            ],
            [
              -61.68,
              10.76
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for north-america/trinidad-and-tobago.110m.json
GeoJsonFeatureCollection get northAmericaTrinidadAndTobago110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
