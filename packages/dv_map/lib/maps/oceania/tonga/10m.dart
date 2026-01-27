// Generated from: assets/oceania/tonga.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for oceania/tonga.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE7VcSW8c1xG+81cMeHYeal98DZBb4hxyC4yAUBiBgMwRaPogGPrvQfVYgiy9ooEakweCMz3zsbpe7Uv/enM63T5/eH9/+/3p9m/3d8+/PN3/9fzu3f2b54fz4+13dfl/l7d/vv3+9O+b0+l0+vX4/e0Xj48fF94/nd/fPz0/HF/69PHT6fbx7qfjC/86P769+/zx0+n24efzf+7ouPTDN+/z5f1/fHnhzfnx+eHx/vG5rv3w5v7u8eHu9rfLHz/T8fb+/NP989OH31Pxiey///Lu+eGf53cf3v52q5+xz0//fXi8e/7ini8/X/799atvX59Of0HnlWpsad9trsZSc0aVr679+PWHO2jL4OiQDd2mwBEInn8+zbIABDk7oh3SXafQCOnqHbRHSkyhScVQ9tAGkshTZGX14AYZE5xpCu0kmdRAM6fpmB+awt4ItRkr2Bz6JYYYY+CYIZJg2AjIlVSLIXesNmLzscKIomonemrBPFNzWcCAAo0umjHLmGhSI+n4oeyCOIYmplY+OEJizI+XDIhRSuRYPsBEEzuqhZ18DA2s2umiqIWMLSogWray5wI8tnvoBNir+TW6CJka2kCHI8xZzSDYnWKGAsz4wSsTVLLhh4Oi8zhMSNDGl1sExNB+VJigqe0ZOmTyjNO80sv+tOIB6j4zIBU1kaa2tnoueRXrOZF08qEMEGOGSKR1miiMhmNkdePeMhFkjpHDoI0SyJxoDk2p2EKDA4wPUQjCO1ajBo6RidJaz2Xpc8FDRYXO5JFF6Fg8UEi1oxoMea7kqJzSBeypjDAL9YrVntZmMGEWPBY9FnLpoD3JY+wEBMm5yxWdQnLMkEEaetO9+t0/HWTFUlLlsr1TwkVJaDE7n4IOgW0UV9Ahwj6NLJIM2XYB80G1GA79v6xkVqGd1SFcDKkwtJUFrWHYUM2oFnOGiCpsjUNBMyHZNBhPxeiR093GrHb0vbEsaPFEmUNb+NZ3FLSm6tBNF7QGZke1MwpN8+K0TINdCFDQcU2hID1tG4ofyCkYY6KDbZtxF3JCBE8zzJeR3XGsiCoJ0iiiYIDJmGYhgm2mVtAM5OOE+0XzIaISQ6dU9hTIvREPUcG0uRfgpG2d8aBaEIYR0R/4Lg6UufmAhG08dBgmkbRpQSYhtHUBlKw5ttMDT/5qgYUuMNV9ik64kDh1dqO6wJ2jMQtIqChj5ISAbM4diZx1JlG6ENihM8BIRjymGpHTuogFGTyHhlIXUgh0bhRFkIchti5kIWqkFdUjcVYs04UCSNZJngXHUMd0oUp6o73oGDDsmehCY/AuzEJLNpv5DV1FlmsnegYQMYsqdGEygrSnGMhD466LgNU6LTdUHVbLdFFRte0+XC0fRKyBHaudht06XcQCvs0aLzTbNPkv6CDKXRp9OUP2YbG9oJGxV3IAnxomQmPvwiwUBBlGygUdYe0ZMoDmVMmJlGDbfLj4RM9hj7FYzQid+Sg19amhJtlXrQ9gdqCpXSLJIOukA5Fs2B/QxWC675tfYgTzMTuqPoP9GSLrsCypi6l6dS1DfNhv1cXyUlwDZNMGoy5mAdWGHRBpyFNtYQwia6gGt+BhmbbkQ3uXCEdfYiwfTCjUUo1EOPUurFVsb4zelbw2CbRezVNsLHwKotsO0tWmmkldpfMCzppjB8NoTQX4gA6TOa+BPdr4o2LIHIcJkUat7wpN83GYYBKy7TEWdKbxPGpSZ2x5nYRKY2hIs07RCUV02J6q2Ne0zWCIjJnGuVHUhExXOa9K7zgEQQfWaBS9iLZh5bzyrnDt8lAyz2H/snJFD2jL/WYEw1GTynBNeTu0cUCTJ8zzcjeSTvZUU2WqjC+m/CQyHlYraE1sNYZZXceJKCYzd9BELHOGlKJ31SZCHLcZj2Pk6EJrggolpsoINbHYCV9lOApTqkExbDvGcqRekjYOU0EhsotwkJPncRmoGLdZP6PSsKQ7qkfedK+ub7uyIThvZxtyBWDFY6MblVVTm3sLf0BXT2U6hsbKyLGdU8wVyD4tYspiscxtJemADqRxc4M5WfZzArmCMOYjf0yAvh+iLqqTLMa8Rq0SaXeMIjpMYQuaPbdRIubyELfxNCGDhm7ziII2x9DxMUIG7KfsC7qaH1cco8u2pXtAg/nQMRV0zXQ0yFqLA2N+UJpBozHukjmM9UtjLGPbHz0ExN3HnTUWV9pP1uSqHvW0hD6zqa9m4svhJEVn0RwJYJzmQaDt894DGlnHbRlIMGkVuMZIYEx1mtl+9DqXE3jGFBoBmLExls4ZgnOqU3xbhSpoSbdxeRzCybZluUPNYDoreCAb72eNr7PwBW2S1joPpxg3qv6AH245Jtq7QtFhdYh0nPWCQzN5dUCrxjwabkPWK4PECrSzBs46qjl8XDl7EfpKqsVDoBVrxKBxKiZW6wqdo0bUucYoM++H0cvuccC4mjPxMa/m8i7RH27Tt8MMV+9s7NyBMNuQ5IqKhywKV9mP9NfRg04XM2SRV6upY4gk4nAPQaoeW+gdr01ouKdS0DWU1QqsUI7nVEkV0zsTj4Q+bCcWNGF0jtoyGcdDfaQuvN9Hy2UhZsNhpuJ1pm2nmQ6q7YrklDww9lsfxeujzTVWmcDcr2YcJs0pprye2JBXNGlkENrlK8agMtcFc++0zMjGHqdOvqY5G2NpIDRs5hWyJ1CDrKkxHRaRRcnAXRKuST4sxB/SKtLVOwxr2XSsCK6EXX5vrFdUDl408KYgMVdfSWrN2VVLwdV7aB5YkMvESGUseuK5L5ZfWJ043lSZKPmr2RxdxrXLtaNGV7WNphsoWluVVYRroM0Ax1Fu7b/z9uB1acwXUAq5FucafhgQw/Dgix8R+7VqXXbVKLFxYlNSLGihGM+3Gnrl2R0/6t+Okclwv5umS52Zx62ugUy/moZZjYDWBsiGHKLFxAk+M1MFHaT7PlNBS8SwTF3Qydvs90DOkKEbK2SNbIlmRR4+wqagAXPfBS/o8MwxP8CBthXwPwG6W3orZEMcujFbmIGwXx8raEzjWQRVRAvtJ3RKPiynO14zfXk19ZUjRukeXRTo4uPsw6Qe89Js51bVPcbbn8ZAHM06e0DC1NnIsVhO2+OpZ1akjx8SZcyhHac9lHnODkmDfaMhllfhVMbQhiTSPcIjLHzcSzYTbB+HcV3ffiDUvYrdfP3Xx5tPv3+8+Xjzf11pdXRwTgAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for oceania/tonga.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get oceaniaTonga10m {
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

/// Widget for rendering the oceania/tonga.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// OceaniaTonga10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class OceaniaTonga10mWidget extends StatelessWidget {
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

  /// Creates a OceaniaTonga10mWidget.
  const OceaniaTonga10mWidget({
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
      geoJson: oceaniaTonga10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
