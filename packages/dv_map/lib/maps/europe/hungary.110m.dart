// Generated from: assets/europe/hungary.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for europe/hungary.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Hungary",
        "iso_a2": "HU",
        "iso_a3": "HUN",
        "continent": "Europe"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              22.0856084,
              48.4222643
            ],
            [
              21.8722364,
              48.3199708
            ],
            [
              20.801294,
              48.6238541
            ],
            [
              20.473562,
              48.56285
            ],
            [
              20.2390544,
              48.3275672
            ],
            [
              19.7694707,
              48.2026911
            ],
            [
              19.6613636,
              48.2666149
            ],
            [
              19.1743649,
              48.1113789
            ],
            [
              18.7770248,
              48.0817683
            ],
            [
              18.6965129,
              47.8809537
            ],
            [
              17.8571326,
              47.7584289
            ],
            [
              17.4884729,
              47.8674661
            ],
            [
              16.9796668,
              48.123497
            ],
            [
              16.9037541,
              47.7148656
            ],
            [
              16.3405843,
              47.7129019
            ],
            [
              16.5342676,
              47.496171
            ],
            [
              16.2022982,
              46.852386
            ],
            [
              16.370505,
              46.8413272
            ],
            [
              16.5648084,
              46.5037509
            ],
            [
              16.8825151,
              46.3806318
            ],
            [
              17.6300664,
              45.9517691
            ],
            [
              18.4560625,
              45.7594811
            ],
            [
              18.8298248,
              45.9088724
            ],
            [
              18.8298381,
              45.9088777
            ],
            [
              19.5960445,
              46.1717298
            ],
            [
              20.2201925,
              46.127469
            ],
            [
              21.0219523,
              46.316088
            ],
            [
              21.6265149,
              46.9942378
            ],
            [
              22.0997677,
              47.6724393
            ],
            [
              22.7105314,
              47.8821939
            ],
            [
              22.6408199,
              48.1502396
            ],
            [
              22.0856084,
              48.4222643
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for europe/hungary.110m.json
GeoJsonFeatureCollection get europeHungary110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
