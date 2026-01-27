// Generated from: assets/asia/hong-kong-s-a-r.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for asia/hong-kong-s-a-r.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Hong Kong S.A.R.",
        "iso_a2": "HK",
        "iso_a3": "HKG",
        "continent": "Asia"
      },
      "geometry": {
        "type": "MultiPolygon",
        "coordinates": [
          [
            [
              [
                114.0154297,
                22.5119141
              ],
              [
                114.0067383,
                22.4840332
              ],
              [
                113.8964844,
                22.4281738
              ],
              [
                113.9025391,
                22.3960937
              ],
              [
                113.9373047,
                22.3649902
              ],
              [
                114.0328125,
                22.3758789
              ],
              [
                114.1390625,
                22.3484375
              ],
              [
                114.2679688,
                22.2955566
              ],
              [
                114.2878906,
                22.325293
              ],
              [
                114.2905273,
                22.3737793
              ],
              [
                114.3352539,
                22.3962402
              ],
              [
                114.3251953,
                22.4374023
              ],
              [
                114.2845703,
                22.4576172
              ],
              [
                114.2911133,
                22.4994629
              ],
              [
                114.2696289,
                22.5367676
              ],
              [
                114.2660156,
                22.5409668
              ],
              [
                114.2282227,
                22.5539551
              ],
              [
                114.1881836,
                22.5649902
              ],
              [
                114.1228516,
                22.5649902
              ],
              [
                114.0978516,
                22.5512695
              ],
              [
                114.0503906,
                22.5429688
              ],
              [
                114.0182617,
                22.5144531
              ],
              [
                114.0154297,
                22.5119141
              ]
            ]
          ],
          [
            [
              [
                114.2320313,
                22.2105469
              ],
              [
                114.2435547,
                22.2335449
              ],
              [
                114.246875,
                22.2635742
              ],
              [
                114.1874023,
                22.2966309
              ],
              [
                114.1344727,
                22.2922363
              ],
              [
                114.1387695,
                22.2683594
              ],
              [
                114.2072266,
                22.195166
              ],
              [
                114.2320313,
                22.2105469
              ]
            ]
          ],
          [
            [
              [
                113.9977539,
                22.210498
              ],
              [
                114.0033203,
                22.2775391
              ],
              [
                114.0439453,
                22.3333984
              ],
              [
                113.881543,
                22.2802734
              ],
              [
                113.8388672,
                22.2416992
              ],
              [
                113.8515625,
                22.220459
              ],
              [
                113.8773438,
                22.2104492
              ],
              [
                113.9977539,
                22.210498
              ]
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for asia/hong-kong-s-a-r.50m.json
GeoJsonFeatureCollection get asiaHongKongSAR50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
