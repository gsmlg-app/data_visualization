// Generated from: assets/seven-seas-open-ocean/british-indian-ocean-territory.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for seven-seas-open-ocean/british-indian-ocean-territory.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "British Indian Ocean Territory",
        "iso_a2": "IO",
        "iso_a3": "IOT",
        "continent": "Seven seas (open ocean)"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              72.4919922,
              -7.3774414
            ],
            [
              72.4985352,
              -7.2948242
            ],
            [
              72.4935547,
              -7.2617188
            ],
            [
              72.4456055,
              -7.2204102
            ],
            [
              72.4357422,
              -7.2302734
            ],
            [
              72.4654297,
              -7.2782227
            ],
            [
              72.4737305,
              -7.309668
            ],
            [
              72.462207,
              -7.337793
            ],
            [
              72.4671875,
              -7.3675781
            ],
            [
              72.4472656,
              -7.3957031
            ],
            [
              72.4274414,
              -7.2998047
            ],
            [
              72.3728516,
              -7.2633789
            ],
            [
              72.349707,
              -7.2633789
            ],
            [
              72.4076172,
              -7.3344727
            ],
            [
              72.4291016,
              -7.4353516
            ],
            [
              72.46875,
              -7.4171875
            ],
            [
              72.4919922,
              -7.3774414
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for seven-seas-open-ocean/british-indian-ocean-territory.50m.json
GeoJsonFeatureCollection get sevenSeasOpenOceanBritishIndianOceanTerritory50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
