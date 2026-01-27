// Generated from: assets/oceania/niue.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for oceania/niue.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Niue",
        "iso_a2": "NU",
        "iso_a3": "NIU",
        "continent": "Oceania"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              -169.803418,
              -19.0830078
            ],
            [
              -169.7934082,
              -19.0425781
            ],
            [
              -169.8340332,
              -18.9660156
            ],
            [
              -169.8615723,
              -18.9686523
            ],
            [
              -169.9087402,
              -18.9902344
            ],
            [
              -169.9483398,
              -19.0728516
            ],
            [
              -169.9038086,
              -19.1378906
            ],
            [
              -169.803418,
              -19.0830078
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for oceania/niue.50m.json
GeoJsonFeatureCollection get oceaniaNiue50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
