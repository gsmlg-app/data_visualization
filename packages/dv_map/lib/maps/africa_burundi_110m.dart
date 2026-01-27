// Generated from: assets/africa/burundi.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for africa/burundi.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Burundi",
        "iso_a2": "BI",
        "iso_a3": "BDI",
        "continent": "Africa"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              30.4696736,
              -2.4138548
            ],
            [
              29.938359,
              -2.3484868
            ],
            [
              29.6321761,
              -2.9178578
            ],
            [
              29.0249264,
              -2.8392579
            ],
            [
              29.2763839,
              -3.2939072
            ],
            [
              29.3399976,
              -4.4999834
            ],
            [
              29.7535124,
              -4.4523894
            ],
            [
              30.11632,
              -4.09012
            ],
            [
              30.50554,
              -3.56858
            ],
            [
              30.75224,
              -3.35931
            ],
            [
              30.74301,
              -3.03431
            ],
            [
              30.52766,
              -2.80762
            ],
            [
              30.4696736,
              -2.4138548
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for africa/burundi.110m.json
GeoJsonFeatureCollection get africaBurundi110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
