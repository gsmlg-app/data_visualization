// Generated from: assets/africa/djibouti.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for africa/djibouti.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Djibouti",
        "iso_a2": "DJ",
        "iso_a3": "DJI",
        "continent": "Africa"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              42.35156,
              12.54223
            ],
            [
              42.0,
              12.1
            ],
            [
              41.66176,
              11.6312
            ],
            [
              41.73959,
              11.35511
            ],
            [
              41.75557,
              11.05091
            ],
            [
              42.31414,
              11.0342
            ],
            [
              42.55493,
              11.10511
            ],
            [
              42.7768518,
              10.9268786
            ],
            [
              43.1453048,
              11.4620397
            ],
            [
              42.7158737,
              11.7356406
            ],
            [
              43.2863815,
              11.9749283
            ],
            [
              43.3178524,
              12.3901484
            ],
            [
              43.081226,
              12.6996386
            ],
            [
              42.7796424,
              12.4554158
            ],
            [
              42.35156,
              12.54223
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for africa/djibouti.110m.json
GeoJsonFeatureCollection get africaDjibouti110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
