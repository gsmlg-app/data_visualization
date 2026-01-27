// Generated from: assets/asia/macao-s-a-r.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for asia/macao-s-a-r.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Macao S.A.R",
        "iso_a2": "MO",
        "iso_a3": "MAC",
        "continent": "Asia"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              113.4789063,
              22.1955566
            ],
            [
              113.4841797,
              22.1977539
            ],
            [
              113.4988281,
              22.2016602
            ],
            [
              113.5455078,
              22.2214844
            ],
            [
              113.5481445,
              22.2226074
            ],
            [
              113.5270508,
              22.2459473
            ],
            [
              113.4941406,
              22.2415527
            ],
            [
              113.4810547,
              22.2174805
            ],
            [
              113.4789063,
              22.1955566
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for asia/macao-s-a-r.50m.json
GeoJsonFeatureCollection get asiaMacaoSAR50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
