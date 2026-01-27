// Generated from: assets/asia/taiwan.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for asia/taiwan.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Taiwan",
        "iso_a2": "CN-TW",
        "iso_a3": "TWN",
        "continent": "Asia"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              121.7778178,
              24.3942736
            ],
            [
              121.9512439,
              24.9975959
            ],
            [
              121.4950444,
              25.2954589
            ],
            [
              120.6946798,
              24.5384508
            ],
            [
              120.1061886,
              23.5562627
            ],
            [
              120.2200834,
              22.8148609
            ],
            [
              120.7470797,
              21.9705714
            ],
            [
              121.1756324,
              22.7908572
            ],
            [
              121.7778178,
              24.3942736
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for asia/taiwan.110m.json
GeoJsonFeatureCollection get asiaTaiwan110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
