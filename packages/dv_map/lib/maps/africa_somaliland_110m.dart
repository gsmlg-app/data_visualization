// Generated from: assets/africa/somaliland.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for africa/somaliland.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Somaliland",
        "iso_a2": "-99",
        "iso_a3": "-99",
        "continent": "Africa"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              48.9482048,
              11.4106173
            ],
            [
              48.9482064,
              11.4106216
            ],
            [
              48.3787838,
              11.3754817
            ],
            [
              48.0215963,
              11.1930639
            ],
            [
              47.5256576,
              11.1272281
            ],
            [
              46.6454012,
              10.8165494
            ],
            [
              45.5569405,
              10.6980295
            ],
            [
              44.6142591,
              10.4422053
            ],
            [
              44.1178036,
              10.4455384
            ],
            [
              43.6666683,
              10.8641692
            ],
            [
              43.4706596,
              11.2777099
            ],
            [
              43.1453048,
              11.4620397
            ],
            [
              42.7768518,
              10.9268786
            ],
            [
              42.55876,
              10.57258
            ],
            [
              42.92812,
              10.02194
            ],
            [
              43.29699,
              9.54048
            ],
            [
              43.67875,
              9.18358
            ],
            [
              46.94834,
              7.99688
            ],
            [
              47.78942,
              8.003
            ],
            [
              48.4867359,
              8.8376262
            ],
            [
              48.9381295,
              9.451749
            ],
            [
              48.9382329,
              9.9735001
            ],
            [
              48.9384912,
              10.9823274
            ],
            [
              48.9420052,
              11.3942661
            ],
            [
              48.9482048,
              11.4106173
            ],
            [
              48.9482048,
              11.4106173
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for africa/somaliland.110m.json
GeoJsonFeatureCollection get africaSomaliland110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
