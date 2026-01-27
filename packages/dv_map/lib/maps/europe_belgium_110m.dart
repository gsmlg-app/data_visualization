// Generated from: assets/europe/belgium.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for europe/belgium.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Belgium",
        "iso_a2": "BE",
        "iso_a3": "BEL",
        "continent": "Europe"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              6.1566582,
              50.803721
            ],
            [
              5.6069759,
              51.0372985
            ],
            [
              4.9739913,
              51.4750237
            ],
            [
              4.0470712,
              51.2672586
            ],
            [
              3.3149711,
              51.3457551
            ],
            [
              3.3150115,
              51.3457766
            ],
            [
              3.3149711,
              51.345781
            ],
            [
              2.513573,
              51.1485062
            ],
            [
              2.6584221,
              50.796848
            ],
            [
              3.1232516,
              50.7803633
            ],
            [
              3.5881844,
              50.3789924
            ],
            [
              4.286023,
              49.9074966
            ],
            [
              4.7992216,
              49.985373
            ],
            [
              5.674052,
              49.5294835
            ],
            [
              5.7824174,
              50.0903279
            ],
            [
              6.0430734,
              50.1280517
            ],
            [
              6.1566582,
              50.803721
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for europe/belgium.110m.json
GeoJsonFeatureCollection get europeBelgium110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
