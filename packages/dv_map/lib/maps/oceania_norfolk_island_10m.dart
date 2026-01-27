// Generated from: assets/oceania/norfolk-island.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for oceania/norfolk-island.10m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Norfolk Island",
        "iso_a2": "NF",
        "iso_a3": "NFK",
        "continent": "Oceania"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              167.9841415,
              -29.0178362
            ],
            [
              167.9658309,
              -29.0118141
            ],
            [
              167.9455673,
              -29.0012346
            ],
            [
              167.9265243,
              -28.9974911
            ],
            [
              167.91212,
              -29.0116513
            ],
            [
              167.9245712,
              -29.0087216
            ],
            [
              167.9305119,
              -29.0121396
            ],
            [
              167.9299423,
              -29.0194638
            ],
            [
              167.9223739,
              -29.0287411
            ],
            [
              167.9183049,
              -29.0363909
            ],
            [
              167.9201766,
              -29.0455055
            ],
            [
              167.924327,
              -29.0555966
            ],
            [
              167.9264429,
              -29.0663388
            ],
            [
              167.9326278,
              -29.0663388
            ],
            [
              167.9397079,
              -29.0557594
            ],
            [
              167.9504501,
              -29.0565732
            ],
            [
              167.960704,
              -29.0656064
            ],
            [
              167.9666447,
              -29.0800107
            ],
            [
              167.966482,
              -29.0757789
            ],
            [
              167.9679468,
              -29.0720354
            ],
            [
              167.9700627,
              -29.068943
            ],
            [
              167.9734807,
              -29.0663388
            ],
            [
              167.9850367,
              -29.0592587
            ],
            [
              167.9946395,
              -29.0425758
            ],
            [
              167.9963485,
              -29.0256487
            ],
            [
              167.9841415,
              -29.0178362
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for oceania/norfolk-island.10m.json
GeoJsonFeatureCollection get oceaniaNorfolkIsland10m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
