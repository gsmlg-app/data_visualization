// Generated from: assets/asia/kuwait.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for asia/kuwait.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Kuwait",
        "iso_a2": "KW",
        "iso_a3": "KWT",
        "continent": "Asia"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              47.9745191,
              29.9758192
            ],
            [
              47.3026221,
              30.0590699
            ],
            [
              46.5687134,
              29.0990252
            ],
            [
              47.4598218,
              29.0025194
            ],
            [
              47.7088505,
              28.5260627
            ],
            [
              48.4160942,
              28.5520043
            ],
            [
              48.0939433,
              29.3062993
            ],
            [
              48.1831885,
              29.5344766
            ],
            [
              47.9745191,
              29.9758192
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for asia/kuwait.110m.json
GeoJsonFeatureCollection get asiaKuwait110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
