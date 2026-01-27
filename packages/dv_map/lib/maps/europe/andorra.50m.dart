// Generated from: assets/europe/andorra.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for europe/andorra.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Andorra",
        "iso_a2": "AD",
        "iso_a3": "AND",
        "continent": "Europe"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              1.7060547,
              42.5033203
            ],
            [
              1.7139648,
              42.5256348
            ],
            [
              1.7402344,
              42.5567383
            ],
            [
              1.7394531,
              42.5759277
            ],
            [
              1.7098633,
              42.6044434
            ],
            [
              1.5681641,
              42.6350098
            ],
            [
              1.5013672,
              42.6427246
            ],
            [
              1.4588867,
              42.6216797
            ],
            [
              1.4283203,
              42.5958984
            ],
            [
              1.4148438,
              42.5483887
            ],
            [
              1.4219727,
              42.5308105
            ],
            [
              1.4302734,
              42.4978516
            ],
            [
              1.428125,
              42.4613281
            ],
            [
              1.4488281,
              42.4374512
            ],
            [
              1.4862305,
              42.4344727
            ],
            [
              1.534082,
              42.4416992
            ],
            [
              1.5864258,
              42.455957
            ],
            [
              1.6785156,
              42.4966797
            ],
            [
              1.7060547,
              42.5033203
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for europe/andorra.50m.json
GeoJsonFeatureCollection get europeAndorra50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
