// Generated from: assets/oceania/guam.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for oceania/guam.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Guam",
        "iso_a2": "GU",
        "iso_a3": "GUM",
        "continent": "Oceania"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              144.7417969,
              13.2592773
            ],
            [
              144.7798828,
              13.4111328
            ],
            [
              144.9408203,
              13.5703125
            ],
            [
              144.909668,
              13.5990234
            ],
            [
              144.8753906,
              13.6146484
            ],
            [
              144.8367188,
              13.6223633
            ],
            [
              144.790332,
              13.5268555
            ],
            [
              144.6493164,
              13.4287109
            ],
            [
              144.65,
              13.3134766
            ],
            [
              144.662793,
              13.2910645
            ],
            [
              144.6995117,
              13.2575195
            ],
            [
              144.7417969,
              13.2592773
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for oceania/guam.50m.json
GeoJsonFeatureCollection get oceaniaGuam50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
