// Generated from: assets/asia/jordan.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for asia/jordan.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Jordan",
        "iso_a2": "JO",
        "iso_a3": "JOR",
        "continent": "Asia"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              35.5456653,
              32.393992
            ],
            [
              35.5452519,
              31.7825048
            ],
            [
              35.3975607,
              31.489086
            ],
            [
              35.4209184,
              31.1000658
            ],
            [
              34.9226026,
              29.5013262
            ],
            [
              34.9560372,
              29.3565547
            ],
            [
              36.0689409,
              29.1974946
            ],
            [
              36.5012142,
              29.5052536
            ],
            [
              36.7405278,
              29.8652833
            ],
            [
              37.503582,
              30.0037762
            ],
            [
              37.6681197,
              30.3386653
            ],
            [
              37.9988489,
              30.5084999
            ],
            [
              37.0021656,
              31.508413
            ],
            [
              39.0048857,
              32.010217
            ],
            [
              39.1954684,
              32.1610088
            ],
            [
              38.7923405,
              33.3786864
            ],
            [
              36.8340621,
              32.3129375
            ],
            [
              35.7199182,
              32.7091924
            ],
            [
              35.5456653,
              32.393992
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for asia/jordan.110m.json
GeoJsonFeatureCollection get asiaJordan110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
