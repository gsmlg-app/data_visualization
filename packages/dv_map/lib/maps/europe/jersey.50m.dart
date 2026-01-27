// Generated from: assets/europe/jersey.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for europe/jersey.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Jersey",
        "iso_a2": "JE",
        "iso_a3": "JEY",
        "continent": "Europe"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              -2.0186523,
              49.23125
            ],
            [
              -2.0822266,
              49.2553711
            ],
            [
              -2.2205078,
              49.2663574
            ],
            [
              -2.2358398,
              49.1763672
            ],
            [
              -2.1656738,
              49.1874023
            ],
            [
              -2.0910156,
              49.1874023
            ],
            [
              -2.0537598,
              49.1698242
            ],
            [
              -2.0099121,
              49.1808105
            ],
            [
              -2.0186523,
              49.23125
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for europe/jersey.50m.json
GeoJsonFeatureCollection get europeJersey50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
