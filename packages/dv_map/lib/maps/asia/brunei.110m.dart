// Generated from: assets/asia/brunei.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for asia/brunei.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Brunei",
        "iso_a2": "BN",
        "iso_a3": "BRN",
        "continent": "Asia"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              115.4507105,
              5.4477298
            ],
            [
              114.5999614,
              4.9000113
            ],
            [
              114.2040166,
              4.5258739
            ],
            [
              114.659596,
              4.0076368
            ],
            [
              114.8695573,
              4.3483137
            ],
            [
              115.347461,
              4.3166361
            ],
            [
              115.4057003,
              4.9552276
            ],
            [
              115.4507105,
              5.4477298
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for asia/brunei.110m.json
GeoJsonFeatureCollection get asiaBrunei110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
