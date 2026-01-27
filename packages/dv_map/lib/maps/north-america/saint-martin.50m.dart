// Generated from: assets/north-america/saint-martin.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for north-america/saint-martin.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Saint Martin",
        "iso_a2": "MF",
        "iso_a3": "MAF",
        "continent": "North America"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              -63.0111816,
              18.0689453
            ],
            [
              -63.0094238,
              18.1042969
            ],
            [
              -63.0248047,
              18.1130859
            ],
            [
              -63.0630859,
              18.115332
            ],
            [
              -63.1149902,
              18.0907227
            ],
            [
              -63.1230469,
              18.0689453
            ],
            [
              -63.0111816,
              18.0689453
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for north-america/saint-martin.50m.json
GeoJsonFeatureCollection get northAmericaSaintMartin50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
