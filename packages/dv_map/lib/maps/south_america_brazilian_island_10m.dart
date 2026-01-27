// Generated from: assets/south-america/brazilian-island.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for south-america/brazilian-island.10m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Brazilian Island",
        "iso_a2": "-99",
        "iso_a3": "-99",
        "continent": "South America"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              -57.6424658,
              -30.1930921
            ],
            [
              -57.6027925,
              -30.190517
            ],
            [
              -57.6116984,
              -30.1829627
            ],
            [
              -57.6339709,
              -30.1835829
            ],
            [
              -57.6424658,
              -30.1930921
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for south-america/brazilian-island.10m.json
GeoJsonFeatureCollection get southAmericaBrazilianIsland10m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
