// Generated from: assets/north-america/saint-barthelemy.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for north-america/saint-barthelemy.10m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Saint Barthelemy",
        "iso_a2": "BL",
        "iso_a3": "BLM",
        "continent": "North America"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              -62.8388566,
              17.8819848
            ],
            [
              -62.8238419,
              17.8832462
            ],
            [
              -62.8101294,
              17.8922794
            ],
            [
              -62.7989396,
              17.9044864
            ],
            [
              -62.7916561,
              17.9154727
            ],
            [
              -62.8574113,
              17.9250349
            ],
            [
              -62.8661189,
              17.9291446
            ],
            [
              -62.8673396,
              17.9203962
            ],
            [
              -62.8613175,
              17.9054223
            ],
            [
              -62.8509415,
              17.8904483
            ],
            [
              -62.8388566,
              17.8819848
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for north-america/saint-barthelemy.10m.json
GeoJsonFeatureCollection get northAmericaSaintBarthelemy10m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
