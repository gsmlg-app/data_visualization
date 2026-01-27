// Generated from: assets/north-america/cayman-islands.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for north-america/cayman-islands.50m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE7WWTWvcQAyG7/srBp9TI2lm9JFbCRRKSek1lFBM4qaGXTvsOocl5L8XOx8ku55D1MYH47FmHms00ivfr0Koxv1tW52G6kvbjHfb9mxYr9ursRv66mQy/358vatOw89VCCHcz/fjhfP02XC7HW7b7djNi56nh1D1zWZecNbsN00fvu7WTX+9e1kXQtXthl8NTXO+XRy9j/Pai/PXhquhH7u+7cfJ9n3Yjn/C50277a6a6mnSw4tbN+2wacft/q1Tz7s4v1uP3Y9hvb952vnLF4btddc346sQPF6vnw9Hx+MQPinWkS1HpJMjI1odk6rIgeXycGqBawiYeZmryZDQB05oYKjLYEmSsznBkETzciRINKE6IwFREKzARZXs45IIWSpxJRqxE0yJwdJyhCEhoBOMIEi67HGEjJKdIcYIiVUKScwiEp2h0KSY8jKYKSd1ekzGSVMhxgljluTMtiiUcyHGU74QOcHvFopVafTmi+8WLbHaxADi8iYFlCB6xGUGZzBZTiQBMwaPuExgQ025AEYjFZccQg3IVFIXQSVGl4BDDSxZFP9zKCawRk603BkEGCG6BBFqBDAqHB5P/kZXsUKNyIgxLoOVmF16CDVSVinoIbPGbC4RgBosodqybDFn87UyqIFACh1SYHbYWR2qwgV/BShHc9fzu4Xi41RLKUYtdClBNEzOXUoiKv25SIYpxz4CPDdzJ5h5anHLYM5C5FGtCawZMxc85szk0Zbp7CAiFRI0K0L2cikR6vLfrKQEvlKdMh+YoNCu/6mkVABYl4+OjVnMeXSO8ijX6urw6WH1fL9cPaz+Ajy0qx5oDgAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/cayman-islands.50m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaCaymanIslands50m {
  if (_cached != null) return _cached!;

  // Decode base64 and decompress
  final compressed = base64Decode(_kCompressedData);
  final decompressed = gzip.decode(compressed);
  final jsonString = utf8.decode(decompressed);

  // Parse GeoJSON
  final data = parseGeoJson(
    jsonDecode(jsonString) as Map<String, dynamic>,
  );

  if (data is! GeoJsonFeatureCollection) {
    throw StateError('Invalid GeoJSON format');
  }

  _cached = data;
  return _cached!;
}
