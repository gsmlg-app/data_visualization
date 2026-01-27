// Generated from: assets/asia/nepal.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for asia/nepal.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Nepal",
        "iso_a2": "NP",
        "iso_a3": "NPL",
        "continent": "Asia"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              88.1204407,
              27.8765417
            ],
            [
              86.954517,
              27.9742618
            ],
            [
              85.8233199,
              28.203576
            ],
            [
              85.0116382,
              28.642774
            ],
            [
              84.2345797,
              28.8398937
            ],
            [
              83.898993,
              29.3202261
            ],
            [
              83.3371151,
              29.4637316
            ],
            [
              82.3275126,
              30.1152681
            ],
            [
              81.5258045,
              30.422717
            ],
            [
              81.1112561,
              30.1834809
            ],
            [
              80.4767212,
              29.7298652
            ],
            [
              80.0884245,
              28.7944701
            ],
            [
              81.0572026,
              28.4160953
            ],
            [
              81.9999874,
              27.9254792
            ],
            [
              83.3042489,
              27.3645057
            ],
            [
              84.6750179,
              27.2349012
            ],
            [
              85.2517786,
              26.7261984
            ],
            [
              86.0243929,
              26.6309846
            ],
            [
              87.227472,
              26.3978981
            ],
            [
              88.0602377,
              26.4146154
            ],
            [
              88.1748043,
              26.8104052
            ],
            [
              88.0431328,
              27.4458186
            ],
            [
              88.1204407,
              27.8765417
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for asia/nepal.110m.json
GeoJsonFeatureCollection get asiaNepal110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
