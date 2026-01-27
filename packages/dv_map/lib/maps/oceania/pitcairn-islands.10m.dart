// Generated from: assets/oceania/pitcairn-islands.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for oceania/pitcairn-islands.10m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Pitcairn Islands",
        "iso_a2": "PN",
        "iso_a3": "PCN",
        "continent": "Oceania"
      },
      "geometry": {
        "type": "MultiPolygon",
        "coordinates": [
          [
            [
              [
                -130.1203507,
                -25.0682919
              ],
              [
                -130.1136775,
                -25.0738258
              ],
              [
                -130.1053361,
                -25.0767555
              ],
              [
                -130.0959367,
                -25.077081
              ],
              [
                -130.0862524,
                -25.0751279
              ],
              [
                -130.093007,
                -25.0679664
              ],
              [
                -130.101145,
                -25.0643857
              ],
              [
                -130.110463,
                -25.0643857
              ],
              [
                -130.1203507,
                -25.0682919
              ]
            ]
          ],
          [
            [
              [
                -124.7861629,
                -24.6645647
              ],
              [
                -124.7853898,
                -24.6644833
              ],
              [
                -124.7805883,
                -24.6665992
              ],
              [
                -124.778798,
                -24.6687151
              ],
              [
                -124.7780656,
                -24.67254
              ],
              [
                -124.7789201,
                -24.667413
              ],
              [
                -124.7805883,
                -24.6646461
              ],
              [
                -124.7855118,
                -24.663995
              ],
              [
                -124.7865291,
                -24.663995
              ],
              [
                -124.7971085,
                -24.6670875
              ],
              [
                -124.7861629,
                -24.6645647
              ]
            ]
          ],
          [
            [
              [
                -128.3301896,
                -24.3243141
              ],
              [
                -128.3502498,
                -24.3412411
              ],
              [
                -128.3421932,
                -24.3717587
              ],
              [
                -128.3206681,
                -24.4006487
              ],
              [
                -128.3001196,
                -24.4136695
              ],
              [
                -128.2901505,
                -24.39837
              ],
              [
                -128.2908423,
                -24.3656552
              ],
              [
                -128.3037003,
                -24.3346493
              ],
              [
                -128.3301896,
                -24.3243141
              ]
            ]
          ],
          [
            [
              [
                -130.7452693,
                -23.9244117
              ],
              [
                -130.7480363,
                -23.9273414
              ],
              [
                -130.7508439,
                -23.9271786
              ],
              [
                -130.7530818,
                -23.92962
              ],
              [
                -130.7508439,
                -23.9346656
              ],
              [
                -130.7469783,
                -23.9327939
              ],
              [
                -130.7420955,
                -23.9278297
              ],
              [
                -130.7413631,
                -23.9244117
              ],
              [
                -130.7452693,
                -23.9244117
              ]
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for oceania/pitcairn-islands.10m.json
GeoJsonFeatureCollection get oceaniaPitcairnIslands10m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
