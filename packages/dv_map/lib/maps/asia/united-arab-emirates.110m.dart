// Generated from: assets/asia/united-arab-emirates.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for asia/united-arab-emirates.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "United Arab Emirates",
        "iso_a2": "AE",
        "iso_a3": "ARE",
        "continent": "Asia"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              51.5795187,
              24.2454971
            ],
            [
              51.6177076,
              24.0142193
            ],
            [
              52.0007333,
              23.0011545
            ],
            [
              55.006803,
              22.4969475
            ],
            [
              55.2083411,
              22.70833
            ],
            [
              55.2344894,
              23.1109927
            ],
            [
              55.5258411,
              23.5248693
            ],
            [
              55.5286316,
              23.933604
            ],
            [
              55.9812138,
              24.1305429
            ],
            [
              55.8041187,
              24.2696042
            ],
            [
              55.8862325,
              24.9208306
            ],
            [
              56.3968474,
              24.9247322
            ],
            [
              56.2610417,
              25.7146064
            ],
            [
              56.0708208,
              26.0554642
            ],
            [
              55.4390247,
              25.4391452
            ],
            [
              54.6930237,
              24.7978924
            ],
            [
              54.0080009,
              24.1217579
            ],
            [
              53.4040068,
              24.1513168
            ],
            [
              52.5770805,
              24.1774393
            ],
            [
              51.7943893,
              24.0198262
            ],
            [
              51.7574406,
              24.294073
            ],
            [
              51.5795187,
              24.2454971
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for asia/united-arab-emirates.110m.json
GeoJsonFeatureCollection get asiaUnitedArabEmirates110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
