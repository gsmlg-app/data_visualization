// Generated from: assets/seven-seas-open-ocean/seychelles.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for seven-seas-open-ocean/seychelles.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Seychelles",
        "iso_a2": "SC",
        "iso_a3": "SYC",
        "continent": "Seven seas (open ocean)"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              55.540332,
              -4.6930664
            ],
            [
              55.4557617,
              -4.5587891
            ],
            [
              55.3833984,
              -4.6092773
            ],
            [
              55.4167969,
              -4.650293
            ],
            [
              55.48125,
              -4.6948242
            ],
            [
              55.4947266,
              -4.7545898
            ],
            [
              55.5429688,
              -4.7855469
            ],
            [
              55.540332,
              -4.6930664
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for seven-seas-open-ocean/seychelles.50m.json
GeoJsonFeatureCollection get sevenSeasOpenOceanSeychelles50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
