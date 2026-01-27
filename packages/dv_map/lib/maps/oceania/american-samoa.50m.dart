// Generated from: assets/oceania/american-samoa.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for oceania/american-samoa.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "American Samoa",
        "iso_a2": "AS",
        "iso_a3": "ASM",
        "continent": "Oceania"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              -170.7262695,
              -14.3511719
            ],
            [
              -170.6404785,
              -14.2822266
            ],
            [
              -170.5681152,
              -14.2667969
            ],
            [
              -170.6891602,
              -14.2574219
            ],
            [
              -170.7208496,
              -14.2759766
            ],
            [
              -170.8205078,
              -14.3121094
            ],
            [
              -170.7692383,
              -14.3597656
            ],
            [
              -170.7262695,
              -14.3511719
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for oceania/american-samoa.50m.json
GeoJsonFeatureCollection get oceaniaAmericanSamoa50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
