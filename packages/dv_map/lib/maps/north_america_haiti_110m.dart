// Generated from: assets/north-america/haiti.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for north-america/haiti.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Haiti",
        "iso_a2": "HT",
        "iso_a3": "HTI",
        "continent": "North America"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              -71.7123614,
              19.7144559
            ],
            [
              -72.5796728,
              19.8715006
            ],
            [
              -73.1897906,
              19.9156839
            ],
            [
              -73.4150223,
              19.6395509
            ],
            [
              -72.7841048,
              19.4835914
            ],
            [
              -72.7916495,
              19.1016251
            ],
            [
              -72.3348816,
              18.6684215
            ],
            [
              -72.6949371,
              18.4457995
            ],
            [
              -73.4495422,
              18.526053
            ],
            [
              -74.3699253,
              18.6649075
            ],
            [
              -74.4580336,
              18.34255
            ],
            [
              -73.9224332,
              18.0309927
            ],
            [
              -73.4545548,
              18.2179064
            ],
            [
              -72.8444112,
              18.1456111
            ],
            [
              -72.3724762,
              18.2149608
            ],
            [
              -71.7083048,
              18.0449971
            ],
            [
              -71.6877376,
              18.3166601
            ],
            [
              -71.9451121,
              18.6169001
            ],
            [
              -71.7013027,
              18.785417
            ],
            [
              -71.6248732,
              19.169838
            ],
            [
              -71.7123614,
              19.7144559
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for north-america/haiti.110m.json
GeoJsonFeatureCollection get northAmericaHaiti110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
