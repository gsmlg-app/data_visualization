// Generated from: assets/europe/netherlands.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for europe/netherlands.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Netherlands",
        "iso_a2": "NL",
        "iso_a3": "NLD",
        "continent": "Europe"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              6.9051396,
              53.4821622
            ],
            [
              6.0741826,
              53.5104033
            ],
            [
              4.7059973,
              53.0917984
            ],
            [
              3.8302885,
              51.6205445
            ],
            [
              3.3150115,
              51.3457766
            ],
            [
              3.3149711,
              51.3457551
            ],
            [
              4.0470712,
              51.2672586
            ],
            [
              4.9739913,
              51.4750237
            ],
            [
              5.6069759,
              51.0372985
            ],
            [
              6.1566582,
              50.803721
            ],
            [
              5.9886581,
              51.8516157
            ],
            [
              6.5893966,
              51.8520291
            ],
            [
              6.8428695,
              52.2284403
            ],
            [
              7.0920533,
              53.1440433
            ],
            [
              6.9051396,
              53.4821622
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for europe/netherlands.110m.json
GeoJsonFeatureCollection get europeNetherlands110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
