// Generated from: assets/asia/qatar.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for asia/qatar.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Qatar",
        "iso_a2": "QA",
        "iso_a3": "QAT",
        "continent": "Asia"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              50.8101083,
              24.7547425
            ],
            [
              51.1124154,
              24.5563309
            ],
            [
              51.3896078,
              24.627386
            ],
            [
              51.6067005,
              25.2156705
            ],
            [
              51.5890788,
              25.8011128
            ],
            [
              51.2864616,
              26.114582
            ],
            [
              51.0133517,
              26.0069917
            ],
            [
              50.7439108,
              25.4824242
            ],
            [
              50.8101083,
              24.7547425
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for asia/qatar.110m.json
GeoJsonFeatureCollection get asiaQatar110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
