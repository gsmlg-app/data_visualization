import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import 'map_assets.dart';

/// An index entry for a country map asset.
class MapCountryEntry {
  MapCountryEntry({
    required this.name,
    required this.continent,
    required this.continentSlug,
    required this.countrySlug,
    required this.asset,
    this.isoA2,
    this.isoA3,
  });

  final String name;
  final String continent;
  final String continentSlug;
  final String countrySlug;
  final String asset;
  final String? isoA2;
  final String? isoA3;

  factory MapCountryEntry.fromJson(Map<String, dynamic> json) {
    return MapCountryEntry(
      name: json['name'] as String,
      continent: json['continent'] as String,
      continentSlug: json['continent_slug'] as String,
      countrySlug: json['country_slug'] as String,
      asset: json['asset'] as String,
      isoA2: json['iso_a2'] as String?,
      isoA3: json['iso_a3'] as String?,
    );
  }
}

/// Index of available country assets for a given scale.
class DvMapIndex {
  DvMapIndex({
    required this.scale,
    required this.countries,
  });

  final MapScale scale;
  final List<MapCountryEntry> countries;

  static final Map<MapScale, DvMapIndex> _cache = {};

  /// Loads the index for [scale] from assets (cached).
  static Future<DvMapIndex> load(MapScale scale) async {
    final cached = _cache[scale];
    if (cached != null) {
      return cached;
    }

    final content = await rootBundle.loadString(indexAssetPath(scale));
    final data = json.decode(content) as Map<String, dynamic>;
    final entries = (data['countries'] as List)
        .map((e) => MapCountryEntry.fromJson(e as Map<String, dynamic>))
        .toList();

    final index = DvMapIndex(scale: scale, countries: entries);
    _cache[scale] = index;
    return index;
  }

  /// Finds a country by ISO or name. ISO matches take priority over name.
  MapCountryEntry? find({
    String? name,
    String? isoA2,
    String? isoA3,
    String? continent,
  }) {
    final isoA3Norm = isoA3?.trim().toUpperCase();
    final isoA2Norm = isoA2?.trim().toUpperCase();
    final nameNorm = name?.trim().toLowerCase();
    final continentNorm = continent?.trim().toLowerCase();

    if (isoA3Norm != null && isoA3Norm.isNotEmpty) {
      for (final entry in countries) {
        if (!_continentMatches(entry, continentNorm)) continue;
        if ((entry.isoA3 ?? '').toUpperCase() == isoA3Norm) {
          return entry;
        }
      }
    }

    if (isoA2Norm != null && isoA2Norm.isNotEmpty) {
      for (final entry in countries) {
        if (!_continentMatches(entry, continentNorm)) continue;
        if ((entry.isoA2 ?? '').toUpperCase() == isoA2Norm) {
          return entry;
        }
      }
    }

    if (nameNorm != null && nameNorm.isNotEmpty) {
      for (final entry in countries) {
        if (!_continentMatches(entry, continentNorm)) continue;
        if (entry.name.toLowerCase() == nameNorm) {
          return entry;
        }
      }
    }

    return null;
  }

  bool _continentMatches(MapCountryEntry entry, String? continentNorm) {
    if (continentNorm == null || continentNorm.isEmpty) {
      return true;
    }
    return entry.continent.toLowerCase() == continentNorm ||
        entry.continentSlug.toLowerCase() == continentNorm;
  }
}
