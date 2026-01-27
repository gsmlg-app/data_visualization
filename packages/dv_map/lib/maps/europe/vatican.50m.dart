// Generated from: assets/europe/vatican.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for europe/vatican.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Vatican",
        "iso_a2": "VA",
        "iso_a3": "VAT",
        "continent": "Europe"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              12.4391602,
              41.8983887
            ],
            [
              12.4383789,
              41.9062012
            ],
            [
              12.4305664,
              41.9054687
            ],
            [
              12.4275391,
              41.9007324
            ],
            [
              12.4305664,
              41.8975586
            ],
            [
              12.4391602,
              41.8983887
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for europe/vatican.50m.json
GeoJsonFeatureCollection get europeVatican50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
