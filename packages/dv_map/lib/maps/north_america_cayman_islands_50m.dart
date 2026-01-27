// Generated from: assets/north-america/cayman-islands.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for north-america/cayman-islands.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Cayman Islands",
        "iso_a2": "KY",
        "iso_a3": "CYM",
        "continent": "North America"
      },
      "geometry": {
        "type": "MultiPolygon",
        "coordinates": [
          [
            [
              [
                -81.3695312,
                19.348877
              ],
              [
                -81.3910156,
                19.3849121
              ],
              [
                -81.4190918,
                19.3747559
              ],
              [
                -81.4047852,
                19.278418
              ],
              [
                -81.3037109,
                19.271875
              ],
              [
                -81.2772949,
                19.2773926
              ],
              [
                -81.2246094,
                19.3041016
              ],
              [
                -81.1071289,
                19.3051758
              ],
              [
                -81.1304687,
                19.3467773
              ],
              [
                -81.2848145,
                19.3625488
              ],
              [
                -81.2964844,
                19.3413574
              ],
              [
                -81.3372559,
                19.3294922
              ],
              [
                -81.3695312,
                19.348877
              ]
            ]
          ],
          [
            [
              [
                -79.9790039,
                19.7082031
              ],
              [
                -79.9750977,
                19.7099609
              ],
              [
                -79.9918457,
                19.7192871
              ],
              [
                -80.0162109,
                19.7182617
              ],
              [
                -80.0675781,
                19.7099609
              ],
              [
                -80.0836426,
                19.7061035
              ],
              [
                -80.1009277,
                19.6960938
              ],
              [
                -80.1161133,
                19.682666
              ],
              [
                -80.1258789,
                19.6683594
              ],
              [
                -80.0941895,
                19.665918
              ],
              [
                -80.020752,
                19.7068359
              ],
              [
                -79.9887695,
                19.7025391
              ],
              [
                -79.9790039,
                19.7082031
              ]
            ]
          ],
          [
            [
              [
                -79.8233887,
                19.7119141
              ],
              [
                -79.7422852,
                19.7508789
              ],
              [
                -79.7422852,
                19.7571289
              ],
              [
                -79.7663574,
                19.7657227
              ],
              [
                -79.7851562,
                19.765625
              ],
              [
                -79.803125,
                19.7581055
              ],
              [
                -79.8242188,
                19.7440918
              ],
              [
                -79.9062012,
                19.7025391
              ],
              [
                -79.8700684,
                19.6966797
              ],
              [
                -79.8233887,
                19.7119141
              ]
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for north-america/cayman-islands.50m.json
GeoJsonFeatureCollection get northAmericaCaymanIslands50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
