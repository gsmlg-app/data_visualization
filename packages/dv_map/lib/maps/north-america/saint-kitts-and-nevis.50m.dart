// Generated from: assets/north-america/saint-kitts-and-nevis.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for north-america/saint-kitts-and-nevis.50m.json
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
                -62.5322266,
                17.121875
              ],
              [
                -62.5341797,
                17.1701172
              ],
              [
                -62.574707,
                17.2010254
              ],
              [
                -62.6152832,
                17.1991211
              ],
              [
                -62.6249023,
                17.1295898
              ],
              [
                -62.5824219,
                17.1005859
              ],
              [
                -62.5322266,
                17.121875
              ]
            ]
          ],
          [
            [
              [
                -62.6306641,
                17.2399902
              ],
              [
                -62.6405273,
                17.2623047
              ],
              [
                -62.6757812,
                17.290918
              ],
              [
                -62.7137207,
                17.3532715
              ],
              [
                -62.7946289,
                17.4025879
              ],
              [
                -62.8270508,
                17.3864258
              ],
              [
                -62.8394043,
                17.365332
              ],
              [
                -62.8404785,
                17.3470703
              ],
              [
                -62.838916,
                17.3392578
              ],
              [
                -62.7755371,
                17.302832
              ],
              [
                -62.702002,
                17.2860352
              ],
              [
                -62.6564941,
                17.2244141
              ],
              [
                -62.6306641,
                17.2399902
              ]
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for north-america/saint-kitts-and-nevis.50m.json
GeoJsonFeatureCollection get northAmericaSaintKittsAndNevis50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
