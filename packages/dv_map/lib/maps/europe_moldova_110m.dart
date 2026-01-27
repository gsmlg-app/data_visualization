// Generated from: assets/europe/moldova.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for europe/moldova.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Moldova",
        "iso_a2": "MD",
        "iso_a3": "MDA",
        "continent": "Europe"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              26.6193368,
              48.2207262
            ],
            [
              26.9241761,
              48.1232645
            ],
            [
              27.2338729,
              47.8267709
            ],
            [
              27.5511662,
              47.4051171
            ],
            [
              28.1280302,
              46.8104764
            ],
            [
              28.1600179,
              46.3715626
            ],
            [
              28.054443,
              45.9445861
            ],
            [
              28.2335535,
              45.4882832
            ],
            [
              28.4852694,
              45.5969071
            ],
            [
              28.6599874,
              45.9399869
            ],
            [
              28.9337175,
              46.2588305
            ],
            [
              28.8629724,
              46.4378893
            ],
            [
              29.072107,
              46.5176777
            ],
            [
              29.1706539,
              46.3792624
            ],
            [
              29.759972,
              46.3499877
            ],
            [
              30.0246586,
              46.4239367
            ],
            [
              29.8382101,
              46.5253258
            ],
            [
              29.9088518,
              46.6743607
            ],
            [
              29.5596741,
              46.9285829
            ],
            [
              29.4151351,
              47.3466452
            ],
            [
              29.050868,
              47.510227
            ],
            [
              29.1226982,
              47.8490952
            ],
            [
              28.6708911,
              48.1181485
            ],
            [
              28.2595467,
              48.1555622
            ],
            [
              27.5225375,
              48.4671195
            ],
            [
              26.8578235,
              48.3682108
            ],
            [
              26.6193368,
              48.2207262
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for europe/moldova.110m.json
GeoJsonFeatureCollection get europeMoldova110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
