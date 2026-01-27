// Generated from: assets/seven-seas-open-ocean/french-southern-and-antarctic-lands.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for seven-seas-open-ocean/french-southern-and-antarctic-lands.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "French Southern and Antarctic Lands",
        "iso_a2": "TF",
        "iso_a3": "ATF",
        "continent": "Seven seas (open ocean)"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              68.935,
              -48.625
            ],
            [
              68.8675,
              -48.83
            ],
            [
              68.72,
              -49.2425
            ],
            [
              68.745,
              -49.775
            ],
            [
              70.28,
              -49.71
            ],
            [
              70.56,
              -49.255
            ],
            [
              70.525,
              -49.065
            ],
            [
              69.58,
              -48.94
            ],
            [
              68.935,
              -48.625
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for seven-seas-open-ocean/french-southern-and-antarctic-lands.110m.json
GeoJsonFeatureCollection get sevenSeasOpenOceanFrenchSouthernAndAntarcticLands110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
