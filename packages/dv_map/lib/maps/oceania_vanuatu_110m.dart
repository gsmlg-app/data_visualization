// Generated from: assets/oceania/vanuatu.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for oceania/vanuatu.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Vanuatu",
        "iso_a2": "VU",
        "iso_a3": "VUT",
        "continent": "Oceania"
      },
      "geometry": {
        "type": "MultiPolygon",
        "coordinates": [
          [
            [
              [
                167.2168014,
                -15.8918462
              ],
              [
                167.1800078,
                -16.1599952
              ],
              [
                167.5151811,
                -16.5978496
              ],
              [
                167.8448767,
                -16.4663331
              ],
              [
                167.2168014,
                -15.8918462
              ]
            ]
          ],
          [
            [
              [
                166.793158,
                -15.6688107
              ],
              [
                167.0012073,
                -15.6146021
              ],
              [
                167.2700281,
                -15.7400208
              ],
              [
                167.1077124,
                -14.9339202
              ],
              [
                166.629137,
                -14.6264971
              ],
              [
                166.6498592,
                -15.3927035
              ],
              [
                166.793158,
                -15.6688107
              ]
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for oceania/vanuatu.110m.json
GeoJsonFeatureCollection get oceaniaVanuatu110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
