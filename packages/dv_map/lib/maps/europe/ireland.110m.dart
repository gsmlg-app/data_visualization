// Generated from: assets/europe/ireland.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for europe/ireland.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Ireland",
        "iso_a2": "IE",
        "iso_a3": "IRL",
        "continent": "Europe"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              -6.1978849,
              53.867565
            ],
            [
              -6.9537302,
              54.0737023
            ],
            [
              -7.5721679,
              54.0599564
            ],
            [
              -7.3660306,
              54.595841
            ],
            [
              -7.5721679,
              55.1316222
            ],
            [
              -8.3279874,
              54.6645189
            ],
            [
              -9.6885245,
              53.8813626
            ],
            [
              -9.1662825,
              52.8646288
            ],
            [
              -9.9770857,
              51.8204548
            ],
            [
              -8.5616166,
              51.6693013
            ],
            [
              -6.7888566,
              52.2601179
            ],
            [
              -6.0329854,
              53.1531642
            ],
            [
              -6.1978849,
              53.867565
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for europe/ireland.110m.json
GeoJsonFeatureCollection get europeIreland110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
