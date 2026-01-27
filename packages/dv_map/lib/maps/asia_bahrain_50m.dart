// Generated from: assets/asia/bahrain.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for asia/bahrain.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Bahrain",
        "iso_a2": "BH",
        "iso_a3": "BHR",
        "continent": "Asia"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              50.6072266,
              25.8831055
            ],
            [
              50.6174805,
              26.0023437
            ],
            [
              50.6097656,
              26.1244629
            ],
            [
              50.5578125,
              26.198291
            ],
            [
              50.5859375,
              26.2407227
            ],
            [
              50.5640625,
              26.2464355
            ],
            [
              50.4699219,
              26.2289551
            ],
            [
              50.4524414,
              26.1908203
            ],
            [
              50.4894531,
              26.0584473
            ],
            [
              50.465918,
              25.9655273
            ],
            [
              50.544043,
              25.8334961
            ],
            [
              50.5749023,
              25.8067871
            ],
            [
              50.6072266,
              25.8831055
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for asia/bahrain.50m.json
GeoJsonFeatureCollection get asiaBahrain50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
