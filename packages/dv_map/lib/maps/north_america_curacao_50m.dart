// Generated from: assets/north-america/curacao.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for north-america/curacao.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Cura\u00e7ao",
        "iso_a2": "CW",
        "iso_a3": "CUW",
        "continent": "North America"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              -68.7510742,
              12.0597656
            ],
            [
              -68.8273926,
              12.1585449
            ],
            [
              -69.0131348,
              12.2313477
            ],
            [
              -69.0767578,
              12.342041
            ],
            [
              -69.118457,
              12.3732422
            ],
            [
              -69.1588867,
              12.3802734
            ],
            [
              -69.1538086,
              12.2984375
            ],
            [
              -68.9951172,
              12.1418457
            ],
            [
              -68.8033203,
              12.045459
            ],
            [
              -68.7510742,
              12.0597656
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for north-america/curacao.50m.json
GeoJsonFeatureCollection get northAmericaCuracao50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
