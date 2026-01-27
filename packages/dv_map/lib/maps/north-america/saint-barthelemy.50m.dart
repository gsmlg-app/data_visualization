// Generated from: assets/north-america/saint-barthelemy.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for north-america/saint-barthelemy.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Saint Barthelemy",
        "iso_a2": "BL",
        "iso_a3": "BLM",
        "continent": "North America"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              -62.8319336,
              17.8764648
            ],
            [
              -62.8181641,
              17.8854492
            ],
            [
              -62.8070312,
              17.8976562
            ],
            [
              -62.799707,
              17.9086914
            ],
            [
              -62.8654297,
              17.9182617
            ],
            [
              -62.8742187,
              17.9222656
            ],
            [
              -62.8754395,
              17.9135742
            ],
            [
              -62.8693848,
              17.898584
            ],
            [
              -62.8589355,
              17.8836426
            ],
            [
              -62.8469238,
              17.8751953
            ],
            [
              -62.8319336,
              17.8764648
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for north-america/saint-barthelemy.50m.json
GeoJsonFeatureCollection get northAmericaSaintBarthelemy50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
