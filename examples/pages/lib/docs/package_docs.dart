import 'package:flutter/material.dart';

import '../gallery/theme_provider.dart';

/// Category of packages
enum PackageCategory {
  core('Core Utilities', Icons.hub_outlined, GalleryTheme.accentTeal),
  geometry('Geometry & Algorithms', Icons.hexagon_outlined, Colors.purple),
  visual('Visual Primitives', Icons.category_outlined, GalleryTheme.accentCoral),
  components('Chart Components', Icons.dashboard_outlined, Colors.amber),
  geographic('Geographic', Icons.public_outlined, Colors.green),
  interactions('Interactions', Icons.touch_app_outlined, Colors.blue),
  layout('Layout', Icons.crop_free_outlined, Colors.indigo),
  charts('Charts', Icons.bar_chart, Colors.teal),
  testing('Testing', Icons.science_outlined, Colors.grey);

  final String label;
  final IconData icon;
  final Color color;

  const PackageCategory(this.label, this.icon, this.color);
}

/// Documentation for a single package
class PackageDoc {
  final String name;
  final String description;
  final PackageCategory category;
  final String overview;
  final List<ApiItem> api;
  final String usageExample;
  final List<String> relatedPackages;

  const PackageDoc({
    required this.name,
    required this.description,
    required this.category,
    required this.overview,
    required this.api,
    required this.usageExample,
    this.relatedPackages = const [],
  });
}

/// An API item (class, function, etc.)
class ApiItem {
  final String name;
  final String type; // 'class', 'function', 'typedef', 'enum'
  final String description;
  final String? signature;

  const ApiItem({
    required this.name,
    required this.type,
    required this.description,
    this.signature,
  });
}

