import 'package:flutter/material.dart';

import 'gallery_item.dart';
import '../examples/line_chart_example.dart';
import '../examples/bar_chart_example.dart';
import '../examples/bar_chart_horizontal_example.dart';
import '../examples/bar_chart_stacked_example.dart';
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
import '../examples/streamgraph_example.dart';
import '../examples/radar_chart_example.dart';
import '../examples/box_plot_example.dart';
import '../examples/radial_bar_example.dart';
import '../examples/network_graph_example.dart';
import '../examples/chord_diagram_example.dart';
import '../examples/sankey_diagram_example.dart';
import '../examples/tree_example.dart';
import '../examples/pack_example.dart';
import '../examples/wordcloud_example.dart';
import '../examples/brush_example.dart';
import '../examples/zoom_example.dart';
import '../examples/annotations_example.dart';
import '../examples/legends_example.dart';
import '../examples/gradients_example.dart';
import '../examples/threshold_example.dart';

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
    GalleryItem(
      id: 'streamgraph',
      title: 'Streamgraph',
      description: 'Stacked area streamgraph showing flow over time',
      category: ChartCategory.linesAndCurves,
      builder: () => const StreamgraphExample(),
      primaryColor: Colors.deepPurple,
      tags: ['stream', 'stacked', 'area', 'flow', 'time'],
    ),
    GalleryItem(
      id: 'threshold',
      title: 'Threshold',
      description: 'Area difference chart comparing actual vs expected',
      category: ChartCategory.linesAndCurves,
      builder: () => const ThresholdExample(),
      primaryColor: Colors.green,
      tags: ['threshold', 'difference', 'area', 'comparison'],
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
    GalleryItem(
      id: 'bar-horizontal',
      title: 'Horizontal Bars',
      description: 'Horizontal grouped and stacked bar charts',
      category: ChartCategory.bars,
      builder: () => const BarChartHorizontalExample(),
      primaryColor: Colors.lightBlue,
      tags: ['bar', 'horizontal', 'grouped', 'stacked'],
    ),
    GalleryItem(
      id: 'bar-stacked',
      title: 'Stacked Bars',
      description: 'Vertical stacked bar chart with categories',
      category: ChartCategory.bars,
      builder: () => const BarChartStackedExample(),
      primaryColor: Colors.indigo,
      tags: ['bar', 'stacked', 'vertical', 'cumulative'],
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
    GalleryItem(
      id: 'radar-chart',
      title: 'Radar Chart',
      description: 'Spider/radar chart comparing multiple dimensions',
      category: ChartCategory.radial,
      builder: () => const RadarChartExample(),
      primaryColor: Colors.deepOrange,
      tags: ['radar', 'spider', 'polar', 'comparison'],
    ),
    GalleryItem(
      id: 'radial-bar',
      title: 'Radial Bar',
      description: 'Circular bar chart showing weekly activity',
      category: ChartCategory.radial,
      builder: () => const RadialBarExample(),
      primaryColor: Colors.amber,
      tags: ['radial', 'bar', 'circular', 'activity'],
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
    GalleryItem(
      id: 'tree',
      title: 'Tree / Dendrogram',
      description: 'Hierarchical tree layout with multiple orientations',
      category: ChartCategory.hierarchy,
      builder: () => const TreeExample(),
      primaryColor: Colors.teal,
      tags: ['tree', 'dendrogram', 'hierarchy', 'org-chart'],
    ),
    GalleryItem(
      id: 'pack',
      title: 'Circle Packing',
      description: 'Nested circles showing hierarchical data',
      category: ChartCategory.hierarchy,
      builder: () => const PackExample(),
      primaryColor: Colors.cyan,
      tags: ['pack', 'circle', 'hierarchy', 'nested'],
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
    GalleryItem(
      id: 'box-plot',
      title: 'Box Plot',
      description: 'Statistical box plots showing distribution quartiles',
      category: ChartCategory.scatterAndDistribution,
      builder: () => const BoxPlotExample(),
      primaryColor: Colors.purple,
      tags: ['box', 'whisker', 'quartile', 'statistics', 'distribution'],
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
    GalleryItem(
      id: 'network-graph',
      title: 'Network Graph',
      description: 'Force-directed graph showing node relationships',
      category: ChartCategory.network,
      builder: () => const NetworkGraphExample(),
      primaryColor: Colors.indigo,
      tags: ['network', 'graph', 'force', 'nodes', 'edges'],
    ),
    GalleryItem(
      id: 'chord-diagram',
      title: 'Chord Diagram',
      description: 'Circular diagram showing relationships between entities',
      category: ChartCategory.network,
      builder: () => const ChordDiagramExample(),
      primaryColor: Colors.pink,
      tags: ['chord', 'relationships', 'circular', 'flow'],
    ),
    GalleryItem(
      id: 'sankey',
      title: 'Sankey Diagram',
      description: 'Flow diagram showing quantity through a system',
      category: ChartCategory.network,
      builder: () => const SankeyDiagramExample(),
      primaryColor: Colors.teal,
      tags: ['sankey', 'flow', 'energy', 'alluvial'],
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
    GalleryItem(
      id: 'brush',
      title: 'Brush Selection',
      description: 'Interactive brush to select data regions',
      category: ChartCategory.utilities,
      builder: () => const BrushExample(),
      primaryColor: Colors.blue,
      tags: ['brush', 'selection', 'interactive', 'filter'],
    ),
    GalleryItem(
      id: 'zoom',
      title: 'Zoom & Pan',
      description: 'Zoomable and pannable scatter plot with minimap',
      category: ChartCategory.utilities,
      builder: () => const ZoomExample(),
      primaryColor: Colors.indigo,
      tags: ['zoom', 'pan', 'interactive', 'navigation'],
    ),
    GalleryItem(
      id: 'annotations',
      title: 'Annotations',
      description: 'Labels, callouts, and reference lines on charts',
      category: ChartCategory.utilities,
      builder: () => const AnnotationsExample(),
      primaryColor: Colors.red,
      tags: ['annotation', 'label', 'callout', 'reference'],
    ),
    GalleryItem(
      id: 'legends',
      title: 'Legends',
      description: 'Interactive legends with series toggle',
      category: ChartCategory.utilities,
      builder: () => const LegendsExample(),
      primaryColor: Colors.teal,
      tags: ['legend', 'series', 'toggle', 'interactive'],
    ),
    GalleryItem(
      id: 'gradients',
      title: 'Gradients',
      description: 'Linear and radial gradient fills',
      category: ChartCategory.utilities,
      builder: () => const GradientsExample(),
      primaryColor: Colors.purple,
      tags: ['gradient', 'color', 'fill', 'linear', 'radial'],
    ),
    GalleryItem(
      id: 'wordcloud',
      title: 'Word Cloud',
      description: 'Tag cloud showing keyword frequency',
      category: ChartCategory.utilities,
      builder: () => const WordcloudExample(),
      primaryColor: Colors.deepPurple,
      tags: ['wordcloud', 'tags', 'text', 'frequency'],
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
