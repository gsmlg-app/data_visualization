// Generated from: assets/africa/bir-tawil.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for africa/bir-tawil.10m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Bir Tawil",
        "iso_a2": "-99",
        "iso_a3": "-99",
        "continent": "Africa"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              33.1811356,
              21.9954095
            ],
            [
              33.303681,
              21.9030222
            ],
            [
              33.4395771,
              21.8005699
            ],
            [
              33.558442,
              21.7109574
            ],
            [
              33.7172637,
              21.7309466
            ],
            [
              33.8664565,
              21.749724
            ],
            [
              33.9991176,
              21.7673527
            ],
            [
              34.0841794,
              21.9954544
            ],
            [
              34.0761273,
              21.9954544
            ],
            [
              33.8577055,
              21.9954544
            ],
            [
              33.6250582,
              21.9954544
            ],
            [
              33.3923593,
              21.9954544
            ],
            [
              33.1811356,
              21.9954095
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for africa/bir-tawil.10m.json
GeoJsonFeatureCollection get africaBirTawil10m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
