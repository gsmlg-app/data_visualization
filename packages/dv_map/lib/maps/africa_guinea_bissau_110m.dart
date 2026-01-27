// Generated from: assets/africa/guinea-bissau.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for africa/guinea-bissau.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Guinea-Bissau",
        "iso_a2": "GW",
        "iso_a3": "GNB",
        "continent": "Africa"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              -16.677452,
              12.3848516
            ],
            [
              -16.6138383,
              12.1709112
            ],
            [
              -16.3089473,
              11.9587019
            ],
            [
              -16.3147867,
              11.8065148
            ],
            [
              -16.0852142,
              11.524594
            ],
            [
              -15.6641805,
              11.458474
            ],
            [
              -15.1303112,
              11.0404117
            ],
            [
              -14.6856872,
              11.5278238
            ],
            [
              -14.3821915,
              11.509272
            ],
            [
              -14.1214064,
              11.677117
            ],
            [
              -13.9007997,
              11.678719
            ],
            [
              -13.7431608,
              11.811269
            ],
            [
              -13.8282719,
              12.1426442
            ],
            [
              -13.7187437,
              12.2471856
            ],
            [
              -13.700476,
              12.586183
            ],
            [
              -15.5484769,
              12.6281701
            ],
            [
              -15.8165743,
              12.5155671
            ],
            [
              -16.1477168,
              12.5477615
            ],
            [
              -16.677452,
              12.3848516
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for africa/guinea-bissau.110m.json
GeoJsonFeatureCollection get africaGuineaBissau110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
