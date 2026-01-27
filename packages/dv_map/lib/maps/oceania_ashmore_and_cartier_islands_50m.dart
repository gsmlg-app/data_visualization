// Generated from: assets/oceania/ashmore-and-cartier-islands.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for oceania/ashmore-and-cartier-islands.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Ashmore and Cartier Islands",
        "iso_a2": "-99",
        "iso_a3": "-99",
        "continent": "Oceania"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              123.5945312,
              -12.4256836
            ],
            [
              123.5724609,
              -12.4239258
            ],
            [
              123.5731445,
              -12.4341797
            ],
            [
              123.5952148,
              -12.4359375
            ],
            [
              123.5945312,
              -12.4256836
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for oceania/ashmore-and-cartier-islands.50m.json
GeoJsonFeatureCollection get oceaniaAshmoreAndCartierIslands50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
