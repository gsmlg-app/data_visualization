// Generated from: assets/europe/luxembourg.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for europe/luxembourg.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Luxembourg",
        "iso_a2": "LU",
        "iso_a3": "LUX",
        "continent": "Europe"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              6.1165039,
              50.1209961
            ],
            [
              6.1100586,
              50.1237793
            ],
            [
              6.0890625,
              50.1545898
            ],
            [
              6.0547852,
              50.1542969
            ],
            [
              5.9762695,
              50.1671875
            ],
            [
              5.8668945,
              50.0828125
            ],
            [
              5.8173828,
              50.0126953
            ],
            [
              5.7880859,
              49.9612305
            ],
            [
              5.744043,
              49.9196289
            ],
            [
              5.7352539,
              49.8756348
            ],
            [
              5.7408203,
              49.8571777
            ],
            [
              5.7257813,
              49.8333496
            ],
            [
              5.725,
              49.8083008
            ],
            [
              5.7879883,
              49.7588867
            ],
            [
              5.8037109,
              49.7321777
            ],
            [
              5.8803711,
              49.6447754
            ],
            [
              5.856543,
              49.6128418
            ],
            [
              5.8375977,
              49.5783203
            ],
            [
              5.8154297,
              49.5538086
            ],
            [
              5.7897461,
              49.5382812
            ],
            [
              5.8234375,
              49.5050781
            ],
            [
              5.9013672,
              49.4897461
            ],
            [
              5.9289063,
              49.4775391
            ],
            [
              5.9594727,
              49.4546387
            ],
            [
              6.0114258,
              49.445459
            ],
            [
              6.0741211,
              49.4546387
            ],
            [
              6.1199219,
              49.4852051
            ],
            [
              6.1810547,
              49.4989258
            ],
            [
              6.2421875,
              49.4943359
            ],
            [
              6.2773438,
              49.4775391
            ],
            [
              6.3443359,
              49.4527344
            ],
            [
              6.3484375,
              49.5126953
            ],
            [
              6.3783203,
              49.5996094
            ],
            [
              6.4067383,
              49.6449707
            ],
            [
              6.4446289,
              49.6820312
            ],
            [
              6.4847656,
              49.7078125
            ],
            [
              6.49375,
              49.7543945
            ],
            [
              6.4873047,
              49.7984863
            ],
            [
              6.440918,
              49.8053223
            ],
            [
              6.3246094,
              49.8378906
            ],
            [
              6.2560547,
              49.872168
            ],
            [
              6.2048828,
              49.9151367
            ],
            [
              6.1381836,
              49.9743164
            ],
            [
              6.1097656,
              50.034375
            ],
            [
              6.1083008,
              50.0942383
            ],
            [
              6.1165039,
              50.1209961
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for europe/luxembourg.50m.json
GeoJsonFeatureCollection get europeLuxembourg50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
