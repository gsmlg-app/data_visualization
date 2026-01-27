// Generated from: assets/north-america/anguilla.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for north-america/anguilla.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Anguilla",
        "iso_a2": "AI",
        "iso_a3": "AIA",
        "continent": "North America"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              -63.0012207,
              18.2217773
            ],
            [
              -62.9795898,
              18.2647949
            ],
            [
              -63.0260254,
              18.2697266
            ],
            [
              -63.1533203,
              18.200293
            ],
            [
              -63.1600098,
              18.1713867
            ],
            [
              -63.0012207,
              18.2217773
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for north-america/anguilla.50m.json
GeoJsonFeatureCollection get northAmericaAnguilla50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