/// Registry of all package documentation
class PackageDocs {
  static const List<PackageDoc> all = [
    // Core Utilities
    PackageDoc(
      name: 'dv_point',
      description: 'Point class for 2D coordinates with utility methods',
      category: PackageCategory.core,
      overview:
          'The dv_point package provides a simple Point class representing 2D coordinates. '
          'It includes utility methods for common operations like distance calculation, '
          'interpolation, and vector operations.',
      api: [
        ApiItem(
          name: 'Point',
          type: 'class',
          description: 'Represents a point in 2D space with x and y coordinates',
          signature: 'Point(double x, double y)',
        ),
        ApiItem(
          name: 'distanceTo',
          type: 'method',
          description: 'Calculates the Euclidean distance to another point',
          signature: 'double distanceTo(Point other)',
        ),
        ApiItem(
          name: 'lerp',
          type: 'method',
          description: 'Linearly interpolates between this point and another',
          signature: 'Point lerp(Point other, double t)',
        ),
      ],
      usageExample: '''
import 'package:data_visualization/data_visualization.dart';

final p1 = Point(0, 0);
final p2 = Point(10, 10);

// Calculate distance
final distance = p1.distanceTo(p2); // ~14.14

// Interpolate
final midpoint = p1.lerp(p2, 0.5); // Point(5, 5)
''',
      relatedPackages: ['dv_scale', 'dv_curve'],
    ),
    PackageDoc(
      name: 'dv_scale',
      description: 'Scale functions for mapping data to visual dimensions',
      category: PackageCategory.core,
      overview:
          'The dv_scale package provides various scale functions inspired by D3.js. '
          'Scales transform data values (domain) to visual values (range). '
          'Includes linear, logarithmic, power, time, ordinal, and band scales.',
      api: [
        ApiItem(
          name: 'scaleLinear',
          type: 'function',
          description: 'Creates a linear scale with continuous domain and range',
          signature: 'Scale scaleLinear({required List<num> domain, required List<num> range})',
        ),
        ApiItem(
          name: 'scaleLog',
          type: 'function',
          description: 'Creates a logarithmic scale',
          signature: 'Scale scaleLog({required List<num> domain, required List<num> range, num base = 10})',
        ),
        ApiItem(
          name: 'scaleBand',
          type: 'function',
          description: 'Creates a band scale for discrete domains with spacing',
          signature: 'BandScale scaleBand({required List<String> domain, required List<num> range, double padding = 0})',
        ),
        ApiItem(
          name: 'scaleOrdinal',
          type: 'function',
          description: 'Creates an ordinal scale mapping discrete values to colors or other values',
          signature: 'OrdinalScale scaleOrdinal({required List domain, required List range})',
        ),
      ],
      usageExample: '''
import 'package:data_visualization/data_visualization.dart';

// Linear scale: map data 0-100 to pixels 0-500
final xScale = scaleLinear(
  domain: [0, 100],
  range: [0, 500],
);
final x = xScale(50); // 250

// Band scale for categories
final categoryScale = scaleBand(
  domain: ['A', 'B', 'C'],
  range: [0, 300],
  padding: 0.1,
);
final bandWidth = categoryScale.bandwidth; // ~90
''',
      relatedPackages: ['dv_axis', 'dv_point'],
    ),
    PackageDoc(
      name: 'dv_curve',
      description: 'Curve interpolation algorithms for smooth lines',
      category: PackageCategory.core,
      overview:
          'The dv_curve package provides curve interpolation algorithms for creating smooth lines through data points. '
          'Includes linear, cardinal, Catmull-Rom, basis, step, and natural spline curves.',
      api: [
        ApiItem(
          name: 'curveLinear',
          type: 'function',
          description: 'Creates straight line segments between points',
          signature: 'Curve curveLinear()',
        ),
        ApiItem(
          name: 'curveCatmullRom',
          type: 'function',
          description: 'Creates smooth Catmull-Rom spline through points',
          signature: 'Curve curveCatmullRom({double alpha = 0.5})',
        ),
        ApiItem(
          name: 'curveCardinal',
          type: 'function',
          description: 'Creates cardinal spline with tension parameter',
          signature: 'Curve curveCardinal({double tension = 0})',
        ),
        ApiItem(
          name: 'curveStep',
          type: 'function',
          description: 'Creates step function with vertical transitions',
          signature: 'Curve curveStep()',
        ),
      ],
      usageExample: '''
import 'package:data_visualization/data_visualization.dart';

final points = [Point(0, 0), Point(50, 100), Point(100, 50)];

// Smooth curve through points
final curve = curveCatmullRom();
final smoothPoints = curve.generate(points);

// Draw on canvas
final path = Path();
path.moveTo(smoothPoints.first.x, smoothPoints.first.y);
for (final p in smoothPoints.skip(1)) {
  path.lineTo(p.x, p.y);
}
canvas.drawPath(path, paint);
''',
      relatedPackages: ['dv_point', 'dv_shape'],
    ),
    PackageDoc(
      name: 'dv_vendor',
      description: 'Third-party utilities and common dependencies',
      category: PackageCategory.core,
      overview:
          'The dv_vendor package provides shared utilities and common dependencies used across the data_visualization ecosystem. '
          'Includes color utilities, math helpers, and other shared functionality.',
      api: [
        ApiItem(
          name: 'ColorUtils',
          type: 'class',
          description: 'Utilities for color manipulation and interpolation',
        ),
        ApiItem(
          name: 'MathUtils',
          type: 'class',
          description: 'Mathematical utilities for common calculations',
        ),
      ],
      usageExample: '''
import 'package:data_visualization/data_visualization.dart';

// Color interpolation
final color = ColorUtils.lerp(Colors.blue, Colors.red, 0.5);
''',
      relatedPackages: ['dv_gradient'],
    ),

    // Geometry & Algorithms
    PackageDoc(
      name: 'dv_delaunay',
      description: 'Delaunay triangulation algorithm',
      category: PackageCategory.geometry,
      overview:
          'The dv_delaunay package provides Delaunay triangulation for a set of points. '
          'Delaunay triangulation maximizes the minimum angle of all triangles, '
          'avoiding skinny triangles. Useful for mesh generation and spatial analysis.',
      api: [
        ApiItem(
          name: 'Delaunay',
          type: 'class',
          description: 'Computes Delaunay triangulation from points',
          signature: 'Delaunay(List<Point> points)',
        ),
        ApiItem(
          name: 'triangles',
          type: 'property',
          description: 'List of triangle indices',
        ),
        ApiItem(
          name: 'halfedges',
          type: 'property',
          description: 'Half-edge data structure for traversal',
        ),
      ],
      usageExample: '''
import 'package:data_visualization/data_visualization.dart';

final points = [Point(0, 0), Point(100, 0), Point(50, 100), Point(50, 50)];
final delaunay = Delaunay(points);

// Access triangles
for (int i = 0; i < delaunay.triangles.length; i += 3) {
  final a = delaunay.triangles[i];
  final b = delaunay.triangles[i + 1];
  final c = delaunay.triangles[i + 2];
  // Draw triangle with points[a], points[b], points[c]
}
''',
      relatedPackages: ['dv_voronoi', 'dv_point'],
    ),
    PackageDoc(
      name: 'dv_voronoi',
      description: 'Voronoi diagram generation',
      category: PackageCategory.geometry,
      overview:
          'The dv_voronoi package generates Voronoi diagrams from a set of points. '
          'A Voronoi diagram partitions space into regions where each region contains all points '
          'closest to a particular seed point. Built on top of Delaunay triangulation.',
      api: [
        ApiItem(
          name: 'Voronoi',
          type: 'class',
          description: 'Generates Voronoi diagram from Delaunay triangulation',
          signature: 'Voronoi(Delaunay delaunay, {Rect? bounds})',
        ),
        ApiItem(
          name: 'cellPolygon',
          type: 'method',
          description: 'Returns the polygon for a Voronoi cell',
          signature: 'List<Point>? cellPolygon(int i)',
        ),
      ],
      usageExample: '''
import 'package:data_visualization/data_visualization.dart';

final points = generateRandomPoints(50);
final delaunay = Delaunay(points);
final voronoi = Voronoi(delaunay, bounds: Rect.fromLTWH(0, 0, 500, 500));

// Draw each cell
for (int i = 0; i < points.length; i++) {
  final cell = voronoi.cellPolygon(i);
  if (cell != null) {
    // Draw polygon
  }
}
''',
      relatedPackages: ['dv_delaunay', 'dv_point'],
    ),
    PackageDoc(
      name: 'dv_stats',
      description: 'Statistical functions and data analysis',
      category: PackageCategory.geometry,
      overview:
          'The dv_stats package provides statistical functions for data analysis. '
          'Includes descriptive statistics, distributions, and data transformations.',
      api: [
        ApiItem(
          name: 'mean',
          type: 'function',
          description: 'Calculates the arithmetic mean of values',
          signature: 'double mean(Iterable<num> values)',
        ),
        ApiItem(
          name: 'median',
          type: 'function',
          description: 'Calculates the median of values',
          signature: 'double median(Iterable<num> values)',
        ),
        ApiItem(
          name: 'quartiles',
          type: 'function',
          description: 'Calculates Q1, Q2, Q3 quartiles',
          signature: 'Quartiles quartiles(Iterable<num> values)',
        ),
        ApiItem(
          name: 'extent',
          type: 'function',
          description: 'Returns min and max of values',
          signature: '(num, num) extent(Iterable<num> values)',
        ),
      ],
      usageExample: '''
import 'package:data_visualization/data_visualization.dart';

final data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

final avg = mean(data); // 5.5
final med = median(data); // 5.5
final q = quartiles(data); // Q1: 3, Q2: 5.5, Q3: 8
final range = extent(data); // (1, 10)
''',
      relatedPackages: ['dv_scale'],
    ),
    PackageDoc(
      name: 'dv_hierarchy',
      description: 'Hierarchical data layouts (tree, treemap, pack)',
      category: PackageCategory.geometry,
      overview:
          'The dv_hierarchy package provides layouts for hierarchical data. '
          'Includes tree layout, treemap, circle packing, and partition layouts.',
      api: [
        ApiItem(
          name: 'HierarchyNode',
          type: 'class',
          description: 'Represents a node in a hierarchy with children',
        ),
        ApiItem(
          name: 'treemap',
          type: 'function',
          description: 'Creates a treemap layout',
          signature: 'TreemapLayout treemap({double width, double height})',
        ),
        ApiItem(
          name: 'tree',
          type: 'function',
          description: 'Creates a tree layout',
          signature: 'TreeLayout tree({double width, double height})',
        ),
        ApiItem(
          name: 'pack',
          type: 'function',
          description: 'Creates a circle packing layout',
          signature: 'PackLayout pack({double radius})',
        ),
      ],
      usageExample: '''
import 'package:data_visualization/data_visualization.dart';

final root = HierarchyNode(
  data: {'name': 'root', 'value': 100},
  children: [
    HierarchyNode(data: {'name': 'A', 'value': 50}),
    HierarchyNode(data: {'name': 'B', 'value': 30}),
    HierarchyNode(data: {'name': 'C', 'value': 20}),
  ],
);

final layout = treemap(width: 500, height: 400);
layout(root);

// Each node now has x0, y0, x1, y1 for its rectangle
''',
      relatedPackages: ['dv_point'],
    ),

    // Visual Primitives
    PackageDoc(
      name: 'dv_shape',
      description: 'SVG-like shape generators (arc, line, area, pie)',
      category: PackageCategory.visual,
      overview:
          'The dv_shape package provides shape generators inspired by D3.js. '
          'Create paths for arcs, lines, areas, pies, and other shapes.',
      api: [
        ApiItem(
          name: 'arc',
          type: 'function',
          description: 'Creates arc path generator for pie/donut charts',
          signature: 'ArcGenerator arc()',
        ),
        ApiItem(
          name: 'line',
          type: 'function',
          description: 'Creates line path generator',
          signature: 'LineGenerator line()',
        ),
        ApiItem(
          name: 'area',
          type: 'function',
          description: 'Creates area path generator',
          signature: 'AreaGenerator area()',
        ),
        ApiItem(
          name: 'pie',
          type: 'function',
          description: 'Creates pie layout generator',
          signature: 'PieGenerator pie()',
        ),
      ],
      usageExample: '''
import 'package:data_visualization/data_visualization.dart';

// Create an arc
final arcGen = arc()
  ..innerRadius = 50
  ..outerRadius = 100
  ..startAngle = 0
  ..endAngle = pi / 2;

final path = arcGen.generate();
canvas.drawPath(path, paint);
''',
      relatedPackages: ['dv_glyph', 'dv_curve'],
    ),
    PackageDoc(
      name: 'dv_glyph',
      description: 'Symbol generators (circle, square, triangle, etc.)',
      category: PackageCategory.visual,
      overview:
          'The dv_glyph package provides symbol generators for scatter plots and markers. '
          'Includes circle, square, triangle, diamond, cross, and custom symbols.',
      api: [
        ApiItem(
          name: 'symbolCircle',
          type: 'const',
          description: 'Circle symbol generator',
        ),
        ApiItem(
          name: 'symbolSquare',
          type: 'const',
          description: 'Square symbol generator',
        ),
        ApiItem(
          name: 'symbolTriangle',
          type: 'const',
          description: 'Triangle symbol generator',
        ),
        ApiItem(
          name: 'symbolDiamond',
          type: 'const',
          description: 'Diamond symbol generator',
        ),
      ],
      usageExample: '''
import 'package:data_visualization/data_visualization.dart';

// Draw different symbols
final symbols = [symbolCircle, symbolSquare, symbolTriangle];

for (int i = 0; i < data.length; i++) {
  final symbol = symbols[i % symbols.length];
  final path = symbol.draw(size: 64);
  canvas.drawPath(path, paint);
}
''',
      relatedPackages: ['dv_shape', 'dv_marker'],
    ),
    PackageDoc(
      name: 'dv_gradient',
      description: 'Gradient utilities for fills and strokes',
      category: PackageCategory.visual,
      overview:
          'The dv_gradient package provides utilities for creating and manipulating gradients. '
          'Includes linear gradients, radial gradients, and color interpolation.',
      api: [
        ApiItem(
          name: 'linearGradient',
          type: 'function',
          description: 'Creates a linear gradient',
          signature: 'Gradient linearGradient({required List<Color> colors, List<double>? stops})',
        ),
        ApiItem(
          name: 'radialGradient',
          type: 'function',
          description: 'Creates a radial gradient',
          signature: 'Gradient radialGradient({required List<Color> colors, List<double>? stops})',
        ),
      ],
      usageExample: '''
import 'package:data_visualization/data_visualization.dart';

final gradient = linearGradient(
  colors: [Colors.blue, Colors.green, Colors.yellow],
  stops: [0, 0.5, 1],
);

final paint = Paint()..shader = gradient.createShader(rect);
canvas.drawRect(rect, paint);
''',
      relatedPackages: ['dv_vendor'],
    ),
    PackageDoc(
      name: 'dv_marker',
      description: 'Line markers and arrows',
      category: PackageCategory.visual,
      overview:
          'The dv_marker package provides markers for line endpoints, including arrows, dots, and custom markers.',
      api: [
        ApiItem(
          name: 'MarkerArrow',
          type: 'class',
          description: 'Arrow marker for line endings',
        ),
        ApiItem(
          name: 'MarkerDot',
          type: 'class',
          description: 'Dot marker for line endings',
        ),
      ],
      usageExample: '''
import 'package:data_visualization/data_visualization.dart';

final marker = MarkerArrow(size: 10, color: Colors.black);
// Apply to line endings
''',
      relatedPackages: ['dv_shape', 'dv_annotation'],
    ),
    PackageDoc(
      name: 'dv_text',
      description: 'Text rendering utilities',
      category: PackageCategory.visual,
      overview:
          'The dv_text package provides utilities for text rendering in visualizations, '
          'including text measurement, wrapping, and positioning.',
      api: [
        ApiItem(
          name: 'measureText',
          type: 'function',
          description: 'Measures text dimensions',
          signature: 'Size measureText(String text, TextStyle style)',
        ),
        ApiItem(
          name: 'wrapText',
          type: 'function',
          description: 'Wraps text to fit within a width',
          signature: 'List<String> wrapText(String text, double maxWidth, TextStyle style)',
        ),
      ],
      usageExample: '''
import 'package:data_visualization/data_visualization.dart';

final size = measureText('Hello', TextStyle(fontSize: 14));
print('Width: \${size.width}, Height: \${size.height}');
''',
      relatedPackages: ['dv_annotation'],
    ),

    // Chart Components
    PackageDoc(
      name: 'dv_axis',
      description: 'Axis components with ticks and labels',
      category: PackageCategory.components,
      overview:
          'The dv_axis package provides axis components for charts. '
          'Includes customizable ticks, labels, and grid lines for both horizontal and vertical axes.',
      api: [
        ApiItem(
          name: 'Axis',
          type: 'class',
          description: 'Renders an axis with ticks and labels',
        ),
        ApiItem(
          name: 'AxisOrientation',
          type: 'enum',
          description: 'Axis orientation: top, right, bottom, left',
        ),
        ApiItem(
          name: 'tickFormat',
          type: 'property',
          description: 'Function to format tick labels',
        ),
      ],
      usageExample: '''
import 'package:data_visualization/data_visualization.dart';

final xAxis = Axis(
  scale: xScale,
  orientation: AxisOrientation.bottom,
  tickCount: 5,
  tickFormat: (d) => '\${d.toInt()}%',
);
''',
      relatedPackages: ['dv_scale', 'dv_grid'],
    ),
    PackageDoc(
      name: 'dv_grid',
      description: 'Grid lines for charts',
      category: PackageCategory.components,
      overview:
          'The dv_grid package provides grid line components for charts. '
          'Supports horizontal, vertical, and custom grid patterns.',
      api: [
        ApiItem(
          name: 'Grid',
          type: 'class',
          description: 'Renders grid lines based on a scale',
        ),
      ],
      usageExample: '''
import 'package:data_visualization/data_visualization.dart';

final grid = Grid(
  xScale: xScale,
  yScale: yScale,
  color: Colors.grey.withOpacity(0.2),
);
''',
      relatedPackages: ['dv_axis', 'dv_scale'],
    ),
    PackageDoc(
      name: 'dv_legend',
      description: 'Legend components for charts',
      category: PackageCategory.components,
      overview:
          'The dv_legend package provides legend components for charts. '
          'Includes categorical legends, continuous color legends, and size legends.',
      api: [
        ApiItem(
          name: 'Legend',
          type: 'class',
          description: 'Renders a chart legend',
        ),
        ApiItem(
          name: 'LegendItem',
          type: 'class',
          description: 'Individual legend entry',
        ),
      ],
      usageExample: '''
import 'package:data_visualization/data_visualization.dart';

final legend = Legend(
  items: [
    LegendItem(label: 'Series A', color: Colors.blue),
    LegendItem(label: 'Series B', color: Colors.red),
  ],
);
''',
      relatedPackages: ['dv_annotation'],
    ),
    PackageDoc(
      name: 'dv_annotation',
      description: 'Chart annotations (labels, callouts, reference lines)',
      category: PackageCategory.components,
      overview:
          'The dv_annotation package provides annotation components for highlighting data points, '
          'adding reference lines, and displaying callouts.',
      api: [
        ApiItem(
          name: 'Annotation',
          type: 'class',
          description: 'Base class for annotations',
        ),
        ApiItem(
          name: 'ReferenceLine',
          type: 'class',
          description: 'Horizontal or vertical reference line',
        ),
        ApiItem(
          name: 'Callout',
          type: 'class',
          description: 'Callout annotation with arrow',
        ),
      ],
      usageExample: '''
import 'package:data_visualization/data_visualization.dart';

final annotation = ReferenceLine(
  value: 50,
  orientation: Orientation.horizontal,
  label: 'Target',
  color: Colors.red,
);
''',
      relatedPackages: ['dv_text', 'dv_marker'],
    ),

    // Geographic
    PackageDoc(
      name: 'dv_geo',
      description: 'Geographic projections and map rendering',
      category: PackageCategory.geographic,
      overview:
          'The dv_geo package provides geographic projections and map rendering capabilities. '
          'Supports GeoJSON parsing and various map projections.',
      api: [
        ApiItem(
          name: 'geoPath',
          type: 'function',
          description: 'Creates a path generator for geographic features',
          signature: 'GeoPath geoPath({Projection? projection})',
        ),
        ApiItem(
          name: 'geoMercator',
          type: 'function',
          description: 'Creates a Mercator projection',
          signature: 'Projection geoMercator()',
        ),
        ApiItem(
          name: 'geoOrthographic',
          type: 'function',
          description: 'Creates an orthographic projection',
          signature: 'Projection geoOrthographic()',
        ),
      ],
      usageExample: '''
import 'package:data_visualization/data_visualization.dart';

final projection = geoMercator()
  ..scale = 100
  ..translate = [width / 2, height / 2];

final pathGen = geoPath(projection: projection);

for (final feature in geoJson['features']) {
  final path = pathGen(feature);
  canvas.drawPath(path, paint);
}
''',
      relatedPackages: ['dv_geo_core', 'dv_map'],
    ),
    PackageDoc(
      name: 'dv_geo_core',
      description: 'Core geographic utilities and GeoJSON parsing',
      category: PackageCategory.geographic,
      overview:
          'The dv_geo_core package provides core geographic utilities including GeoJSON parsing '
          'and coordinate transformations.',
      api: [
        ApiItem(
          name: 'GeoJson',
          type: 'class',
          description: 'Parses GeoJSON data',
        ),
        ApiItem(
          name: 'Feature',
          type: 'class',
          description: 'Represents a GeoJSON feature',
        ),
      ],
      usageExample: '''
import 'package:data_visualization/data_visualization.dart';

final geoJson = await loadGeoJson('world.geo.json');
final features = geoJson.features;
''',
      relatedPackages: ['dv_geo', 'dv_map'],
    ),
    PackageDoc(
      name: 'dv_map',
      description: 'Prebuilt Natural Earth GeoJSON maps with tree-shaking',
      category: PackageCategory.geographic,
      overview:
          'The dv_map package provides 600+ prebuilt Natural Earth GeoJSON maps for Flutter. '
          'Maps are embedded as gzipped Dart constants for zero-asset bundling and tree-shaking support. '
          'Includes world maps and individual countries at 110m (low) and 50m (medium) resolutions. '
          'Each map exports both raw GeoJSON data and a ready-to-use widget.',
      api: [
        ApiItem(
          name: 'World110mWidget',
          type: 'widget',
          description: 'World map at 110m resolution with customizable projection',
          signature: 'World110mWidget({Projection? projection, Color? fillColor, Color? strokeColor, Function? onFeatureTap})',
        ),
        ApiItem(
          name: 'world110m',
          type: 'getter',
          description: 'Raw GeoJSON data for world map at 110m resolution',
          signature: 'GeoJsonFeatureCollection get world110m',
        ),
        ApiItem(
          name: 'world50m',
          type: 'getter',
          description: 'Raw GeoJSON data for world map at 50m resolution',
          signature: 'GeoJsonFeatureCollection get world50m',
        ),
        ApiItem(
          name: 'MapWidget',
          type: 'widget',
          description: 'Base widget for rendering any GeoJSON data with full control',
          signature: 'MapWidget({required GeoJsonFeatureCollection data, Projection? projection, Color? fillColor, Color? strokeColor})',
        ),
      ],
      usageExample: '''
import 'package:dv_map/maps/world/110m.dart';
import 'package:dv_map/maps/asia/china/110m.dart';
import 'package:dv_geo_core/dv_geo_core.dart';

// Use the generated widget (recommended)
World110mWidget(
  projection: MercatorProjection(),
  fillColor: Colors.grey.shade300,
  strokeColor: Colors.grey.shade700,
  onFeatureTap: (feature, position) {
    print('Tapped: \${feature.properties!["name"]}');
  },
)

// Or use the raw GeoJSON data
final worldData = world110m;
final chinaData = asiaChina110m;

print('World has \${worldData.features.length} countries');

// Tree-shakeable: Only imported maps are bundled
// Import only what you need for smaller bundle size
''',
      relatedPackages: ['dv_geo', 'dv_geo_core'],
    ),

    // Interactions
    PackageDoc(
      name: 'dv_event',
      description: 'Event handling for chart interactions',
      category: PackageCategory.interactions,
      overview:
          'The dv_event package provides event handling utilities for chart interactions. '
          'Includes hit testing, event dispatching, and gesture handling.',
      api: [
        ApiItem(
          name: 'HitTestResult',
          type: 'class',
          description: 'Result of a hit test',
        ),
        ApiItem(
          name: 'EventDispatcher',
          type: 'class',
          description: 'Dispatches events to listeners',
        ),
      ],
      usageExample: '''
import 'package:data_visualization/data_visualization.dart';

final dispatcher = EventDispatcher();
dispatcher.on('hover', (event) {
  print('Hovered: \${event.data}');
});
''',
      relatedPackages: ['dv_tooltip', 'dv_brush'],
    ),
    PackageDoc(
      name: 'dv_tooltip',
      description: 'Tooltip components for data display',
      category: PackageCategory.interactions,
      overview:
          'The dv_tooltip package provides tooltip components for displaying data on hover. '
          'Includes customizable positioning and content.',
      api: [
        ApiItem(
          name: 'Tooltip',
          type: 'class',
          description: 'Displays tooltip on hover',
        ),
        ApiItem(
          name: 'TooltipPosition',
          type: 'enum',
          description: 'Tooltip positioning options',
        ),
      ],
      usageExample: '''
import 'package:data_visualization/data_visualization.dart';

Tooltip(
  content: Text('Value: 42'),
  position: TooltipPosition.top,
);
''',
      relatedPackages: ['dv_event'],
    ),
    PackageDoc(
      name: 'dv_brush',
      description: 'Brush selection for data filtering',
      category: PackageCategory.interactions,
      overview:
          'The dv_brush package provides brush selection for filtering data. '
          'Supports 1D and 2D brush selection with customizable appearance.',
      api: [
        ApiItem(
          name: 'Brush',
          type: 'class',
          description: 'Creates a brush selection area',
        ),
        ApiItem(
          name: 'BrushSelection',
          type: 'class',
          description: 'Represents the current brush selection',
        ),
      ],
      usageExample: '''
import 'package:data_visualization/data_visualization.dart';

Brush(
  onBrush: (selection) {
    final filtered = data.where((d) =>
      d.x >= selection.x0 && d.x <= selection.x1
    );
  },
);
''',
      relatedPackages: ['dv_event', 'dv_zoom'],
    ),
    PackageDoc(
      name: 'dv_zoom',
      description: 'Zoom and pan interactions',
      category: PackageCategory.interactions,
      overview:
          'The dv_zoom package provides zoom and pan interactions for charts. '
          'Supports mouse wheel zoom, pinch-to-zoom, and programmatic control.',
      api: [
        ApiItem(
          name: 'Zoom',
          type: 'class',
          description: 'Handles zoom and pan interactions',
        ),
        ApiItem(
          name: 'ZoomTransform',
          type: 'class',
          description: 'Represents current zoom state',
        ),
      ],
      usageExample: '''
import 'package:data_visualization/data_visualization.dart';

Zoom(
  scaleExtent: [0.5, 10],
  onZoom: (transform) {
    setState(() => _transform = transform);
  },
);
''',
      relatedPackages: ['dv_brush', 'dv_event'],
    ),
    PackageDoc(
      name: 'dv_drag',
      description: 'Drag interactions for movable elements',
      category: PackageCategory.interactions,
      overview:
          'The dv_drag package provides drag interactions for movable elements. '
          'Used for dragging nodes in network graphs or adjusting positions.',
      api: [
        ApiItem(
          name: 'Drag',
          type: 'class',
          description: 'Handles drag interactions',
        ),
        ApiItem(
          name: 'DragEvent',
          type: 'class',
          description: 'Drag event with position and subject',
        ),
      ],
      usageExample: '''
import 'package:data_visualization/data_visualization.dart';

Drag(
  onDrag: (event) {
    node.x = event.x;
    node.y = event.y;
  },
);
''',
      relatedPackages: ['dv_event', 'dv_network'],
    ),

    // Layout
    PackageDoc(
      name: 'dv_bounds',
      description: 'Bounding box calculations and margins',
      category: PackageCategory.layout,
      overview:
          'The dv_bounds package provides utilities for bounding box calculations and margin handling.',
      api: [
        ApiItem(
          name: 'Bounds',
          type: 'class',
          description: 'Represents a bounding rectangle with margins',
        ),
        ApiItem(
          name: 'Margin',
          type: 'class',
          description: 'Chart margins (top, right, bottom, left)',
        ),
      ],
      usageExample: '''
import 'package:data_visualization/data_visualization.dart';

final margin = Margin(top: 20, right: 30, bottom: 40, left: 50);
final bounds = Bounds.fromSize(Size(500, 400), margin: margin);
// bounds.width = 420, bounds.height = 340
''',
      relatedPackages: ['dv_responsive'],
    ),
    PackageDoc(
      name: 'dv_responsive',
      description: 'Responsive layout utilities',
      category: PackageCategory.layout,
      overview:
          'The dv_responsive package provides utilities for responsive chart layouts. '
          'Automatically adjusts chart dimensions based on container size.',
      api: [
        ApiItem(
          name: 'ResponsiveChart',
          type: 'widget',
          description: 'Wrapper for responsive chart sizing',
        ),
      ],
      usageExample: '''
import 'package:data_visualization/data_visualization.dart';

ResponsiveChart(
  builder: (context, size) {
    return MyChart(width: size.width, height: size.height);
  },
);
''',
      relatedPackages: ['dv_bounds'],
    ),

    // Charts
    PackageDoc(
      name: 'dv_xychart',
      description: 'XY chart components (bar, line, scatter, area)',
      category: PackageCategory.charts,
      overview:
          'The dv_xychart package provides XY chart components including bar charts, '
          'line charts, scatter plots, and area charts.',
      api: [
        ApiItem(
          name: 'XYChart',
          type: 'widget',
          description: 'Base XY chart widget',
        ),
        ApiItem(
          name: 'BarSeries',
          type: 'class',
          description: 'Bar chart series',
        ),
        ApiItem(
          name: 'LineSeries',
          type: 'class',
          description: 'Line chart series',
        ),
        ApiItem(
          name: 'ScatterSeries',
          type: 'class',
          description: 'Scatter plot series',
        ),
      ],
      usageExample: '''
import 'package:data_visualization/data_visualization.dart';

XYChart(
  series: [
    LineSeries(data: data, xValue: (d) => d.x, yValue: (d) => d.y),
  ],
  xAxis: Axis(label: 'X'),
  yAxis: Axis(label: 'Y'),
);
''',
      relatedPackages: ['dv_scale', 'dv_axis', 'dv_shape'],
    ),
    PackageDoc(
      name: 'dv_heatmap',
      description: 'Heatmap chart component',
      category: PackageCategory.charts,
      overview:
          'The dv_heatmap package provides heatmap chart components for visualizing '
          'matrix data with color intensity.',
      api: [
        ApiItem(
          name: 'Heatmap',
          type: 'widget',
          description: 'Heatmap chart widget',
        ),
        ApiItem(
          name: 'HeatmapCell',
          type: 'class',
          description: 'Individual heatmap cell',
        ),
      ],
      usageExample: '''
import 'package:data_visualization/data_visualization.dart';

Heatmap(
  data: matrix,
  xLabels: xLabels,
  yLabels: yLabels,
  colorScale: scaleSequential(interpolateBlues),
);
''',
      relatedPackages: ['dv_scale', 'dv_gradient'],
    ),
    PackageDoc(
      name: 'dv_network',
      description: 'Network graph and force-directed layout',
      category: PackageCategory.charts,
      overview:
          'The dv_network package provides network graph visualization with force-directed layout. '
          'Includes node and edge rendering with interactive dragging.',
      api: [
        ApiItem(
          name: 'NetworkGraph',
          type: 'widget',
          description: 'Network graph widget',
        ),
        ApiItem(
          name: 'ForceSimulation',
          type: 'class',
          description: 'Force-directed layout simulation',
        ),
        ApiItem(
          name: 'Node',
          type: 'class',
          description: 'Network node',
        ),
        ApiItem(
          name: 'Edge',
          type: 'class',
          description: 'Network edge/link',
        ),
      ],
      usageExample: '''
import 'package:data_visualization/data_visualization.dart';

NetworkGraph(
  nodes: nodes,
  edges: edges,
  nodeBuilder: (node) => Circle(radius: 10, color: node.color),
);
''',
      relatedPackages: ['dv_drag', 'dv_glyph'],
    ),
    PackageDoc(
      name: 'dv_threshold',
      description: 'Threshold/difference area chart',
      category: PackageCategory.charts,
      overview:
          'The dv_threshold package provides threshold area charts for showing differences '
          'between two series with different fill colors above/below the threshold.',
      api: [
        ApiItem(
          name: 'ThresholdChart',
          type: 'widget',
          description: 'Threshold area chart widget',
        ),
      ],
      usageExample: '''
import 'package:data_visualization/data_visualization.dart';

ThresholdChart(
  data: data,
  baseline: (d) => d.expected,
  value: (d) => d.actual,
  aboveColor: Colors.green,
  belowColor: Colors.red,
);
''',
      relatedPackages: ['dv_xychart', 'dv_shape'],
    ),

    // Testing
    PackageDoc(
      name: 'dv_mock_data',
      description: 'Mock data generators for testing and demos',
      category: PackageCategory.testing,
      overview:
          'The dv_mock_data package provides comprehensive mock data generators for testing and examples. '
          'It includes three main components:\n\n'
          '• **MockData** - High-level generators for various chart types (scatter, line, bar, pie, treemap, network, heatmap, box plot, etc.)\n'
          '• **RandomGenerator** - Statistical distributions (normal, exponential, poisson, beta, gamma, etc.) and utilities\n'
          '• **TimeSeriesGenerator** - Time series patterns (linear, sinusoidal, random walk, stock prices, seasonal, OHLC candlestick)',
      api: [
        // MockData class
        ApiItem(
          name: 'MockData',
          type: 'class',
          description: 'Main mock data generator with methods for various chart types',
          signature: 'MockData([int? seed])',
        ),
        ApiItem(
          name: 'scatterData',
          type: 'method',
          description: 'Generates scatter plot data points with optional correlation',
          signature: 'List<Map<String, double>> scatterData({int count, double? correlation})',
        ),
        ApiItem(
          name: 'lineData',
          type: 'method',
          description: 'Generates line chart data using random walk',
          signature: 'List<Map<String, dynamic>> lineData({int points, double volatility})',
        ),
        ApiItem(
          name: 'barData',
          type: 'method',
          description: 'Generates bar chart data with categories',
          signature: 'List<Map<String, dynamic>> barData({int bars, List<String>? categories})',
        ),
        ApiItem(
          name: 'groupedBarData',
          type: 'method',
          description: 'Generates grouped bar chart data with multiple series',
          signature: 'List<Map<String, dynamic>> groupedBarData({int groups, int seriesCount})',
        ),
        ApiItem(
          name: 'stackedData',
          type: 'method',
          description: 'Generates stacked chart data',
          signature: 'List<Map<String, dynamic>> stackedData({int categories, int seriesCount})',
        ),
        ApiItem(
          name: 'pieData',
          type: 'method',
          description: 'Generates pie/donut chart data with percentages',
          signature: 'List<Map<String, dynamic>> pieData({int slices, bool sorted})',
        ),
        ApiItem(
          name: 'treemapData',
          type: 'method',
          description: 'Generates hierarchical treemap data',
          signature: 'Map<String, dynamic> treemapData({int depth, int minChildren, int maxChildren})',
        ),
        ApiItem(
          name: 'networkData',
          type: 'method',
          description: 'Generates network graph data with nodes and links',
          signature: 'Map<String, dynamic> networkData({int nodeCount, double linkProbability})',
        ),
        ApiItem(
          name: 'treeData',
          type: 'method',
          description: 'Generates tree structure data',
          signature: 'Map<String, dynamic> treeData({int depth, int minChildren, int maxChildren})',
        ),
        ApiItem(
          name: 'heatmapData',
          type: 'method',
          description: 'Generates heatmap matrix data',
          signature: 'List<List<double>> heatmapData({int rows, int columns})',
        ),
        ApiItem(
          name: 'correlationMatrix',
          type: 'method',
          description: 'Generates symmetric correlation matrix',
          signature: 'List<List<double>> correlationMatrix({int size})',
        ),
        ApiItem(
          name: 'calendarHeatmapData',
          type: 'method',
          description: 'Generates calendar heatmap data',
          signature: 'Map<DateTime, double> calendarHeatmapData({DateTime start, DateTime end})',
        ),
        ApiItem(
          name: 'geoPoints',
          type: 'method',
          description: 'Generates random geographic points',
          signature: 'List<Map<String, double>> geoPoints({int count})',
        ),
        ApiItem(
          name: 'geoPointsClustered',
          type: 'method',
          description: 'Generates clustered geographic points',
          signature: 'List<Map<String, double>> geoPointsClustered({int clusterCount, int pointsPerCluster})',
        ),
        ApiItem(
          name: 'boxPlotData',
          type: 'method',
          description: 'Generates box plot statistical data with quartiles and outliers',
          signature: 'List<Map<String, dynamic>> boxPlotData({int groups, int samplesPerGroup})',
        ),
        ApiItem(
          name: 'histogramData',
          type: 'method',
          description: 'Generates histogram data with bins',
          signature: 'Map<String, dynamic> histogramData({int sampleCount, int binCount})',
        ),
        ApiItem(
          name: 'violinData',
          type: 'method',
          description: 'Generates violin plot data',
          signature: 'List<Map<String, dynamic>> violinData({int groups, int samplesPerGroup})',
        ),
        // RandomGenerator class
        ApiItem(
          name: 'RandomGenerator',
          type: 'class',
          description: 'Random number generator with various statistical distributions',
          signature: 'RandomGenerator([int? seed])',
        ),
        ApiItem(
          name: 'uniform',
          type: 'method',
          description: 'Generates random double between min and max',
          signature: 'double uniform(double min, double max)',
        ),
        ApiItem(
          name: 'normal',
          type: 'method',
          description: 'Generates random value from normal (Gaussian) distribution',
          signature: 'double normal(double mean, double stdDev)',
        ),
        ApiItem(
          name: 'exponential',
          type: 'method',
          description: 'Generates random value from exponential distribution',
          signature: 'double exponential(double lambda)',
        ),
        ApiItem(
          name: 'poisson',
          type: 'method',
          description: 'Generates random value from Poisson distribution',
          signature: 'int poisson(double lambda)',
        ),
        ApiItem(
          name: 'beta',
          type: 'method',
          description: 'Generates random value from beta distribution',
          signature: 'double beta(double alpha, double beta)',
        ),
        ApiItem(
          name: 'gamma',
          type: 'method',
          description: 'Generates random value from gamma distribution',
          signature: 'double gamma(double shape, [double scale])',
        ),
        ApiItem(
          name: 'randomWalk',
          type: 'method',
          description: 'Generates random walk sequence',
          signature: 'List<double> randomWalk(int steps, {double start, double stepSize})',
        ),
        ApiItem(
          name: 'brownianMotion',
          type: 'method',
          description: 'Generates geometric Brownian motion (stock prices)',
          signature: 'List<double> brownianMotion(int steps, {double start, double mu, double sigma})',
        ),
        // TimeSeriesGenerator class
        ApiItem(
          name: 'TimeSeriesGenerator',
          type: 'class',
          description: 'Generator for time series data with various patterns',
          signature: 'TimeSeriesGenerator([int? seed])',
        ),
        ApiItem(
          name: 'linear',
          type: 'method',
          description: 'Generates linear trend time series',
          signature: 'List<TimeSeriesPoint> linear({DateTime start, DateTime end, Duration interval, double slope})',
        ),
        ApiItem(
          name: 'sinusoidal',
          type: 'method',
          description: 'Generates sinusoidal pattern time series',
          signature: 'List<TimeSeriesPoint> sinusoidal({DateTime start, DateTime end, double amplitude, double frequency})',
        ),
        ApiItem(
          name: 'stockPrice',
          type: 'method',
          description: 'Generates stock-like prices using geometric Brownian motion',
          signature: 'List<TimeSeriesPoint> stockPrice({DateTime start, DateTime end, double startPrice, double volatility})',
        ),
        ApiItem(
          name: 'seasonal',
          type: 'method',
          description: 'Generates data with daily/weekly/monthly seasonal patterns',
          signature: 'List<TimeSeriesPoint> seasonal({DateTime start, DateTime end, List<double>? dailyPattern})',
        ),
        ApiItem(
          name: 'ohlc',
          type: 'method',
          description: 'Generates OHLC candlestick data',
          signature: 'List<OHLCPoint> ohlc({DateTime start, DateTime end, Duration interval, double volatility})',
        ),
        ApiItem(
          name: 'meanReverting',
          type: 'method',
          description: 'Generates mean-reverting time series (Ornstein-Uhlenbeck)',
          signature: 'List<TimeSeriesPoint> meanReverting({DateTime start, DateTime end, double mean, double theta})',
        ),
        ApiItem(
          name: 'correlated',
          type: 'method',
          description: 'Generates multiple correlated time series',
          signature: 'List<List<TimeSeriesPoint>> correlated({DateTime start, DateTime end, int seriesCount, double correlation})',
        ),
        // Data classes
        ApiItem(
          name: 'TimeSeriesPoint',
          type: 'class',
          description: 'Data point with timestamp and value',
          signature: 'TimeSeriesPoint({DateTime timestamp, double value})',
        ),
        ApiItem(
          name: 'OHLCPoint',
          type: 'class',
          description: 'OHLC candlestick data point (Open-High-Low-Close)',
          signature: 'OHLCPoint({DateTime timestamp, double open, double high, double low, double close, int? volume})',
        ),
      ],
      usageExample: '''
import 'package:dv_mock_data/dv_mock_data.dart';

// Create generator with optional seed for reproducibility
final mock = MockData(42);

// Generate scatter data with correlation
final scatter = mock.scatterData(count: 100, correlation: 0.7);

// Generate bar chart data
final bars = mock.barData(
  bars: 5,
  categories: ['A', 'B', 'C', 'D', 'E'],
);

// Generate time series stock prices
final now = DateTime.now();
final prices = mock.timeSeries.stockPrice(
  start: now.subtract(Duration(days: 365)),
  end: now,
  interval: Duration(days: 1),
  startPrice: 100,
  annualVolatility: 0.3,
);

// Generate OHLC candlestick data
final candles = mock.timeSeries.ohlc(
  start: now.subtract(Duration(days: 30)),
  end: now,
  interval: Duration(days: 1),
);

// Use random generator directly
final random = mock.random;
final normalValues = random.normalList(100, mean: 50, stdDev: 10);
final walkValues = random.randomWalk(50, start: 100, stepSize: 2);

// Generate network graph data
final network = mock.networkData(nodeCount: 30, linkProbability: 0.15);
print('Nodes: \${network["nodes"].length}');
print('Links: \${network["links"].length}');

// Generate hierarchical data
final tree = mock.treemapData(depth: 3, minChildren: 2, maxChildren: 4);
''',
      relatedPackages: ['dv_stats', 'dv_xychart'],
    ),
  ];
}
