// Generated from: assets/north-america/aruba.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for north-america/aruba.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Aruba",
        "iso_a2": "AW",
        "iso_a3": "ABW",
        "continent": "North America"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              -69.8991211,
              12.452002
            ],
            [
              -69.9118164,
              12.4804688
            ],
            [
              -69.9731445,
              12.567627
            ],
            [
              -70.0351074,
              12.6141113
            ],
            [
              -70.0508789,
              12.5970703
            ],
            [
              -70.0661133,
              12.5469727
            ],
            [
              -70.0041504,
              12.5004883
            ],
            [
              -69.9421875,
              12.4385254
            ],
            [
              -69.8957031,
              12.422998
            ],
            [
              -69.8991211,
              12.452002
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for north-america/aruba.50m.json
GeoJsonFeatureCollection get northAmericaAruba50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
