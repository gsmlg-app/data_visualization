// Generated from: assets/north-america/saint-lucia.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for north-america/saint-lucia.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Saint Lucia",
        "iso_a2": "LC",
        "iso_a3": "LCA",
        "continent": "North America"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              -60.8952148,
              13.8219727
            ],
            [
              -60.8867676,
              14.0111328
            ],
            [
              -60.9081055,
              14.0933594
            ],
            [
              -60.9445801,
              14.0728516
            ],
            [
              -60.9966797,
              14.0109375
            ],
            [
              -61.0635742,
              13.9155762
            ],
            [
              -61.0731445,
              13.8655762
            ],
            [
              -61.0606445,
              13.7831055
            ],
            [
              -60.951416,
              13.7175781
            ],
            [
              -60.8952148,
              13.8219727
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for north-america/saint-lucia.50m.json
GeoJsonFeatureCollection get northAmericaSaintLucia50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
