// Generated from: assets/asia/scarborough-reef.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for asia/scarborough-reef.10m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Scarborough Reef",
        "iso_a2": "-99",
        "iso_a3": "-99",
        "continent": "Asia"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              117.7538872,
              15.1543693
            ],
            [
              117.7518564,
              15.1518872
            ],
            [
              117.7538872,
              15.150082
            ],
            [
              117.7556923,
              15.1518872
            ],
            [
              117.7538872,
              15.1543693
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for asia/scarborough-reef.10m.json
GeoJsonFeatureCollection get asiaScarboroughReef10m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
