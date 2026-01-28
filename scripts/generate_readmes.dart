#!/usr/bin/env dart

import 'dart:io';

// Package documentation data
final packageDocs = <String, PackageInfo>{
  'dv_point': PackageInfo(
    description: '2D Point class with vector operations and utilities',
    overview:
        'The dv_point package provides a simple Point class representing 2D coordinates. '
        'It includes utility methods for common operations like distance calculation, '
        'interpolation, and vector operations.',
    features: [
      '2D point representation with x and y coordinates',
      'Distance calculations',
      'Linear interpolation (lerp)',
      'Vector operations',
      'Conversion to/from Offset',
    ],
    example: '''
import 'package:dv_point/dv_point.dart';

final p1 = Point(0, 0);
final p2 = Point(10, 10);

// Calculate distance
final distance = p1.distanceTo(p2); // ~14.14

// Interpolate between points
final midpoint = p1.lerp(p2, 0.5); // Point(5, 5)

// Convert to Offset
final offset = p1.toOffset();
''',
  ),
  'dv_scale': PackageInfo(
    description: 'Scale functions for mapping data to visual dimensions',
    overview:
        'Scale functions transform data values (domain) to visual values (range). '
        'Includes linear, logarithmic, power, time, ordinal, and band scales inspired by D3.js.',
    features: [
      'Linear scales for continuous data',
      'Logarithmic and power scales',
      'Time scales for temporal data',
      'Band scales for categorical data with spacing',
      'Ordinal scales for discrete mappings',
      'Color scales for gradients',
    ],
    example: '''
import 'package:dv_scale/dv_scale.dart';

// Linear scale: map data 0-100 to pixels 0-500
final xScale = scaleLinear(
  domain: [0, 100],
  range: [0, 500],
);
final x = xScale(50); // 250

// Band scale for bar chart categories
final categoryScale = scaleBand(
  domain: ['A', 'B', 'C', 'D'],
  range: [0, 400],
  padding: 0.1,
);
final barWidth = categoryScale.bandwidth;
final position = categoryScale('B');

// Logarithmic scale
final logScale = scaleLog(
  domain: [1, 1000],
  range: [0, 300],
);
''',
  ),
  'dv_curve': PackageInfo(
    description: 'Curve interpolation algorithms for smooth lines',
    overview:
        'Provides curve interpolation algorithms for creating smooth lines through data points. '
        'Includes linear, cardinal, Catmull-Rom, basis, step, and natural spline curves.',
    features: [
      'Linear interpolation',
      'Catmull-Rom splines',
      'Cardinal splines with tension',
      'Basis splines',
      'Step functions',
      'Natural cubic splines',
    ],
    example: '''
import 'package:dv_curve/dv_curve.dart';
import 'package:dv_point/dv_point.dart';

final points = [
  Point(0, 0),
  Point(50, 100),
  Point(100, 50),
  Point(150, 80),
];

// Create smooth Catmull-Rom curve
final curve = curveCatmullRom(alpha: 0.5);
final smoothPoints = curve.generate(points);

// Create cardinal spline with tension
final cardinalCurve = curveCardinal(tension: 0.5);
final cardinalPoints = cardinalCurve.generate(points);

// Step curve for step charts
final stepCurve = curveStep();
final stepPoints = stepCurve.generate(points);
''',
  ),
  'dv_vendor': PackageInfo(
    description: 'Shared utilities and common dependencies',
    overview:
        'Provides shared utilities and common dependencies used across the data_visualization ecosystem. '
        'Includes array operations, color utilities, math helpers, and interpolation functions.',
    features: [
      'Array manipulation utilities',
      'Color interpolation',
      'Mathematical helpers',
      'Type definitions',
      'Common constants',
    ],
    example: '''
import 'package:dv_vendor/dv_vendor.dart';

// Array operations
final values = [1, 2, 3, 4, 5];
final sum = values.reduce((a, b) => a + b);

// Interpolation
final t = 0.5;
final interpolated = interpolateNumber(0, 100, t); // 50
''',
  ),
  'dv_delaunay': PackageInfo(
    description: 'Delaunay triangulation algorithm',
    overview:
        'Computes Delaunay triangulation for a set of points. '
        'Delaunay triangulation maximizes the minimum angle of all triangles, '
        'avoiding skinny triangles. Useful for mesh generation and spatial analysis.',
    features: [
      'Fast Delaunay triangulation',
      'Half-edge data structure',
      'Triangle iteration',
      'Spatial queries',
    ],
    example: '''
import 'package:dv_delaunay/dv_delaunay.dart';
import 'package:dv_point/dv_point.dart';

final points = [
  Point(0, 0),
  Point(100, 0),
  Point(50, 100),
  Point(50, 50),
];

final delaunay = Delaunay(points);

// Access triangles (indices into points array)
for (int i = 0; i < delaunay.triangles.length; i += 3) {
  final a = delaunay.triangles[i];
  final b = delaunay.triangles[i + 1];
  final c = delaunay.triangles[i + 2];
  print('Triangle: \${points[a]}, \${points[b]}, \${points[c]}');
}
''',
  ),
  'dv_voronoi': PackageInfo(
    description: 'Voronoi diagram generation',
    overview:
        'Generates Voronoi diagrams from a set of points. '
        'A Voronoi diagram partitions space into regions where each region contains all points '
        'closest to a particular seed point. Built on top of Delaunay triangulation.',
    features: [
      'Voronoi cell generation',
      'Bounded diagrams',
      'Cell polygon extraction',
      'Neighbor queries',
    ],
    example: '''
import 'package:dv_voronoi/dv_voronoi.dart';
import 'package:dv_delaunay/dv_delaunay.dart';
import 'package:dv_point/dv_point.dart';
import 'dart:ui';

final points = List.generate(50, (i) => Point(
  Random().nextDouble() * 500,
  Random().nextDouble() * 500,
));

final delaunay = Delaunay(points);
final voronoi = Voronoi(
  delaunay,
  bounds: Rect.fromLTWH(0, 0, 500, 500),
);

// Draw each Voronoi cell
for (int i = 0; i < points.length; i++) {
  final cell = voronoi.cellPolygon(i);
  if (cell != null) {
    // Draw polygon for cell i
  }
}
''',
  ),
  'dv_stats': PackageInfo(
    description: 'Statistical functions and data analysis',
    overview:
        'Provides statistical functions for data analysis including descriptive statistics, '
        'distributions, and data transformations.',
    features: [
      'Descriptive statistics (mean, median, variance)',
      'Quartiles and percentiles',
      'Min/max and extent',
      'Histograms and bins',
      'Data transformations',
    ],
    example: '''
import 'package:dv_stats/dv_stats.dart';

final data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

// Descriptive statistics
final avg = mean(data); // 5.5
final med = median(data); // 5.5
final q = quartiles(data); // Q1: 3, Q2: 5.5, Q3: 8

// Min and max
final (min, max) = extent(data); // (1, 10)

// Variance and standard deviation
final variance = variance(data);
final stdDev = standardDeviation(data);
''',
  ),
  'dv_hierarchy': PackageInfo(
    description: 'Hierarchical data layouts (tree, treemap, pack)',
    overview:
        'Provides layouts for hierarchical data including tree layouts, treemaps, '
        'circle packing, and partition layouts.',
    features: [
      'Tree layout for dendrograms',
      'Treemap layout',
      'Circle packing layout',
      'Partition layout',
      'Hierarchy traversal methods',
    ],
    example: '''
import 'package:dv_hierarchy/dv_hierarchy.dart';

final root = HierarchyNode(
  data: {'name': 'root'},
  children: [
    HierarchyNode(data: {'name': 'A', 'value': 100}),
    HierarchyNode(data: {'name': 'B', 'value': 200}),
    HierarchyNode(data: {'name': 'C', 'value': 150}),
  ],
);

// Calculate values
root.sum((d) => (d['value'] as num?)?.toDouble() ?? 0);

// Apply treemap layout
treemapLayout(root, width: 400, height: 300);

// Each node now has x0, y0, x1, y1 coordinates
for (final node in root.descendants()) {
  print('\${node.data['name']}: (\${node.x0}, \${node.y0}) - (\${node.x1}, \${node.y1})');
}
''',
  ),
  'dv_shape': PackageInfo(
    description: 'Shape generators (arc, line, area, pie)',
    overview:
        'Provides shape generators inspired by D3.js for creating paths for arcs, lines, '
        'areas, pies, and other shapes.',
    features: [
      'Arc generator for pie/donut charts',
      'Line generator with curves',
      'Area generator',
      'Pie layout generator',
      'Stack layout for stacked charts',
    ],
    example: '''
import 'package:dv_shape/dv_shape.dart';
import 'dart:math';

// Create a pie arc
final arcGen = arc()
  ..innerRadius = 50
  ..outerRadius = 100
  ..startAngle = 0
  ..endAngle = pi / 2;

final path = arcGen.generate();

// Create a line with curve
final lineGen = line()
  ..x = (d) => d['x']
  ..y = (d) => d['y']
  ..curve = curveCatmullRom();

final data = [
  {'x': 0, 'y': 0},
  {'x': 50, 'y': 100},
  {'x': 100, 'y': 50},
];
final linePath = lineGen.generate(data);
''',
  ),
  'dv_glyph': PackageInfo(
    description: 'Symbol generators (circle, square, triangle, etc.)',
    overview:
        'Provides symbol generators for scatter plots and markers including circle, square, '
        'triangle, diamond, cross, and custom symbols.',
    features: [
      'Circle symbols',
      'Square symbols',
      'Triangle symbols',
      'Diamond symbols',
      'Cross symbols',
      'Custom symbol support',
    ],
    example: '''
import 'package:dv_glyph/dv_glyph.dart';

// Use predefined symbols
final symbols = [
  symbolCircle,
  symbolSquare,
  symbolTriangle,
  symbolDiamond,
  symbolCross,
];

// Draw symbols at different points
for (int i = 0; i < data.length; i++) {
  final symbol = symbols[i % symbols.length];
  final path = symbol.draw(size: 64);
  canvas.save();
  canvas.translate(data[i].x, data[i].y);
  canvas.drawPath(path, paint);
  canvas.restore();
}
''',
  ),
  'dv_gradient': PackageInfo(
    description: 'Gradient utilities for fills and strokes',
    overview:
        'Provides utilities for creating and manipulating gradients including linear gradients, '
        'radial gradients, and color interpolation.',
    features: [
      'Linear gradients',
      'Radial gradients',
      'Color interpolation',
      'Gradient stops',
      'Shader creation',
    ],
    example: '''
import 'package:dv_gradient/dv_gradient.dart';
import 'package:flutter/material.dart';

// Create linear gradient
final gradient = linearGradient(
  colors: [Colors.blue, Colors.green, Colors.yellow],
  stops: [0, 0.5, 1],
);

final paint = Paint()
  ..shader = gradient.createShader(Rect.fromLTWH(0, 0, 200, 100));

canvas.drawRect(rect, paint);

// Create radial gradient
final radial = radialGradient(
  colors: [Colors.white, Colors.blue],
  stops: [0, 1],
);
''',
  ),
  'dv_marker': PackageInfo(
    description: 'Line markers and arrows',
    overview:
        'Provides markers for line endpoints including arrows, dots, and custom markers.',
    features: [
      'Arrow markers',
      'Dot markers',
      'Custom marker support',
      'Marker positioning',
    ],
    example: '''
import 'package:dv_marker/dv_marker.dart';
import 'package:flutter/material.dart';

// Create arrow marker
final arrow = MarkerArrow(
  size: 10,
  color: Colors.black,
);

// Apply to line endings
// (Typically used with dv_annotation or custom line drawing)
''',
  ),
  'dv_text': PackageInfo(
    description: 'Text rendering utilities',
    overview:
        'Provides utilities for text rendering in visualizations including text measurement, '
        'wrapping, and positioning.',
    features: [
      'Text measurement',
      'Text wrapping',
      'Text positioning helpers',
      'Multi-line text support',
    ],
    example: '''
import 'package:dv_text/dv_text.dart';
import 'package:flutter/material.dart';

// Measure text dimensions
final size = measureText(
  'Hello World',
  TextStyle(fontSize: 14),
);
print('Width: \${size.width}, Height: \${size.height}');

// Wrap text to fit width
final lines = wrapText(
  'This is a long text that needs wrapping',
  maxWidth: 200,
  style: TextStyle(fontSize: 12),
);
''',
  ),
  'dv_pattern': PackageInfo(
    description: 'Pattern fills for visualizations',
    overview:
        'Provides pattern fills like stripes, dots, and grids for chart backgrounds and fills.',
    features: [
      'Stripe patterns',
      'Dot patterns',
      'Grid patterns',
      'Custom pattern support',
    ],
    example: '''
import 'package:dv_pattern/dv_pattern.dart';
import 'package:flutter/material.dart';

// Create stripe pattern
final pattern = PatternStripes(
  color: Colors.blue,
  spacing: 5,
  angle: 45,
);

// Use as paint shader
final paint = Paint()..shader = pattern.createShader(bounds);
''',
  ),
  'dv_group': PackageInfo(
    description: 'SVG-like group with transforms',
    overview:
        'Provides SVG-like group functionality with support for transforms, clipping, and opacity.',
    features: [
      'Transform support (translate, rotate, scale)',
      'Clipping paths',
      'Opacity control',
      'Nested groups',
    ],
    example: '''
import 'package:dv_group/dv_group.dart';
import 'package:flutter/material.dart';

Group(
  transform: Matrix4.translationValues(100, 50, 0),
  opacity: 0.8,
  child: CustomPaint(
    painter: MyPainter(),
  ),
)
''',
  ),
  'dv_clip_path': PackageInfo(
    description: 'Clipping paths for visualizations',
    overview:
        'Provides clipping path utilities for constraining drawing regions.',
    features: [
      'Rectangle clipping',
      'Circle clipping',
      'Path-based clipping',
      'Clip combining',
    ],
    example: '''
import 'package:dv_clip_path/dv_clip_path.dart';
import 'dart:ui';

// Clip to rectangle
canvas.save();
canvas.clipRect(Rect.fromLTWH(0, 0, 200, 100));
// Draw content
canvas.restore();
''',
  ),
  'dv_axis': PackageInfo(
    description: 'Axis components with ticks and labels',
    overview:
        'Provides axis components for charts with customizable ticks, labels, and grid lines '
        'for both horizontal and vertical axes.',
    features: [
      'Horizontal and vertical axes',
      'Customizable tick count',
      'Label formatting',
      'Tick size and padding',
      'Grid line support',
    ],
    example: '''
import 'package:dv_axis/dv_axis.dart';
import 'package:dv_scale/dv_scale.dart';

final xScale = scaleLinear(
  domain: [0, 100],
  range: [0, 400],
);

final xAxis = Axis(
  scale: xScale,
  orientation: AxisOrientation.bottom,
  tickCount: 10,
  tickFormat: (value) => '\${value.toInt()}%',
)
''',
  ),
  'dv_grid': PackageInfo(
    description: 'Grid lines for charts',
    overview:
        'Provides grid line components for charts with support for horizontal, vertical, '
        'and custom grid patterns.',
    features: [
      'Horizontal grid lines',
      'Vertical grid lines',
      'Customizable styling',
      'Grid based on scales',
    ],
    example: '''
import 'package:dv_grid/dv_grid.dart';
import 'package:dv_scale/dv_scale.dart';
import 'package:flutter/material.dart';

final grid = Grid(
  xScale: xScale,
  yScale: yScale,
  width: 400,
  height: 300,
  color: Colors.grey.withOpacity(0.2),
  strokeWidth: 1,
)
''',
  ),
  'dv_legend': PackageInfo(
    description: 'Legend components for charts',
    overview:
        'Provides legend components for charts including categorical legends, continuous color legends, '
        'and size legends.',
    features: [
      'Categorical legends',
      'Continuous color legends',
      'Size legends',
      'Customizable layout',
      'Interactive legends',
    ],
    example: '''
import 'package:dv_legend/dv_legend.dart';
import 'package:flutter/material.dart';

Legend(
  items: [
    LegendItem(
      label: 'Series A',
      color: Colors.blue,
      symbol: symbolCircle,
    ),
    LegendItem(
      label: 'Series B',
      color: Colors.red,
      symbol: symbolSquare,
    ),
  ],
  orientation: LegendOrientation.horizontal,
)
''',
  ),
  'dv_annotation': PackageInfo(
    description: 'Chart annotations (labels, callouts, reference lines)',
    overview:
        'Provides annotation components for highlighting data points, adding reference lines, '
        'and displaying callouts.',
    features: [
      'Reference lines',
      'Callout annotations',
      'Label annotations',
      'Custom positioning',
      'Arrow connectors',
    ],
    example: '''
import 'package:dv_annotation/dv_annotation.dart';
import 'package:flutter/material.dart';

// Reference line
ReferenceLine(
  value: 50,
  orientation: Orientation.horizontal,
  label: 'Target',
  color: Colors.red,
  strokeWidth: 2,
)

// Callout annotation
Callout(
  position: Point(100, 50),
  label: 'Important point',
  arrowLength: 20,
)
''',
  ),
  'dv_bounds': PackageInfo(
    description: 'Bounding box calculations and margins',
    overview:
        'Provides utilities for bounding box calculations and margin handling in charts.',
    features: [
      'Margin calculation',
      'Bounding box utilities',
      'Inner bounds calculation',
      'Size helpers',
    ],
    example: '''
import 'package:dv_bounds/dv_bounds.dart';
import 'dart:ui';

final margin = Margin(
  top: 20,
  right: 30,
  bottom: 40,
  left: 50,
);

final bounds = Bounds.fromSize(
  Size(500, 400),
  margin: margin,
);

// Inner dimensions
print('Width: \${bounds.width}'); // 420
print('Height: \${bounds.height}'); // 340
''',
  ),
  'dv_responsive': PackageInfo(
    description: 'Responsive layout utilities',
    overview:
        'Provides utilities for responsive chart layouts that automatically adjust based on container size.',
    features: [
      'Responsive sizing',
      'Container-based dimensions',
      'Aspect ratio preservation',
      'Breakpoint support',
    ],
    example: '''
import 'package:dv_responsive/dv_responsive.dart';
import 'package:flutter/material.dart';

ResponsiveChart(
  builder: (context, size) {
    return CustomPaint(
      size: size,
      painter: MyChartPainter(
        width: size.width,
        height: size.height,
      ),
    );
  },
)
''',
  ),
  'dv_geo': PackageInfo(
    description: 'Geographic projections and map rendering',
    overview:
        'Provides geographic projections and map rendering capabilities with support for '
        'GeoJSON parsing and various map projections.',
    features: [
      'Mercator projection',
      'Orthographic projection',
      'Equirectangular projection',
      'Albers projection',
      'GeoPath generator',
      'Projection transforms',
    ],
    example: '''
import 'package:dv_geo/dv_geo.dart';
import 'package:dv_point/dv_point.dart';

final projection = MercatorProjection(
  center: (0, 0),
  scale: 100,
  translate: Point(width / 2, height / 2),
);

final pathGen = GeoPath(projection);

// Project coordinates
final point = projection.project(-74.0, 40.7); // NYC

// Generate paths from GeoJSON
for (final feature in geoJson.features) {
  final paths = pathGen.generate(feature);
  // Draw paths
}
''',
  ),
  'dv_geo_core': PackageInfo(
    description: 'Core geographic utilities and GeoJSON parsing',
    overview:
        'Provides core geographic utilities including GeoJSON parsing, coordinate transformations, '
        'and geographic data structures.',
    features: [
      'GeoJSON parsing',
      'Feature collections',
      'Geometry types (Point, LineString, Polygon)',
      'Coordinate systems',
      'Properties handling',
    ],
    example: '''
import 'package:dv_geo_core/dv_geo_core.dart';
import 'dart:convert';

// Parse GeoJSON
final geoJson = GeoJsonFeatureCollection.fromJson(
  jsonDecode(geoJsonString),
);

// Access features
for (final feature in geoJson.features) {
  print('Type: \${feature.geometry.type}');
  print('Name: \${feature.properties?['name']}');
}
''',
  ),
  'dv_event': PackageInfo(
    description: 'Event handling for chart interactions',
    overview:
        'Provides event handling utilities for chart interactions including hit testing, '
        'event dispatching, and gesture handling.',
    features: [
      'Hit testing',
      'Event dispatching',
      'Gesture handling',
      'Event bubbling',
      'Custom events',
    ],
    example: '''
import 'package:dv_event/dv_event.dart';

final dispatcher = EventDispatcher();

// Register event listener
dispatcher.on('hover', (event) {
  print('Hovered: \${event.data}');
});

// Dispatch event
dispatcher.dispatch('hover', data: {'x': 100, 'y': 50});
''',
  ),
  'dv_tooltip': PackageInfo(
    description: 'Tooltip components for data display',
    overview:
        'Provides tooltip components for displaying data on hover with customizable positioning and content.',
    features: [
      'Automatic positioning',
      'Custom content',
      'Follow cursor mode',
      'Sticky tooltips',
      'Multiple positioning strategies',
    ],
    example: '''
import 'package:dv_tooltip/dv_tooltip.dart';
import 'package:flutter/material.dart';

Tooltip(
  message: 'Value: 42',
  position: TooltipPosition.top,
  child: Container(
    width: 20,
    height: 20,
    color: Colors.blue,
  ),
)
''',
  ),
  'dv_brush': PackageInfo(
    description: 'Brush selection for data filtering',
    overview:
        'Provides brush selection for filtering data with support for 1D and 2D brush selection '
        'and customizable appearance.',
    features: [
      '1D brush selection',
      '2D brush selection',
      'Programmatic control',
      'Selection events',
      'Customizable styling',
    ],
    example: '''
import 'package:dv_brush/dv_brush.dart';

Brush(
  width: 400,
  height: 300,
  onBrush: (selection) {
    final filtered = data.where((d) =>
      d.x >= selection.x0 &&
      d.x <= selection.x1 &&
      d.y >= selection.y0 &&
      d.y <= selection.y1
    ).toList();
    setState(() => filteredData = filtered);
  },
)
''',
  ),
  'dv_zoom': PackageInfo(
    description: 'Zoom and pan interactions',
    overview:
        'Provides zoom and pan interactions for charts with support for mouse wheel zoom, '
        'pinch-to-zoom, and programmatic control.',
    features: [
      'Mouse wheel zoom',
      'Pinch-to-zoom',
      'Pan support',
      'Zoom constraints',
      'Transform state management',
    ],
    example: '''
import 'package:dv_zoom/dv_zoom.dart';

Zoom(
  scaleExtent: [0.5, 10],
  onZoom: (transform) {
    setState(() {
      _zoomTransform = transform;
      // Update scales with transform
      _xScale = _baseXScale.rescale(transform.k, transform.x);
    });
  },
  child: CustomPaint(
    painter: MyChartPainter(transform: _zoomTransform),
  ),
)
''',
  ),
  'dv_drag': PackageInfo(
    description: 'Drag interactions for movable elements',
    overview:
        'Provides drag interactions for movable elements, useful for dragging nodes in network graphs '
        'or adjusting positions.',
    features: [
      'Drag gesture handling',
      'Constrained dragging',
      'Drag events',
      'Multi-touch support',
    ],
    example: '''
import 'package:dv_drag/dv_drag.dart';

Drag(
  onDragStart: (event) => print('Drag started'),
  onDrag: (event) {
    setState(() {
      node.x = event.x;
      node.y = event.y;
    });
  },
  onDragEnd: (event) => print('Drag ended'),
  child: Container(
    width: 40,
    height: 40,
    decoration: BoxDecoration(
      color: Colors.blue,
      shape: BoxShape.circle,
    ),
  ),
)
''',
  ),
  'dv_xychart': PackageInfo(
    description: 'XY chart components (bar, line, scatter, area)',
    overview:
        'Provides XY chart components including bar charts, line charts, scatter plots, and area charts.',
    features: [
      'Bar series (grouped, stacked)',
      'Line series with curves',
      'Scatter series',
      'Area series',
      'Multiple series support',
      'Interactive tooltips',
    ],
    example: '''
import 'package:dv_xychart/dv_xychart.dart';
import 'package:flutter/material.dart';

XYChart(
  data: data,
  series: [
    LineSeries(
      xValue: (d) => d['x'],
      yValue: (d) => d['y'],
      color: Colors.blue,
      strokeWidth: 2,
    ),
    ScatterSeries(
      xValue: (d) => d['x'],
      yValue: (d) => d['y'],
      color: Colors.red,
      size: 4,
    ),
  ],
  xAxis: Axis(label: 'X Axis'),
  yAxis: Axis(label: 'Y Axis'),
)
''',
  ),
  'dv_heatmap': PackageInfo(
    description: 'Heatmap chart component',
    overview:
        'Provides heatmap chart components for visualizing matrix data with color intensity.',
    features: [
      'Matrix visualization',
      'Color scale mapping',
      'Custom color schemes',
      'Cell tooltips',
      'Row/column labels',
    ],
    example: '''
import 'package:dv_heatmap/dv_heatmap.dart';
import 'package:dv_scale/dv_scale.dart';

Heatmap(
  data: matrix,
  xLabels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'],
  yLabels: ['Week 1', 'Week 2', 'Week 3'],
  colorScale: scaleSequential(
    domain: [0, 100],
    range: [Colors.blue.shade50, Colors.blue.shade900],
  ),
  onCellTap: (row, col, value) {
    print('Cell (\$row, \$col): \$value');
  },
)
''',
  ),
  'dv_network': PackageInfo(
    description: 'Network graph and force-directed layout',
    overview:
        'Provides network graph visualization with force-directed layout including node and edge rendering '
        'with interactive dragging.',
    features: [
      'Force-directed layout',
      'Node dragging',
      'Edge rendering',
      'Customizable forces',
      'Interactive simulation',
    ],
    example: '''
import 'package:dv_network/dv_network.dart';
import 'package:flutter/material.dart';

final nodes = [
  Node(id: 'A', data: {'label': 'Node A'}),
  Node(id: 'B', data: {'label': 'Node B'}),
  Node(id: 'C', data: {'label': 'Node C'}),
];

final edges = [
  Edge(source: 'A', target: 'B'),
  Edge(source: 'B', target: 'C'),
];

NetworkGraph(
  nodes: nodes,
  edges: edges,
  nodeBuilder: (node) => CircleAvatar(
    backgroundColor: Colors.blue,
    child: Text(node.data['label']),
  ),
  width: 500,
  height: 400,
)
''',
  ),
  'dv_threshold': PackageInfo(
    description: 'Threshold/difference area chart',
    overview:
        'Provides threshold area charts for showing differences between two series with different '
        'fill colors above/below the threshold.',
    features: [
      'Threshold area visualization',
      'Dual color fills',
      'Baseline comparison',
      'Custom thresholds',
    ],
    example: '''
import 'package:dv_threshold/dv_threshold.dart';
import 'package:flutter/material.dart';

ThresholdChart(
  data: data,
  xValue: (d) => d['date'],
  baseline: (d) => d['expected'],
  value: (d) => d['actual'],
  aboveColor: Colors.green,
  belowColor: Colors.red,
  thresholdStrokeWidth: 2,
)
''',
  ),
  'dv_mock_data': PackageInfo(
    description: 'Mock data generators for testing and demos',
    overview:
        'Provides comprehensive mock data generators for testing and examples. '
        'Includes generators for various chart types and statistical distributions.',
    features: [
      'Chart-specific data generators (scatter, line, bar, pie)',
      'Statistical distributions (normal, exponential, poisson)',
      'Time series patterns (trends, seasonality, random walk)',
      'Network and hierarchical data',
      'Geographic data',
      'Reproducible with seeds',
    ],
    example: '''
import 'package:dv_mock_data/dv_mock_data.dart';

// Create generator with seed for reproducibility
final mock = MockData(42);

// Generate scatter data with correlation
final scatter = mock.scatterData(count: 100, correlation: 0.7);

// Generate time series
final timeSeries = mock.timeSeries.stockPrice(
  start: DateTime.now().subtract(Duration(days: 365)),
  end: DateTime.now(),
  startPrice: 100,
  volatility: 0.3,
);

// Generate network data
final network = mock.networkData(
  nodeCount: 30,
  linkProbability: 0.15,
);

// Use random distributions
final random = mock.random;
final values = random.normalList(100, mean: 50, stdDev: 10);
''',
  ),
};

