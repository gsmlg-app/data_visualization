// Generated from: assets/asia/cyprus.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for asia/cyprus.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Cyprus",
        "iso_a2": "CY",
        "iso_a3": "CYP",
        "continent": "Asia"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              32.7317802,
              35.1400259
            ],
            [
              32.2566671,
              35.1032323
            ],
            [
              32.4902963,
              34.7016548
            ],
            [
              32.9798271,
              34.5718694
            ],
            [
              34.0048808,
              34.9780978
            ],
            [
              33.9736166,
              35.0585064
            ],
            [
              33.8664397,
              35.0935947
            ],
            [
              33.6753919,
              35.0178629
            ],
            [
              33.5256853,
              35.0386885
            ],
            [
              33.4758175,
              35.0003446
            ],
            [
              33.4559221,
              35.1014237
            ],
            [
              33.3838334,
              35.1627119
            ],
            [
              33.190977,
              35.1731247
            ],
            [
              32.9195724,
              35.0878327
            ],
            [
              32.7317802,
              35.1400259
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for asia/cyprus.110m.json
GeoJsonFeatureCollection get asiaCyprus110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
