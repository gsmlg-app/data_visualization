// Generated from: assets/south-america/southern-patagonian-ice-field.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for south-america/southern-patagonian-ice-field.10m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Southern Patagonian Ice Field",
        "iso_a2": "-99",
        "iso_a3": "-99",
        "continent": "South America"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              -73.4650976,
              -49.759959
            ],
            [
              -73.1967496,
              -49.6824232
            ],
            [
              -73.1335166,
              -49.6210146
            ],
            [
              -73.0597447,
              -49.5549708
            ],
            [
              -73.0574235,
              -49.4759199
            ],
            [
              -73.0843353,
              -49.422615
            ],
            [
              -73.1186515,
              -49.3924271
            ],
            [
              -73.1089259,
              -49.3105181
            ],
            [
              -73.0982466,
              -49.2727536
            ],
            [
              -73.1306477,
              -49.2787481
            ],
            [
              -73.1412931,
              -49.2855694
            ],
            [
              -73.1450138,
              -49.3036561
            ],
            [
              -73.4578629,
              -49.3076869
            ],
            [
              -73.4711179,
              -49.3171953
            ],
            [
              -73.470472,
              -49.3422067
            ],
            [
              -73.4620487,
              -49.3749696
            ],
            [
              -73.4667254,
              -49.3875786
            ],
            [
              -73.4838045,
              -49.4007044
            ],
            [
              -73.5222776,
              -49.4167241
            ],
            [
              -73.5404419,
              -49.4277829
            ],
            [
              -73.5511389,
              -49.4440093
            ],
            [
              -73.5507255,
              -49.4632329
            ],
            [
              -73.5443434,
              -49.477599
            ],
            [
              -73.5425864,
              -49.4910349
            ],
            [
              -73.5559448,
              -49.5080881
            ],
            [
              -73.5865889,
              -49.5299989
            ],
            [
              -73.5880358,
              -49.5405409
            ],
            [
              -73.575556,
              -49.5592477
            ],
            [
              -73.5621976,
              -49.5717534
            ],
            [
              -73.5329488,
              -49.5939743
            ],
            [
              -73.5211149,
              -49.6089605
            ],
            [
              -73.5181951,
              -49.6284942
            ],
            [
              -73.5280912,
              -49.6444105
            ],
            [
              -73.5407261,
              -49.6595
            ],
            [
              -73.5463846,
              -49.6767599
            ],
            [
              -73.5395117,
              -49.6926763
            ],
            [
              -73.5247839,
              -49.7060088
            ],
            [
              -73.4962651,
              -49.725342
            ],
            [
              -73.4926153,
              -49.7278163
            ],
            [
              -73.4650976,
              -49.759959
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for south-america/southern-patagonian-ice-field.10m.json
GeoJsonFeatureCollection get southAmericaSouthernPatagonianIceField10m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
