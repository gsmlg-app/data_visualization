import 'package:flutter/material.dart';

import 'gallery_item.dart';
import '../examples/line_chart_example.dart';
import '../examples/bar_chart_example.dart';
import '../examples/area_chart_example.dart';
import '../examples/pie_chart_example.dart';
import '../examples/scatter_chart_example.dart';
import '../examples/heatmap_example.dart';
import '../examples/hierarchy_example.dart';
import '../examples/delaunay_voronoi_example.dart';
import '../examples/scales_example.dart';
import '../examples/curves_example.dart';
import '../examples/geo_map_example.dart';
import '../examples/interactive_example.dart';

/// Registry of all gallery items
class GalleryRegistry {
  static final List<GalleryItem> items = [
    // Lines & Curves
    GalleryItem(
      id: 'line-chart',
      title: 'Line Chart',
      description: 'Smooth line chart with multiple series and data points',
      category: ChartCategory.linesAndCurves,
      builder: () => const LineChartExample(),
      primaryColor: Colors.indigo,
      tags: ['line', 'series', 'time-series', 'trend'],
    ),
    GalleryItem(
      id: 'area-chart',
      title: 'Stacked Area',
      description: 'Stacked area chart showing cumulative values over time',
      category: ChartCategory.linesAndCurves,
      builder: () => const AreaChartExample(),
      primaryColor: Colors.teal,
      tags: ['area', 'stacked', 'cumulative', 'flow'],
    ),
    GalleryItem(
      id: 'curves',
      title: 'Curve Types',
      description: 'Interactive demo of curve interpolation algorithms',
      category: ChartCategory.linesAndCurves,
      builder: () => const CurvesExample(),
      primaryColor: Colors.purple,
      tags: ['curve', 'interpolation', 'smooth', 'spline'],
    ),

    // Bars
    GalleryItem(
      id: 'bar-chart',
      title: 'Grouped Bars',
      description: 'Grouped bar chart comparing categories',
      category: ChartCategory.bars,
      builder: () => const BarChartExample(),
      primaryColor: Colors.blue,
      tags: ['bar', 'grouped', 'comparison', 'categorical'],
    ),

    // Radial
    GalleryItem(
      id: 'pie-chart',
      title: 'Donut Chart',
      description: 'Donut/pie chart with percentage labels',
      category: ChartCategory.radial,
      builder: () => const PieChartExample(),
      primaryColor: Colors.orange,
      tags: ['pie', 'donut', 'proportion', 'percentage'],
    ),

    // Hierarchy
    GalleryItem(
      id: 'treemap',
      title: 'Treemap',
      description: 'Hierarchical treemap with nested rectangles',
      category: ChartCategory.hierarchy,
      builder: () => const HierarchyExample(),
      primaryColor: Colors.green,
      tags: ['treemap', 'hierarchy', 'nested', 'proportional'],
    ),

    // Scatter & Distribution
    GalleryItem(
      id: 'scatter-chart',
      title: 'Scatter Plot',
      description: 'Scatter plot with variable-sized bubbles',
      category: ChartCategory.scatterAndDistribution,
      builder: () => const ScatterChartExample(),
      primaryColor: Colors.pink,
      tags: ['scatter', 'bubble', 'correlation', 'distribution'],
    ),
    GalleryItem(
      id: 'heatmap',
      title: 'Heatmap',
      description: 'Color-coded matrix visualization',
      category: ChartCategory.scatterAndDistribution,
      builder: () => const HeatmapExample(),
      primaryColor: Colors.deepOrange,
      tags: ['heatmap', 'matrix', 'color', 'intensity'],
    ),

    // Network
    GalleryItem(
      id: 'voronoi',
      title: 'Voronoi Diagram',
      description: 'Delaunay triangulation and Voronoi tessellation',
      category: ChartCategory.network,
      builder: () => const DelaunayVoronoiExample(),
      primaryColor: Colors.cyan,
      tags: ['voronoi', 'delaunay', 'triangulation', 'tessellation'],
    ),

    // Geographic
    GalleryItem(
      id: 'geo-map',
      title: 'World Map',
      description: 'Geographic visualization with map projections',
      category: ChartCategory.geographic,
      builder: () => const GeoMapExample(),
      primaryColor: Colors.lightGreen,
      tags: ['map', 'geo', 'projection', 'world'],
    ),

    // Utilities
    GalleryItem(
      id: 'scales',
      title: 'Scales',
      description: 'Linear, logarithmic, power, and band scales',
      category: ChartCategory.utilities,
      builder: () => const ScalesExample(),
      primaryColor: Colors.blueGrey,
      tags: ['scale', 'axis', 'linear', 'logarithmic'],
    ),
    GalleryItem(
      id: 'interactive',
      title: 'Interactive',
      description: 'Hover interactions with tooltips',
      category: ChartCategory.utilities,
      builder: () => const InteractiveExample(),
      primaryColor: Colors.amber,
      tags: ['interactive', 'tooltip', 'hover', 'brush'],
    ),
  ];

  /// Get items by category
  static List<GalleryItem> getByCategory(ChartCategory category) {
    return items.where((item) => item.category == category).toList();
  }

  /// Get item by ID
  static GalleryItem? getById(String id) {
    try {
      return items.firstWhere((item) => item.id == id);
    } catch (_) {
      return null;
    }
  }

  /// Search items by query
  static List<GalleryItem> search(String query) {
    final lowerQuery = query.toLowerCase();
    return items.where((item) {
      return item.title.toLowerCase().contains(lowerQuery) ||
          item.description.toLowerCase().contains(lowerQuery) ||
          item.tags.any((tag) => tag.toLowerCase().contains(lowerQuery));
    }).toList();
  }

  /// Get all categories that have items
  static List<ChartCategory> get activeCategories {
    final categories = items.map((item) => item.category).toSet();
    return ChartCategory.values
        .where((cat) => categories.contains(cat))
        .toList();
  }
}
