import 'dart:convert';

/// Available Natural Earth map scales.
enum MapScale {
  /// 1:110m scale.
  m110('110m'),

  /// 1:50m scale.
  m50('50m'),

  /// 1:10m scale.
  m10('10m');

  const MapScale(this.suffix);

  /// Scale suffix used in filenames.
  final String suffix;
}

/// Returns the asset path for a world map at [scale].
String worldAssetPath(MapScale scale) {
  return 'packages/dv_map/assets/world.${scale.suffix}.json';
}

/// Returns the asset path for a country map at [scale].
String countryAssetPath({
  required MapScale scale,
  required String continentSlug,
  required String countrySlug,
}) {
  return 'packages/dv_map/assets/$continentSlug/$countrySlug.${scale.suffix}.json';
}

/// Returns the asset path for the country index at [scale].
String indexAssetPath(MapScale scale) {
  return 'packages/dv_map/assets/index-${scale.suffix}.json';
}

/// Produces a safe slug for filenames (lowercase, ASCII, hyphen separated).
String slugify(String value) {
  var normalized = value;
  try {
    normalized = const Utf8Decoder(allowMalformed: true)
        .convert(utf8.encode(value));
  } catch (_) {
    normalized = value;
  }

  normalized = normalized
      .toLowerCase()
      .replaceAll(RegExp(r"[^a-z0-9]+"), '-')
      .replaceAll(RegExp(r"^-+|-+$"), '');

  return normalized.isEmpty ? 'unknown' : normalized;
}
