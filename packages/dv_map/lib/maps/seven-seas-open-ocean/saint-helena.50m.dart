// Generated from: assets/seven-seas-open-ocean/saint-helena.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for seven-seas-open-ocean/saint-helena.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Saint Helena",
        "iso_a2": "SH",
        "iso_a3": "SHN",
        "continent": "Seven seas (open ocean)"
      },
      "geometry": {
        "type": "MultiPolygon",
        "coordinates": [
          [
            [
              [
                -5.6921387,
                -15.9977539
              ],
              [
                -5.6597168,
                -15.9708984
              ],
              [
                -5.6625,
                -15.912793
              ],
              [
                -5.7078613,
                -15.9061523
              ],
              [
                -5.7750488,
                -15.9567383
              ],
              [
                -5.7825195,
                -16.0040039
              ],
              [
                -5.6921387,
                -15.9977539
              ]
            ]
          ],
          [
            [
              [
                -14.3643555,
                -7.9743164
              ],
              [
                -14.3167969,
                -7.9561523
              ],
              [
                -14.3025391,
                -7.9354492
              ],
              [
                -14.3288574,
                -7.9125977
              ],
              [
                -14.3604004,
                -7.8859375
              ],
              [
                -14.3836426,
                -7.8826172
              ],
              [
                -14.398584,
                -7.9057617
              ],
              [
                -14.4149414,
                -7.94375
              ],
              [
                -14.4086914,
                -7.9674805
              ],
              [
                -14.3986816,
                -7.9757813
              ],
              [
                -14.3643555,
                -7.9743164
              ]
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for seven-seas-open-ocean/saint-helena.50m.json
GeoJsonFeatureCollection get sevenSeasOpenOceanSaintHelena50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
