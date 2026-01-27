import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:dv_geo_core/dv_geo_core.dart';

import 'map_assets.dart';
import 'map_index.dart';

/// Loads GeoJSON map assets bundled with dv_map.
class DvMapLoader {
  /// Loads a world FeatureCollection for [scale].
  static Future<GeoJsonFeatureCollection> loadWorld(MapScale scale) async {
    final content = await rootBundle.loadString(worldAssetPath(scale));
    return _parseCollection(content);
  }

  /// Loads a country FeatureCollection by explicit slugs.
  static Future<GeoJsonFeatureCollection> loadCountryBySlug({
    required MapScale scale,
    required String continentSlug,
    required String countrySlug,
  }) async {
    final path = countryAssetPath(
      scale: scale,
      continentSlug: continentSlug,
      countrySlug: countrySlug,
    );
    final content = await rootBundle.loadString(path);
    return _parseCollection(content);
  }

  /// Loads a country FeatureCollection using ISO codes or name.
  static Future<GeoJsonFeatureCollection> loadCountry({
    required MapScale scale,
    String? name,
    String? isoA2,
    String? isoA3,
    String? continent,
  }) async {
    final index = await DvMapIndex.load(scale);
    final entry = index.find(
      name: name,
      isoA2: isoA2,
      isoA3: isoA3,
      continent: continent,
    );

    if (entry == null) {
      throw StateError(
        'Country not found for scale ${scale.suffix}: '
        'name=$name isoA2=$isoA2 isoA3=$isoA3 continent=$continent',
      );
    }

    final content = await rootBundle.loadString('packages/dv_map/${entry.asset}');
    return _parseCollection(content);
  }

  static GeoJsonFeatureCollection _parseCollection(String content) {
    final data = json.decode(content);
    final parsed = parseGeoJson(data as Map<String, dynamic>);
    if (parsed is GeoJsonFeatureCollection) {
      return parsed;
    }
    throw StateError('GeoJSON asset is not a FeatureCollection');
  }
}
