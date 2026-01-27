// Generated from: assets/north-america/serranilla-bank.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for north-america/serranilla-bank.10m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Serranilla Bank",
        "iso_a2": "-99",
        "iso_a3": "-99",
        "continent": "North America"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              -78.6370743,
              15.8620873
            ],
            [
              -78.6368709,
              15.8672956
            ],
            [
              -78.6404109,
              15.8639997
            ],
            [
              -78.6370743,
              15.8620873
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for north-america/serranilla-bank.10m.json
GeoJsonFeatureCollection get northAmericaSerranillaBank10m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
