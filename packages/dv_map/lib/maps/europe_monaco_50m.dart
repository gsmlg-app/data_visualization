// Generated from: assets/europe/monaco.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for europe/monaco.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Monaco",
        "iso_a2": "MC",
        "iso_a3": "MCO",
        "continent": "Europe"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              7.4386719,
              43.7504395
            ],
            [
              7.4369141,
              43.7614746
            ],
            [
              7.4144531,
              43.7708984
            ],
            [
              7.3950195,
              43.765332
            ],
            [
              7.3800781,
              43.7532227
            ],
            [
              7.3777344,
              43.7317383
            ],
            [
              7.4386719,
              43.7504395
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for europe/monaco.50m.json
GeoJsonFeatureCollection get europeMonaco50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
