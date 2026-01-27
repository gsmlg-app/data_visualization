// Generated from: assets/north-america/dominica.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for north-america/dominica.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Dominica",
        "iso_a2": "DM",
        "iso_a3": "DMA",
        "continent": "North America"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              -61.2816895,
              15.2490234
            ],
            [
              -61.2510742,
              15.3731445
            ],
            [
              -61.2772461,
              15.526709
            ],
            [
              -61.3200195,
              15.5850586
            ],
            [
              -61.4581055,
              15.6331055
            ],
            [
              -61.4699219,
              15.6034668
            ],
            [
              -61.4811523,
              15.5251465
            ],
            [
              -61.4157227,
              15.3998535
            ],
            [
              -61.3753906,
              15.2272949
            ],
            [
              -61.2816895,
              15.2490234
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for north-america/dominica.50m.json
GeoJsonFeatureCollection get northAmericaDominica50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
