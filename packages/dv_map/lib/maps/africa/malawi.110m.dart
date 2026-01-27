// Generated from: assets/africa/malawi.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for africa/malawi.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Malawi",
        "iso_a2": "MW",
        "iso_a3": "MWI",
        "continent": "Africa"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              32.7593754,
              -9.2305991
            ],
            [
              33.231388,
              -9.6767217
            ],
            [
              33.4856877,
              -10.5255588
            ],
            [
              33.3153105,
              -10.79655
            ],
            [
              33.1142892,
              -11.6071982
            ],
            [
              33.3064222,
              -12.4357781
            ],
            [
              32.9917644,
              -12.7838705
            ],
            [
              32.6881653,
              -13.7128578
            ],
            [
              33.2140247,
              -13.97186
            ],
            [
              33.7897001,
              -14.4518307
            ],
            [
              34.0648255,
              -14.35995
            ],
            [
              34.4596334,
              -14.6130095
            ],
            [
              34.517666,
              -15.0137086
            ],
            [
              34.3072913,
              -15.4786415
            ],
            [
              34.3812919,
              -16.1835597
            ],
            [
              35.0338103,
              -16.8012997
            ],
            [
              35.3390629,
              -16.1074403
            ],
            [
              35.7719047,
              -15.8968588
            ],
            [
              35.6868453,
              -14.6110458
            ],
            [
              35.2679562,
              -13.8878342
            ],
            [
              34.9071513,
              -13.5654249
            ],
            [
              34.559989,
              -13.5799977
            ],
            [
              34.2800061,
              -12.2800253
            ],
            [
              34.559989,
              -11.52002
            ],
            [
              34.28,
              -10.16
            ],
            [
              33.9408377,
              -9.6936738
            ],
            [
              33.73972,
              -9.41715
            ],
            [
              32.7593754,
              -9.2305991
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for africa/malawi.110m.json
GeoJsonFeatureCollection get africaMalawi110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
