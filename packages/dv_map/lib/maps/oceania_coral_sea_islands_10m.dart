// Generated from: assets/oceania/coral-sea-islands.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for oceania/coral-sea-islands.10m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Coral Sea Islands",
        "iso_a2": "-99",
        "iso_a3": "-99",
        "continent": "Oceania"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              154.3912867,
              -21.0300432
            ],
            [
              154.3912867,
              -21.0287411
            ],
            [
              154.3885197,
              -21.0290667
            ],
            [
              154.3912867,
              -21.0300432
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for oceania/coral-sea-islands.10m.json
GeoJsonFeatureCollection get oceaniaCoralSeaIslands10m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
