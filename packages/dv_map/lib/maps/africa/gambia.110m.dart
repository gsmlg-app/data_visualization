// Generated from: assets/africa/gambia.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for africa/gambia.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Gambia",
        "iso_a2": "GM",
        "iso_a3": "GMB",
        "continent": "Africa"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              -16.7137288,
              13.5949586
            ],
            [
              -16.8415246,
              13.1513939
            ],
            [
              -15.9312959,
              13.1302841
            ],
            [
              -15.6910005,
              13.2703531
            ],
            [
              -15.5118125,
              13.2785696
            ],
            [
              -15.1411633,
              13.5095116
            ],
            [
              -14.7121972,
              13.2982067
            ],
            [
              -14.2777018,
              13.280585
            ],
            [
              -13.8449633,
              13.5050416
            ],
            [
              -14.0469924,
              13.7940679
            ],
            [
              -14.3767138,
              13.6256802
            ],
            [
              -14.6870308,
              13.630357
            ],
            [
              -15.0817354,
              13.8764918
            ],
            [
              -15.3987703,
              13.8603688
            ],
            [
              -15.6245963,
              13.6235873
            ],
            [
              -16.7137288,
              13.5949586
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for africa/gambia.110m.json
GeoJsonFeatureCollection get africaGambia110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
