// Generated from: assets/africa/equatorial-guinea.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for africa/equatorial-guinea.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Equatorial Guinea",
        "iso_a2": "GQ",
        "iso_a3": "GNQ",
        "continent": "Africa"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              9.6491582,
              2.2838661
            ],
            [
              9.3056132,
              1.1609114
            ],
            [
              9.4928886,
              1.0101195
            ],
            [
              9.8302841,
              1.0678938
            ],
            [
              11.285079,
              1.0576619
            ],
            [
              11.276449,
              2.2610509
            ],
            [
              9.6491582,
              2.2838661
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for africa/equatorial-guinea.110m.json
GeoJsonFeatureCollection get africaEquatorialGuinea110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
