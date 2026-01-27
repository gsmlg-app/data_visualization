// Generated from: assets/africa/togo.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for africa/togo.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Togo",
        "iso_a2": "TG",
        "iso_a3": "TGO",
        "continent": "Africa"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              0.899563,
              10.9973394
            ],
            [
              0.0238025,
              11.0186817
            ],
            [
              -0.0497847,
              10.7069178
            ],
            [
              0.36758,
              10.1912129
            ],
            [
              0.3659005,
              9.465004
            ],
            [
              0.4611918,
              8.6772226
            ],
            [
              0.7120292,
              8.3124645
            ],
            [
              0.4909575,
              7.4117443
            ],
            [
              0.5703841,
              6.9143586
            ],
            [
              0.8369312,
              6.2799787
            ],
            [
              1.0601217,
              5.9288374
            ],
            [
              1.8652405,
              6.1421577
            ],
            [
              1.6189506,
              6.8320381
            ],
            [
              1.6644776,
              9.1285904
            ],
            [
              1.4630428,
              9.3346243
            ],
            [
              1.4250607,
              9.8253954
            ],
            [
              1.077795,
              10.1756066
            ],
            [
              0.7723356,
              10.4708082
            ],
            [
              0.899563,
              10.9973394
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for africa/togo.110m.json
GeoJsonFeatureCollection get africaTogo110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
