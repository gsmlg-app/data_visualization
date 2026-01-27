// Generated from: assets/europe/vatican.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for europe/vatican.10m.json
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
              12.4531369,
              41.9027519
            ],
            [
              12.4540354,
              41.9027519
            ],
            [
              12.4539826,
              41.9038619
            ],
            [
              12.4530312,
              41.9039147
            ],
            [
              12.4527669,
              41.903439
            ],
            [
              12.4527141,
              41.9030162
            ],
            [
              12.4531369,
              41.9027519
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for europe/vatican.10m.json
GeoJsonFeatureCollection get europeVatican10m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
