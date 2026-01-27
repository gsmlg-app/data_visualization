// Generated from: assets/europe/gibraltar.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for europe/gibraltar.10m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Gibraltar",
        "iso_a2": "GI",
        "iso_a3": "GIB",
        "continent": "Europe"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              -5.3583868,
              36.1411094
            ],
            [
              -5.3502498,
              36.1192895
            ],
            [
              -5.3420304,
              36.1105004
            ],
            [
              -5.33906,
              36.1238467
            ],
            [
              -5.3399145,
              36.1298282
            ],
            [
              -5.3387735,
              36.1411197
            ],
            [
              -5.3583868,
              36.1411094
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for europe/gibraltar.10m.json
GeoJsonFeatureCollection get europeGibraltar10m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
