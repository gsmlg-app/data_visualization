// Generated from: assets/north-america/saint-pierre-and-miquelon.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for north-america/saint-pierre-and-miquelon.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Saint Pierre and Miquelon",
        "iso_a2": "PM",
        "iso_a3": "SPM",
        "continent": "North America"
      },
      "geometry": {
        "type": "MultiPolygon",
        "coordinates": [
          [
            [
              [
                -56.1507324,
                46.7624023
              ],
              [
                -56.1392578,
                46.7786621
              ],
              [
                -56.1373535,
                46.8015625
              ],
              [
                -56.1526367,
                46.811084
              ],
              [
                -56.1850586,
                46.8072754
              ],
              [
                -56.2091797,
                46.7982422
              ],
              [
                -56.2432617,
                46.7671875
              ],
              [
                -56.1716797,
                46.752832
              ],
              [
                -56.1507324,
                46.7624023
              ]
            ]
          ],
          [
            [
              [
                -56.2670898,
                46.8384766
              ],
              [
                -56.2554687,
                46.8609863
              ],
              [
                -56.2897949,
                46.8999023
              ],
              [
                -56.3148926,
                46.9538574
              ],
              [
                -56.2783691,
                47.0350098
              ],
              [
                -56.2873535,
                47.0709961
              ],
              [
                -56.3646484,
                47.0989746
              ],
              [
                -56.3779297,
                47.0895508
              ],
              [
                -56.3869141,
                47.0679687
              ],
              [
                -56.3339355,
                46.9356445
              ],
              [
                -56.3325684,
                46.9159668
              ],
              [
                -56.3772461,
                46.8476562
              ],
              [
                -56.3847656,
                46.8194336
              ],
              [
                -56.3541992,
                46.7953125
              ],
              [
                -56.2670898,
                46.8384766
              ]
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for north-america/saint-pierre-and-miquelon.50m.json
GeoJsonFeatureCollection get northAmericaSaintPierreAndMiquelon50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
