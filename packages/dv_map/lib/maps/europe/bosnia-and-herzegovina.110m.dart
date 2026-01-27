// Generated from: assets/europe/bosnia-and-herzegovina.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for europe/bosnia-and-herzegovina.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Bosnia and Herzegovina",
        "iso_a2": "BA",
        "iso_a3": "BIH",
        "continent": "Europe"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              18.56,
              42.65
            ],
            [
              18.70648,
              43.20011
            ],
            [
              19.03165,
              43.43253
            ],
            [
              19.21852,
              43.52384
            ],
            [
              19.454,
              43.5681
            ],
            [
              19.59976,
              44.03847
            ],
            [
              19.11761,
              44.42307
            ],
            [
              19.36803,
              44.863
            ],
            [
              19.00548,
              44.86023
            ],
            [
              19.0054846,
              44.8602345
            ],
            [
              18.5532141,
              45.0815897
            ],
            [
              17.8617835,
              45.0677404
            ],
            [
              17.002146,
              45.2337768
            ],
            [
              16.5349394,
              45.2116076
            ],
            [
              16.3181568,
              45.0041267
            ],
            [
              15.9593673,
              45.2337768
            ],
            [
              15.7500261,
              44.8187117
            ],
            [
              16.2396603,
              44.3511433
            ],
            [
              16.4564429,
              44.0412397
            ],
            [
              16.9161564,
              43.6677225
            ],
            [
              17.2973735,
              43.4463406
            ],
            [
              17.6749215,
              43.0285625
            ],
            [
              18.56,
              42.65
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for europe/bosnia-and-herzegovina.110m.json
GeoJsonFeatureCollection get europeBosniaAndHerzegovina110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
