// Generated from: assets/africa/eswatini.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for africa/eswatini.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "eSwatini",
        "iso_a2": "SZ",
        "iso_a3": "SWZ",
        "continent": "Africa"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              32.0716655,
              -26.7338201
            ],
            [
              31.9857792,
              -26.2917799
            ],
            [
              31.8377779,
              -25.8433318
            ],
            [
              31.3331576,
              -25.6601905
            ],
            [
              31.0440796,
              -25.7314523
            ],
            [
              30.9496668,
              -26.022649
            ],
            [
              30.6766085,
              -26.3980783
            ],
            [
              30.6859619,
              -26.7438453
            ],
            [
              31.2827731,
              -27.2858794
            ],
            [
              31.8680603,
              -27.1779273
            ],
            [
              32.0716655,
              -26.7338201
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for africa/eswatini.110m.json
GeoJsonFeatureCollection get africaEswatini110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
