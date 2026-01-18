import 'package:flutter/material.dart';

/// Represents a chart category in the gallery
enum ChartCategory {
  linesAndCurves('Lines & Curves', Icons.show_chart),
  bars('Bars', Icons.bar_chart),
  radial('Radial', Icons.pie_chart),
  hierarchy('Hierarchy', Icons.account_tree),
  scatterAndDistribution('Scatter & Distribution', Icons.scatter_plot),
  network('Network', Icons.hub),
  geographic('Geographic', Icons.public),
  utilities('Utilities', Icons.build);

  final String label;
  final IconData icon;

  const ChartCategory(this.label, this.icon);
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

  const GalleryItem({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.builder,
    required this.primaryColor,
    this.tags = const [],
  });
}
