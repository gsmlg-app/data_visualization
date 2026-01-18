import 'package:flutter/material.dart';

/// Represents a chart category in the gallery
enum ChartCategory {
  linesAndCurves('Lines & Curves', Icons.show_chart, 'Visualize trends, patterns, and continuous data over time or sequences.'),
  bars('Bars', Icons.bar_chart, 'Compare quantities across categories with rectangular bars.'),
  radial('Radial', Icons.pie_chart, 'Display data in circular layouts for proportions and cyclic patterns.'),
  hierarchy('Hierarchy', Icons.account_tree, 'Show parent-child relationships and nested data structures.'),
  scatterAndDistribution('Scatter & Distribution', Icons.scatter_plot, 'Reveal correlations, distributions, and statistical patterns.'),
  network('Network', Icons.hub, 'Visualize connections, flows, and relationships between entities.'),
  geographic('Geographic', Icons.public, 'Display location-based and geospatial data on maps.'),
  utilities('Utilities', Icons.build, 'Tools and techniques for enhancing chart interactivity and styling.');

  final String label;
  final IconData icon;
  final String description;

  const ChartCategory(this.label, this.icon, this.description);
}

/// Documentation for a chart example
class ChartDocumentation {
  /// Overview description of the chart
  final String overview;

  /// When to use this chart type
  final List<String> useCases;

  /// Key features of this chart
  final List<String> features;

  /// Data format requirements
  final String dataFormat;

  /// Code snippet showing basic usage
  final String codeSnippet;

  /// Related chart types
  final List<String> relatedCharts;

  const ChartDocumentation({
    required this.overview,
    required this.useCases,
    required this.features,
    required this.dataFormat,
    required this.codeSnippet,
    this.relatedCharts = const [],
  });
}

/// Represents a single gallery item (chart example)
class GalleryItem {
  final String id;
  final String title;
  final String description;
  final ChartCategory category;
  final Widget Function() builder;
  final Color primaryColor;
  final List<String> tags;
  final ChartDocumentation? documentation;

  const GalleryItem({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.builder,
    required this.primaryColor,
    this.tags = const [],
    this.documentation,
  });
}
