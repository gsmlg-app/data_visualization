// Generated from: assets/north-america/saint-kitts-and-nevis.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for north-america/saint-kitts-and-nevis.10m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Saint Kitts and Nevis",
        "iso_a2": "KN",
        "iso_a3": "KNA",
        "continent": "North America"
      },
      "geometry": {
        "type": "MultiPolygon",
        "coordinates": [
          [
            [
              [
                -62.5992326,
                17.2029483
              ],
              [
                -62.6186417,
                17.1828067
              ],
              [
                -62.6263729,
                17.1406925
              ],
              [
                -62.612172,
                17.1041527
              ],
              [
                -62.5657446,
                17.1005313
              ],
              [
                -62.5475968,
                17.104641
              ],
              [
                -62.5435685,
                17.1088728
              ],
              [
                -62.5384415,
                17.1209984
              ],
              [
                -62.5367732,
                17.1297061
              ],
              [
                -62.5372615,
                17.1528995
              ],
              [
                -62.5384415,
                17.1619327
              ],
              [
                -62.5464982,
                17.1837833
              ],
              [
                -62.5603735,
                17.1967227
              ],
              [
                -62.5784399,
                17.2025414
              ],
              [
                -62.5992326,
                17.2029483
              ]
            ]
          ],
          [
            [
              [
                -62.6504614,
                17.2656111
              ],
              [
                -62.6668595,
                17.273505
              ],
              [
                -62.6781307,
                17.2922224
              ],
              [
                -62.6954646,
                17.333238
              ],
              [
                -62.7199601,
                17.3585473
              ],
              [
                -62.8195695,
                17.4158389
              ],
              [
                -62.8223364,
                17.4101016
              ],
              [
                -62.8266495,
                17.4071719
              ],
              [
                -62.8388566,
                17.4021671
              ],
              [
                -62.8435766,
                17.4010684
              ],
              [
                -62.846547,
                17.3999698
              ],
              [
                -62.8492326,
                17.3981387
              ],
              [
                -62.8531388,
                17.3947208
              ],
              [
                -62.8610734,
                17.3622908
              ],
              [
                -62.8316137,
                17.3301456
              ],
              [
                -62.7887264,
                17.3046736
              ],
              [
                -62.7569474,
                17.2923038
              ],
              [
                -62.7440486,
                17.2905948
              ],
              [
                -62.7125545,
                17.2923038
              ],
              [
                -62.7033585,
                17.28913
              ],
              [
                -62.690297,
                17.2749698
              ],
              [
                -62.6704809,
                17.2631697
              ],
              [
                -62.6597387,
                17.2254906
              ],
              [
                -62.6470434,
                17.2171898
              ],
              [
                -62.6247452,
                17.2252872
              ],
              [
                -62.6248266,
                17.241848
              ],
              [
                -62.6368302,
                17.2582055
              ],
              [
                -62.6504614,
                17.2656111
              ]
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for north-america/saint-kitts-and-nevis.10m.json
GeoJsonFeatureCollection get northAmericaSaintKittsAndNevis10m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
