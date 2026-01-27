// Generated from: assets/north-america/bajo-nuevo-bank-petrel-is.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for north-america/bajo-nuevo-bank-petrel-is.10m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Bajo Nuevo Bank (Petrel Is.)",
        "iso_a2": "-99",
        "iso_a3": "-99",
        "continent": "North America"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              -79.9892879,
              15.7949486
            ],
            [
              -79.9881486,
              15.7941755
            ],
            [
              -79.9863989,
              15.7944197
            ],
            [
              -79.987823,
              15.79621
            ],
            [
              -79.9892879,
              15.7949486
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for north-america/bajo-nuevo-bank-petrel-is.10m.json
GeoJsonFeatureCollection get northAmericaBajoNuevoBankPetrelIs10m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
