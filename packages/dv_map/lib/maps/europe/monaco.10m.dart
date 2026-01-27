// Generated from: assets/europe/monaco.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for europe/monaco.10m.json
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
              7.437454,
              43.7433605
            ],
            [
              7.4262461,
              43.7554642
            ],
            [
              7.4069686,
              43.7635056
            ],
            [
              7.3875383,
              43.7578987
            ],
            [
              7.3726555,
              43.7458322
            ],
            [
              7.3672626,
              43.7341245
            ],
            [
              7.3657502,
              43.7227303
            ],
            [
              7.3807225,
              43.7192731
            ],
            [
              7.4043191,
              43.7179691
            ],
            [
              7.4179569,
              43.7309038
            ],
            [
              7.4328451,
              43.7398525
            ],
            [
              7.437454,
              43.7433605
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for europe/monaco.10m.json
GeoJsonFeatureCollection get europeMonaco10m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
