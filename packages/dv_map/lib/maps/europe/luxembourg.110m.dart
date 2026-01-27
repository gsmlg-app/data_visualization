// Generated from: assets/europe/luxembourg.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for europe/luxembourg.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Luxembourg",
        "iso_a2": "LU",
        "iso_a3": "LUX",
        "continent": "Europe"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              6.0430734,
              50.1280517
            ],
            [
              5.7824174,
              50.0903279
            ],
            [
              5.674052,
              49.5294835
            ],
            [
              5.8977592,
              49.4426671
            ],
            [
              6.1863204,
              49.4638028
            ],
            [
              6.2427511,
              49.9022257
            ],
            [
              6.0430734,
              50.1280517
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for europe/luxembourg.110m.json
GeoJsonFeatureCollection get europeLuxembourg110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
