// Generated from: assets/asia/palestine.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for asia/palestine.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Palestine",
        "iso_a2": "PS",
        "iso_a3": "PSE",
        "continent": "Asia"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              35.3975607,
              31.489086
            ],
            [
              35.5452519,
              31.7825048
            ],
            [
              35.5456653,
              32.393992
            ],
            [
              35.1839303,
              32.5325107
            ],
            [
              34.9746407,
              31.8665823
            ],
            [
              35.2258916,
              31.7543411
            ],
            [
              34.9705066,
              31.6167785
            ],
            [
              34.9274085,
              31.3534354
            ],
            [
              35.3975607,
              31.489086
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for asia/palestine.110m.json
GeoJsonFeatureCollection get asiaPalestine110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
