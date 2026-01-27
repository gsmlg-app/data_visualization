// Generated from: assets/north-america/barbados.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for north-america/barbados.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Barbados",
        "iso_a2": "BB",
        "iso_a3": "BRB",
        "continent": "North America"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              -59.4933105,
              13.0819824
            ],
            [
              -59.4276367,
              13.1527832
            ],
            [
              -59.4878906,
              13.1968262
            ],
            [
              -59.5916016,
              13.3176758
            ],
            [
              -59.6466797,
              13.303125
            ],
            [
              -59.6427734,
              13.150293
            ],
            [
              -59.6113281,
              13.1020996
            ],
            [
              -59.521875,
              13.062207
            ],
            [
              -59.4933105,
              13.0819824
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for north-america/barbados.50m.json
GeoJsonFeatureCollection get northAmericaBarbados50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
