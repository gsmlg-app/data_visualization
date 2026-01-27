// Generated from: assets/asia/east-timor.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for asia/east-timor.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "East Timor",
        "iso_a2": "TL",
        "iso_a3": "TLS",
        "continent": "Asia"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              124.9686825,
              -8.8927902
            ],
            [
              125.07002,
              -9.0899875
            ],
            [
              125.0885201,
              -9.3931731
            ],
            [
              125.925885,
              -9.1060072
            ],
            [
              126.967992,
              -8.6682561
            ],
            [
              127.3359282,
              -8.3973166
            ],
            [
              126.9572433,
              -8.2733448
            ],
            [
              126.6447042,
              -8.3982468
            ],
            [
              125.9470724,
              -8.4320948
            ],
            [
              125.0862464,
              -8.6568873
            ],
            [
              124.9686825,
              -8.8927902
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for asia/east-timor.110m.json
GeoJsonFeatureCollection get asiaEastTimor110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
