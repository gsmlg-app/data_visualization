// Generated from: assets/europe/san-marino.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for europe/san-marino.10m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "San Marino",
        "iso_a2": "SM",
        "iso_a3": "SMR",
        "continent": "Europe"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              12.4294504,
              43.8920555
            ],
            [
              12.4604562,
              43.8952595
            ],
            [
              12.4782868,
              43.9170379
            ],
            [
              12.4774939,
              43.920051
            ],
            [
              12.4780262,
              43.9232164
            ],
            [
              12.4795765,
              43.9258002
            ],
            [
              12.4821603,
              43.927919
            ],
            [
              12.4830945,
              43.9292049
            ],
            [
              12.4903252,
              43.9391586
            ],
            [
              12.4923923,
              43.9564185
            ],
            [
              12.4891883,
              43.97311
            ],
            [
              12.4821603,
              43.9825668
            ],
            [
              12.4533249,
              43.9790528
            ],
            [
              12.4213888,
              43.9672189
            ],
            [
              12.4110487,
              43.959661
            ],
            [
              12.395654,
              43.9484087
            ],
            [
              12.3856287,
              43.9245342
            ],
            [
              12.3995814,
              43.9032176
            ],
            [
              12.4294504,
              43.8920555
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for europe/san-marino.10m.json
GeoJsonFeatureCollection get europeSanMarino10m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
