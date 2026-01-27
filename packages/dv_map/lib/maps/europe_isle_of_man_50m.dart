// Generated from: assets/europe/isle-of-man.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for europe/isle-of-man.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Isle of Man",
        "iso_a2": "IM",
        "iso_a3": "IMN",
        "continent": "Europe"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              -4.4120605,
              54.1853516
            ],
            [
              -4.3922852,
              54.2253906
            ],
            [
              -4.3379883,
              54.2690918
            ],
            [
              -4.3771973,
              54.3925781
            ],
            [
              -4.3955566,
              54.4029297
            ],
            [
              -4.424707,
              54.4071777
            ],
            [
              -4.5086426,
              54.376709
            ],
            [
              -4.6148437,
              54.2669434
            ],
            [
              -4.6987305,
              54.2249023
            ],
            [
              -4.7455566,
              54.1187988
            ],
            [
              -4.7853516,
              54.0730469
            ],
            [
              -4.7657715,
              54.0694336
            ],
            [
              -4.6960937,
              54.0814453
            ],
            [
              -4.6142578,
              54.0586914
            ],
            [
              -4.4120605,
              54.1853516
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for europe/isle-of-man.50m.json
GeoJsonFeatureCollection get europeIsleOfMan50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
