// Generated from: assets/oceania/nauru.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for oceania/nauru.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Nauru",
        "iso_a2": "NR",
        "iso_a3": "NRU",
        "continent": "Oceania"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              166.9583984,
              -0.5166016
            ],
            [
              166.9556641,
              -0.4969727
            ],
            [
              166.9389648,
              -0.4893555
            ],
            [
              166.9135742,
              -0.4991211
            ],
            [
              166.9070313,
              -0.5237305
            ],
            [
              166.9164063,
              -0.5464844
            ],
            [
              166.9389648,
              -0.5507812
            ],
            [
              166.9583984,
              -0.5166016
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for oceania/nauru.50m.json
GeoJsonFeatureCollection get oceaniaNauru50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
