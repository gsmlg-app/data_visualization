// Generated from: assets/europe/guernsey.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for europe/guernsey.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Guernsey",
        "iso_a2": "GG",
        "iso_a3": "GGY",
        "continent": "Europe"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              -2.5123047,
              49.4945312
            ],
            [
              -2.5208984,
              49.5062988
            ],
            [
              -2.5421875,
              49.5065918
            ],
            [
              -2.6461426,
              49.4682129
            ],
            [
              -2.6390137,
              49.4509277
            ],
            [
              -2.5473633,
              49.4287109
            ],
            [
              -2.5123047,
              49.4945312
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for europe/guernsey.50m.json
GeoJsonFeatureCollection get europeGuernsey50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
