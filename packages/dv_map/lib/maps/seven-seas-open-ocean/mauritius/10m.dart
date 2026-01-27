// Generated from: assets/seven-seas-open-ocean/mauritius.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for seven-seas-open-ocean/mauritius.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE7WaW2sbVxDH3/UpFj21kIq5X/Ja6FugEPpUQhHpNggcychywQR/93I2iXHsnUDHxA/C0ko/Hc3lP2fm7KfNNG0vd9fz9vW0/W3eX27P86+nq6v5/eVwOm5fjcv/fH75Zvt6+nMzTdP0aXl8/sHl7cuF6/Ppej5fDsuHvr59mrbH/cflA2/2t+fD5XB78/CRadoebk5/7Wm5/Mez1/nz628fX3h/Ol4Ox/l4Gdfezv/Ox+lm3t9MP52u5+N0ej/vjz9vv7z9/mFtH+bTx/lyvvt2ZV9/ypvbq8vh99PV3YcvP//hu07nvw/H/eWRHT7/Pf7/6bPnz6dJfeepLsavnl37hWBHRK5oT669e/rmAoysGAUYCZ2wB3ZCsXUuJihpD2ukwlRwjUAwe2AlAs8CrEKU0gOLiFthYRQOpGiC3UtLICpIlysBVMQagoJrE8xsWq0Y0pCaFqZ0scJ1kIriTTB6SuU6SEv2piWQw70Gty0BEUyVhSOTs5nNYESBBdiDg3tgS3cTLcAmYEBNMGBaZQpxymYUWzCiVaZgdxfugT0JsgoKClLqSZuFBGm1YkQAaK/YcjUqMHeZmdxUeTN31jXnLWAB52ZUEEWKF+BAB+5lnoEjVFxPIfEWV9OUfC0/lgWTZvQKvyYoqFTgNO+CwxBhTY0X35lrNE0RwEwluB9tapZQ5gdAQlM11QAsKw0CDo6eBimTBBYlGkiCpScVSgFRVjyG0KbvCDO4WrCgZvYSWke15Kp+uAtYLygkv7dtA7aknmhKcpCuScUAEzFFT4IkwbmyMQoEYM954mzCa1KxbI1dQnpSIfadbRAaqnITLES8KscL2AWbvmMyKhfsGODNaEOQpMrEkUTN2i8QomVbk8SozWgDQPVCNAnA0Hqiye6yWvoHVxjSejHBvqypABso9hSITdO9cB0leDQtzKYAUAQbi442oQdWS5HCxOzArr30YPOQqt6xGyp3wZERhcpzmIB3ncceUASFoEh0V6zuWvhOyIWaTT+LQFRRLJRh0rQEJosVAxshBeuuGFjK/Bj5TM0JE4OHYyFtIkIWPTFmAjUvCqloYEgT7IHAhfMUHJCa2pZJVpoifXQgPZUnS8Yio/UFW+Pv7ikUFSx7iafAmtXWWNFZvLk1juDIQoPGsK1bSc2JEKuU9jSLdt/vwsUuSBwNqTtbIc7KeWKohN0xkwZV4SYczs2dpiOSc6VurAHNhsnRjapwEzZkaA66iRmrjZuwULeNdrLAUt1eIPROBiFVzcM0bI6ZnMCxjGNEsGbmOWaWbbQAZzQ3Qo5ECtVGKFxMmwlCORxfgI1TrJfSrg5ZdUwszM3G32M5iCi4rA7eNLFrlHLMBALd2bwHWlS+A/Ho5kdEIlSNggsGNzUoOVULqSDpT9w6p46b6tk3X/m/j0BtpyQYsDoJHZEEgND5lQtYY3WDOsACQNCRlwFOz9UmYICVUrPjcNuphOLqQdoABzX3kbZTq5oAHIJoCtHRrQEOQ1k9KXhJAzdMQYHVillMJDv113bKaro6FB5g4myvmBHQqjgmQW0Np0a4uXmuzscHWLm7YFK1Kj3ImVq1rJfQP0ZdjHfiRuKrcZQ7cw/KhroMsI52vzi1MMtQaajLABPi+mn6smIR7Ix7jXccib46dxrg0VM0uapUHuo5iIU2AnSAhclXb1hYwOncqQwDzEq4OqofYPSwTmFdwERRBNtojKlzCrlw3Xl1TraAl1FwD2zGIZWJzbHtu1jfuQysGnBniDySA8CkOt0cN7g0HSdoiqu3K7zQc0tzu9qKLGAG0EYdG2DLoQQFmCixc7vCAEdqcuU7QKHO7maAcxTX4q4CC4zsOq+h8XXB2Tz9737z9fHd5n7zHwUB7j4oKQAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for seven-seas-open-ocean/mauritius.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get sevenSeasOpenOceanMauritius10m {
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

/// Widget for rendering the seven-seas-open-ocean/mauritius.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// Mauritius10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class Mauritius10mWidget extends StatelessWidget {
  /// The projection to use for rendering.
  final Projection projection;

  /// The color to use for filling shapes.
  final Color? fillColor;

  /// The color to use for stroking shapes.
  final Color? strokeColor;

  /// The stroke width for shape outlines.
  final double strokeWidth;

  /// Optional callback when a feature is tapped.
  final void Function(GeoJsonFeature feature, Point position)? onFeatureTap;

  /// Whether to enable anti-aliasing.
  final bool antiAlias;

  /// Creates a Mauritius10mWidget.
  const Mauritius10mWidget({
    super.key,
    required this.projection,
    this.fillColor,
    this.strokeColor,
    this.strokeWidth = 1.0,
    this.onFeatureTap,
    this.antiAlias = true,
  });

  @override
  Widget build(BuildContext context) {
    return MapWidget(
      geoJson: sevenSeasOpenOceanMauritius10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
