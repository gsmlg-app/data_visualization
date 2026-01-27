// Generated from: assets/oceania/tuvalu.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for oceania/tuvalu.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Tuvalu",
        "iso_a2": "TV",
        "iso_a3": "TUV",
        "continent": "Oceania"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              179.2136719,
              -8.5242188
            ],
            [
              179.2166016,
              -8.5148438
            ],
            [
              179.2116211,
              -8.4880859
            ],
            [
              179.2030273,
              -8.4663086
            ],
            [
              179.1985352,
              -8.4700195
            ],
            [
              179.1979492,
              -8.4886719
            ],
            [
              179.2008789,
              -8.5121094
            ],
            [
              179.1957031,
              -8.5347656
            ],
            [
              179.2005859,
              -8.5349609
            ],
            [
              179.2136719,
              -8.5242188
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for oceania/tuvalu.50m.json
GeoJsonFeatureCollection get oceaniaTuvalu50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
