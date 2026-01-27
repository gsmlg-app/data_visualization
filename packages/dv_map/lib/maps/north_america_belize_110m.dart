// Generated from: assets/north-america/belize.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for north-america/belize.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Belize",
        "iso_a2": "BZ",
        "iso_a3": "BLZ",
        "continent": "North America"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              -89.1430804,
              17.808319
            ],
            [
              -89.150806,
              17.0155767
            ],
            [
              -89.2291217,
              15.8869376
            ],
            [
              -88.9306128,
              15.8872735
            ],
            [
              -88.7324336,
              16.2336348
            ],
            [
              -88.5518245,
              16.2654674
            ],
            [
              -88.3554282,
              16.5307742
            ],
            [
              -88.239518,
              17.0360664
            ],
            [
              -88.3026408,
              17.1316936
            ],
            [
              -88.1978668,
              17.4894754
            ],
            [
              -88.285355,
              17.644143
            ],
            [
              -88.1234786,
              18.0766747
            ],
            [
              -88.1068129,
              18.3486736
            ],
            [
              -88.2963362,
              18.3532728
            ],
            [
              -88.3000311,
              18.4999822
            ],
            [
              -88.4901229,
              18.4868306
            ],
            [
              -88.8483439,
              17.8831981
            ],
            [
              -89.0298573,
              18.0015113
            ],
            [
              -89.1509094,
              17.9554676
            ],
            [
              -89.1430804,
              17.808319
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for north-america/belize.110m.json
GeoJsonFeatureCollection get northAmericaBelize110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
