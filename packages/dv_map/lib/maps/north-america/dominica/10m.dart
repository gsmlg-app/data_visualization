// Generated from: assets/north-america/dominica.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for north-america/dominica.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE61Yy2ocVxDd6yuaWSumHqde3pmE7BKyDyYIZ+IMSDNiPFkIo38PI1lCtkuEajKLpufevod6nHrc+nyxLJvT3e1283bZ/Ly9Ov1z3P54uL7efjjtDvvN5Xn7r8flT5u3y+8Xy7Isnx+e3x98+Pxh4/Z4uN0eT7uHQ0+fL8tmf3XzcOCnw81uv/tw9XxiWTa7T4c/ruRh95fv1vVx/d3LjQ+H/Wm33+5P571fD8fT38u7m+3xDPvlo/tngT5uDzfb0/Hua3Ge5P/tcH338Yu6z+CH45+7/dXphd6Pv5fv3/5blh+c36hLusblN1tsb4Q4qb5af3/533hGocktnjHMx4BwTUgHyOzlMQe0Um81ZlHECkDxZLSA5cFzG0qGoJVQzELmeGoV2eFpWkmOATk5vcODakHneJxRLR5Mdc4ZUg20CkMsyaaAUiok2mucKWMJJUvqFQtazTkoCbC2UQIkJ8aAEcLcxrGRKI1JKObu0qqcprAxCcU0VDrWqMBLeQ4IsuziWFXcV9jQzKR1ijrMaw6IEuvyAohplYAQ4U5AkNSK7C+WGmwtoCvHPPBcSrKLZFAUYYXKTtxLqFZaK2gYHtVKGOLE89TgwU5doBhFVK4ATBfrVDaqYsydkqC2PJmyVs5NmOXS+sRA5fNArjJUlxnMgsvHpFGyrGhdEgKzsYRK4S2rLUqM5gLaORW2GldK6RzQK0BdLrSyUp2X+IT32doy1ccc1Iqz7VsB3WXuErCGeAfoXBbzpgZyNlQLKIm0sU+gZ7J12dpVXOcVFCihtld3Vco5a+BZqV0gu2ra3MtIcqGe10w0z9bIzFbjlYGHZK4+WUea5biRgxc5Wo0Dkj7uu+DCeC13VWIeKB4SaLO1S8W8JCO1Kjtem7ElzyV81ckwCpr7JLOE+4JnwXOXnMNfejxSzNsuRKlV6xIxWM4tGCZUrQk5wmPcgyAg0bbCKEXY3Cch1LIayVorfOxmbi1gOINXABJpSxqEZK7IhYbzlacDdKSsyIWoiHYsAINbzCseIt26igcYrypQENLu2g311LkJhYV7PEaA5hpzUlJ/gbKyFamBzaONZM1wrOD1q22NJpnTfLZSZe7tpdZ4TaBoGVG293hVCpu3mqXSj6eUUmpFq0mlbXMt5VI8b64jzzOPdhQihJoPDEOipB3WBHnNI/k8Wcm2/Rd3CP5PCTWE5qMQDWfJV6a4uWJkGKDqx8yEFJpf8UaD9Yvu/ent/uLp+f7i/uJfZpqFbwcZAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/dominica.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaDominica10m {
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
