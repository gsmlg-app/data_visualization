// Generated from: assets/north-america/sint-maarten.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for north-america/sint-maarten.10m.json
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
              -63.1070044,
              18.0621199
            ],
            [
              -63.1070044,
              18.059475
            ],
            [
              -63.1188859,
              18.0514997
            ],
            [
              -63.112172,
              18.0430362
            ],
            [
              -63.0976456,
              18.0359561
            ],
            [
              -63.030629,
              18.0191104
            ],
            [
              -63.0175686,
              18.0333915
            ],
            [
              -63.0858862,
              18.0585113
            ],
            [
              -63.1070044,
              18.0621199
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for north-america/sint-maarten.10m.json
GeoJsonFeatureCollection get northAmericaSintMaarten10m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
