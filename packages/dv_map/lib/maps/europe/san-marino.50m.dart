// Generated from: assets/europe/san-marino.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for europe/san-marino.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "San Marino",
        "iso_a2": "SM",
        "iso_a3": "SMR",
        "continent": "Europe"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              12.4852539,
              43.901416
            ],
            [
              12.5146484,
              43.9529785
            ],
            [
              12.5037109,
              43.9897461
            ],
            [
              12.4411133,
              43.9824219
            ],
            [
              12.396875,
              43.9345703
            ],
            [
              12.4263672,
              43.8940918
            ],
            [
              12.4852539,
              43.901416
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for europe/san-marino.50m.json
GeoJsonFeatureCollection get europeSanMarino50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
