// Generated from: assets/oceania/nauru.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for oceania/nauru.10m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Nauru",
        "iso_a2": "NR",
        "iso_a3": "NRU",
        "continent": "Oceania"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              166.9388127,
              -0.4904111
            ],
            [
              166.9134221,
              -0.5001767
            ],
            [
              166.906993,
              -0.5248349
            ],
            [
              166.9163518,
              -0.54754
            ],
            [
              166.9388127,
              -0.5518531
            ],
            [
              166.9513452,
              -0.5391578
            ],
            [
              166.9582626,
              -0.5176734
            ],
            [
              166.955577,
              -0.4979794
            ],
            [
              166.9388127,
              -0.4904111
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for oceania/nauru.10m.json
GeoJsonFeatureCollection get oceaniaNauru10m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