class PackageInfo {
  final String description;
  final String overview;
  final List<String> features;
  final String example;

  PackageInfo({
    required this.description,
    required this.overview,
    required this.features,
    required this.example,
  });
}

void main() {
  final packagesDir = Directory('packages');

  for (final entry in packagesDir.listSync()) {
    if (entry is Directory) {
      final packageName = entry.path.split('/').last;
      if (packageName.startsWith('.')) continue;

      final info = packageDocs[packageName];
      if (info == null) {
        print('Warning: No docs for $packageName');
        continue;
      }

      final readmePath = '${entry.path}/README.md';
      final readme = generateReadme(packageName, info);

      File(readmePath).writeAsStringSync(readme);
      print('Updated $readmePath');
    }
  }
}

String generateReadme(String packageName, PackageInfo info) {
  final features = info.features.map((f) => '- $f').join('\n');

  return '''
# $packageName

${info.description}

Part of the [data_visualization](https://pub.dev/packages/data_visualization) package suite.

📚 **[Live Examples](https://gsmlg-app.github.io/data_visualization/)** | **[Documentation](https://gsmlg-app.github.io/data_visualization/#/docs)**

## Overview

${info.overview}

## Features

$features

## Installation

```yaml
dependencies:
  $packageName: ^1.1.0
```

## Usage

${info.example}

## Documentation

For complete API documentation and interactive examples, visit:
- [Interactive Gallery](https://gsmlg-app.github.io/data_visualization/)
- [API Reference](https://pub.dev/documentation/$packageName/latest/)

## Related Packages

This package is part of the data_visualization suite. See all packages at [pub.dev/publishers/gsmlg.dev](https://pub.dev/publishers/gsmlg.dev/packages).

## License

MIT License - see [LICENSE](LICENSE) for details.
''';
}
