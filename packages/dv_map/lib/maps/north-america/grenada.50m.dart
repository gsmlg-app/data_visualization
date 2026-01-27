// Generated from: assets/north-america/grenada.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for north-america/grenada.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Grenada",
        "iso_a2": "GD",
        "iso_a3": "GRD",
        "continent": "North America"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              -61.7155273,
              12.0126465
            ],
            [
              -61.6271484,
              12.0539551
            ],
            [
              -61.6070312,
              12.223291
            ],
            [
              -61.6604492,
              12.2370117
            ],
            [
              -61.7149902,
              12.1851562
            ],
            [
              -61.7499023,
              12.1084473
            ],
            [
              -61.7557617,
              12.045459
            ],
            [
              -61.7821777,
              12.0084473
            ],
            [
              -61.7155273,
              12.0126465
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for north-america/grenada.50m.json
GeoJsonFeatureCollection get northAmericaGrenada50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
