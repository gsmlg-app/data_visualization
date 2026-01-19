import 'gallery_item.dart';

/// Documentation for all chart types in the gallery
class ChartDocs {
  // ============================================================
  // LINES & CURVES
  // ============================================================

  static const lineChart = ChartDocumentation(
    overview: '''
A line chart displays data points connected by straight or curved lines, ideal for showing trends over time or continuous data sequences. Multiple series can be overlaid to compare different datasets.
''',
    useCases: [
      'Tracking metrics over time (sales, traffic, temperature)',
      'Comparing trends between multiple datasets',
      'Showing continuous data with clear progression',
      'Identifying patterns, peaks, and valleys in data',
    ],
    features: [
      'Multiple series support with distinct colors',
      'Smooth curve interpolation options',
      'Data point markers with hover tooltips',
      'Configurable axis labels and grid lines',
    ],
    dataFormat: '''
List of Point objects with x (time/sequence) and y (value) coordinates:
```dart
final data = [
  Point(0, 30),
  Point(1, 45),
  Point(2, 28),
  // ...
];
```
''',
    codeSnippet: '''
// Create scales
final xScale = scaleLinear(domain: [0, 10], range: [0, width]);
final yScale = scaleLinear(domain: [0, 100], range: [height, 0]);

// Generate smooth curve
final curve = curveCatmullRom();
final points = data.map((p) => Point(xScale(p.x), yScale(p.y))).toList();
final curvePoints = curve.generate(points);

// Draw the line
final path = Path()..moveTo(curvePoints.first.x, curvePoints.first.y);
for (final p in curvePoints.skip(1)) {
  path.lineTo(p.x, p.y);
}
canvas.drawPath(path, linePaint);
''',
    relatedCharts: ['area-chart', 'streamgraph', 'threshold'],
  );

  static const areaChart = ChartDocumentation(
    overview: '''
An area chart is a line chart with the area between the line and axis filled, emphasizing the magnitude of values. Stacked area charts show how multiple series contribute to a total over time.
''',
    useCases: [
      'Showing volume or magnitude of data over time',
      'Visualizing part-to-whole relationships over time',
      'Comparing cumulative totals across categories',
      'Displaying resource usage or capacity',
    ],
    features: [
      'Stacked or overlapping area modes',
      'Gradient fills for visual depth',
      'Smooth curve interpolation',
      'Interactive hover to see individual values',
    ],
    dataFormat: '''
Multiple series with the same x-coordinates:
```dart
final series = {
  'Series A': [30, 45, 28, 50],
  'Series B': [20, 35, 40, 30],
};
```
''',
    codeSnippet: '''
// Create area path
final areaPath = Path()..moveTo(xScale(0), yScale(0));
for (int i = 0; i < data.length; i++) {
  areaPath.lineTo(xScale(i), yScale(data[i]));
}
areaPath.lineTo(xScale(data.length - 1), yScale(0));
areaPath.close();

// Fill with gradient
canvas.drawPath(areaPath, Paint()..shader = gradient);
''',
    relatedCharts: ['line-chart', 'streamgraph', 'bar-stacked'],
  );

  static const curves = ChartDocumentation(
    overview: '''
Curve interpolation transforms discrete data points into smooth, continuous lines. Different algorithms produce varying levels of smoothness and preserve different data characteristics.
''',
    useCases: [
      'Smoothing noisy data for clearer visualization',
      'Creating aesthetically pleasing line charts',
      'Interpolating between sparse data points',
      'Choosing the right curve for your data type',
    ],
    features: [
      'Multiple curve algorithms: Catmull-Rom, Basis, Cardinal, etc.',
      'Adjustable tension parameters',
      'Side-by-side comparison of curve types',
      'Interactive point manipulation',
    ],
    dataFormat: '''
List of Point objects representing control points:
```dart
final controlPoints = [
  Point(0, 50),
  Point(100, 20),
  Point(200, 80),
];
```
''',
    codeSnippet: '''
// Available curve types
final catmullRom = curveCatmullRom();
final basis = curveBasis();
final cardinal = curveCardinal(tension: 0.5);
final monotoneX = curveMonotoneX();

// Generate smooth points
final smoothPoints = curve.generate(controlPoints);
''',
    relatedCharts: ['line-chart', 'area-chart'],
  );

  static const streamgraph = ChartDocumentation(
    overview: '''
A streamgraph is a type of stacked area chart displaced around a central axis, creating a flowing, organic appearance. It emphasizes changes in values over time while maintaining visual balance.
''',
    useCases: [
      'Showing composition changes over time (music genres, topics)',
      'Creating visually engaging data stories',
      'Displaying cyclical or seasonal patterns',
      'Comparing multiple categories without a fixed baseline',
    ],
    features: [
      'Symmetrical or asymmetrical layouts',
      'Smooth transitions between time periods',
      'Color-coded categories for easy identification',
      'Interactive hover to highlight individual streams',
    ],
    dataFormat: '''
Time-series data with multiple categories:
```dart
final data = {
  'Rock': [30, 45, 40, 35],
  'Pop': [25, 30, 35, 40],
  'Jazz': [15, 12, 10, 8],
};
```
''',
    codeSnippet: '''
// Stack data around center
for (int layer = 0; layer < categories.length; layer++) {
  final path = Path();
  // Calculate offset from center
  final baseY = centerY + calculateOffset(layer);
  // Draw flowing shape
  for (final point in data[layer]) {
    path.lineTo(point.x, baseY + point.y);
  }
}
''',
    relatedCharts: ['area-chart', 'bar-stacked'],
  );

  static const threshold = ChartDocumentation(
    overview: '''
A threshold chart (or difference chart) compares two lines and fills the area between them with different colors based on which line is higher, clearly showing when values exceed or fall below a reference.
''',
    useCases: [
      'Comparing actual vs target/expected values',
      'Showing temperature above/below average',
      'Visualizing profit vs loss periods',
      'Highlighting over/under performance',
    ],
    features: [
      'Automatic area coloring based on comparison',
      'Configurable threshold line styles',
      'Smooth curve interpolation',
      'Clear visual distinction of above/below states',
    ],
    dataFormat: '''
Paired data for actual and expected values:
```dart
final actual = [45, 52, 48, 65, 55];
final expected = [50, 50, 50, 50, 50];
```
''',
    codeSnippet: '''
// Compare and fill areas
for (int i = 0; i < points.length - 1; i++) {
  final isAbove = actual[i] > expected[i];
  final color = isAbove ? Colors.green : Colors.red;

  // Create area between lines
  final areaPath = Path()
    ..moveTo(x0, actualY0)
    ..lineTo(x1, actualY1)
    ..lineTo(x1, expectedY1)
    ..lineTo(x0, expectedY0)
    ..close();

  canvas.drawPath(areaPath, Paint()..color = color);
}
''',
    relatedCharts: ['line-chart', 'area-chart'],
  );

  // ============================================================
  // BARS
  // ============================================================

  static const barChart = ChartDocumentation(
    overview: '''
A bar chart uses rectangular bars to represent data values, with bar length proportional to the value. Grouped bars place multiple series side by side for direct comparison across categories.
''',
    useCases: [
      'Comparing values across discrete categories',
      'Showing rankings or ordered data',
      'Comparing multiple groups within categories',
      'Displaying survey results or vote counts',
    ],
    features: [
      'Grouped bars for multi-series comparison',
      'Customizable bar colors and spacing',
      'Rounded corners for modern appearance',
      'Hover tooltips with exact values',
    ],
    dataFormat: '''
Categorical data with optional grouping:
```dart
final data = {
  'Q1': {'Sales': 100, 'Costs': 60},
  'Q2': {'Sales': 120, 'Costs': 70},
};
```
''',
    codeSnippet: '''
// Create band scale for categories
final xScale = scaleBand(
  domain: categories,
  range: [0, width],
  paddingInner: 0.2,
);

// Draw bars
for (final category in categories) {
  final barHeight = yScale(values[category]);
  canvas.drawRRect(
    RRect.fromRectAndRadius(
      Rect.fromLTWH(xScale(category), barHeight, xScale.bandwidth, height - barHeight),
      Radius.circular(4),
    ),
    barPaint,
  );
}
''',
    relatedCharts: ['bar-horizontal', 'bar-stacked'],
  );

  static const barHorizontal = ChartDocumentation(
    overview: '''
Horizontal bar charts orient bars horizontally, making them ideal for displaying long category labels and ranking data. They can be grouped or stacked to show multiple series.
''',
    useCases: [
      'Displaying data with long category names',
      'Showing rankings or leaderboards',
      'Comparing values when categories have lengthy labels',
      'Creating Gantt-like timeline visualizations',
    ],
    features: [
      'Support for both grouped and stacked modes',
      'Toggle between visualization styles',
      'Better readability for many categories',
      'Natural reading order (top to bottom)',
    ],
    dataFormat: '''
Same as vertical bar chart:
```dart
final data = [
  ('Category A', 85),
  ('Category B', 72),
  ('Category C', 93),
];
```
''',
    codeSnippet: '''
// Horizontal bar with band scale on Y-axis
final yScale = scaleBand(
  domain: categories,
  range: [0, height],
);

// Draw horizontal bars
for (final category in categories) {
  final barWidth = xScale(values[category]);
  canvas.drawRRect(
    RRect.fromRectAndRadius(
      Rect.fromLTWH(0, yScale(category), barWidth, yScale.bandwidth),
      Radius.circular(4),
    ),
    barPaint,
  );
}
''',
    relatedCharts: ['bar-chart', 'bar-stacked'],
  );

  static const barStacked = ChartDocumentation(
    overview: '''
Stacked bar charts show how individual parts contribute to a whole by stacking segments on top of each other. Each segment represents a sub-category, and the total bar height shows the cumulative value.
''',
    useCases: [
      'Showing composition of totals across categories',
      'Comparing both totals and individual components',
      'Visualizing part-to-whole relationships',
      'Displaying budget breakdowns by category',
    ],
    features: [
      'Clear visual hierarchy of contributions',
      'Cumulative totals visible at a glance',
      'Color-coded segments for each sub-category',
      'Hover to see individual segment values',
    ],
    dataFormat: '''
Nested data structure:
```dart
final data = {
  'Q1': {'Product A': 30, 'Product B': 20, 'Product C': 15},
  'Q2': {'Product A': 35, 'Product B': 25, 'Product C': 20},
};
```
''',
    codeSnippet: '''
// Stack segments
for (final category in categories) {
  double currentY = baseline;
  for (final segment in segments) {
    final segmentHeight = yScale(values[category][segment]);
    canvas.drawRect(
      Rect.fromLTWH(xScale(category), currentY - segmentHeight,
                    xScale.bandwidth, segmentHeight),
      Paint()..color = segmentColors[segment],
    );
    currentY -= segmentHeight;
  }
}
''',
    relatedCharts: ['bar-chart', 'area-chart', 'streamgraph'],
  );

  // ============================================================
  // RADIAL
  // ============================================================

  static const pieChart = ChartDocumentation(
    overview: '''
A pie/donut chart displays data as slices of a circle, where each slice represents a proportion of the whole. Donut charts have a hollow center that can display additional information.
''',
    useCases: [
      'Showing proportions or percentages of a whole',
      'Displaying market share or budget allocation',
      'Visualizing simple compositions (5-7 categories max)',
      'Creating visually engaging summary statistics',
    ],
    features: [
      'Configurable inner radius for donut style',
      'Percentage labels on slices',
      'Interactive slice selection',
      'Smooth animation on data changes',
    ],
    dataFormat: '''
Simple value list or labeled data:
```dart
final data = {
  'Category A': 35,
  'Category B': 25,
  'Category C': 20,
  'Other': 20,
};
```
''',
    codeSnippet: '''
// Calculate angles
double startAngle = -pi / 2;
for (final entry in data.entries) {
  final sweepAngle = (entry.value / total) * 2 * pi;

  // Draw arc
  final path = Path()
    ..moveTo(center.dx + innerRadius * cos(startAngle),
             center.dy + innerRadius * sin(startAngle))
    ..arcTo(outerRect, startAngle, sweepAngle, false)
    ..arcTo(innerRect, startAngle + sweepAngle, -sweepAngle, false)
    ..close();

  canvas.drawPath(path, Paint()..color = colors[entry.key]);
  startAngle += sweepAngle;
}
''',
    relatedCharts: ['radial-bar', 'radar-chart'],
  );

  static const radarChart = ChartDocumentation(
    overview: '''
A radar chart (spider chart) displays multivariate data on axes starting from the same point, creating a polygon shape. It excels at comparing multiple entities across several dimensions.
''',
    useCases: [
      'Comparing performance across multiple metrics',
      'Visualizing skill assessments or player stats',
      'Showing product feature comparisons',
      'Displaying survey results with multiple criteria',
    ],
    features: [
      'Multiple overlapping polygons for comparison',
      'Configurable number of axes',
      'Grid lines for value reference',
      'Semi-transparent fills for overlapping areas',
    ],
    dataFormat: '''
Multi-dimensional data:
```dart
final player = {
  'Speed': 0.8,
  'Power': 0.6,
  'Accuracy': 0.9,
  'Defense': 0.7,
  'Stamina': 0.85,
};
```
''',
    codeSnippet: '''
// Draw radar polygon
final path = Path();
for (int i = 0; i <= axes; i++) {
  final angle = -pi / 2 + (i % axes) * 2 * pi / axes;
  final value = values[i % axes];
  final r = radius * value;
  final point = Offset(center.dx + r * cos(angle),
                       center.dy + r * sin(angle));
  if (i == 0) path.moveTo(point.dx, point.dy);
  else path.lineTo(point.dx, point.dy);
}
canvas.drawPath(path, fillPaint);
canvas.drawPath(path, strokePaint);
''',
    relatedCharts: ['pie-chart', 'radial-bar'],
  );

  static const radialBar = ChartDocumentation(
    overview: '''
A radial bar chart arranges bars in a circular pattern, with each bar extending from the center outward. It combines the categorical comparison of bar charts with the aesthetic appeal of circular layouts.
''',
    useCases: [
      'Displaying progress or completion metrics',
      'Showing cyclical data (days of week, months)',
      'Creating visually engaging dashboards',
      'Comparing values with a common baseline',
    ],
    features: [
      'Circular arrangement of bars',
      'Configurable start angle and direction',
      'Gradient fills along bar length',
      'Rounded end caps for modern look',
    ],
    dataFormat: '''
Sequential or categorical values:
```dart
final weeklyActivity = {
  'Mon': 0.7,
  'Tue': 0.85,
  'Wed': 0.55,
  'Thu': 0.9,
  'Fri': 0.6,
};
```
''',
    codeSnippet: '''
// Draw radial bars
for (int i = 0; i < values.length; i++) {
  final radius = maxRadius - i * barSpacing;
  final sweepAngle = values[i] * 2 * pi * 0.8;

  canvas.drawArc(
    Rect.fromCircle(center: center, radius: radius),
    -pi / 2,
    sweepAngle,
    false,
    Paint()
      ..color = colors[i]
      ..strokeWidth = barWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke,
  );
}
''',
    relatedCharts: ['pie-chart', 'bar-chart'],
  );

  // ============================================================
  // HIERARCHY
  // ============================================================

  static const treemap = ChartDocumentation(
    overview: '''
A treemap displays hierarchical data as nested rectangles, where size represents a quantitative value. It efficiently uses space to show both the hierarchy and the relative size of each element.
''',
    useCases: [
      'Showing disk space usage by folder',
      'Visualizing budget allocation across departments',
      'Displaying portfolio composition',
      'Comparing sizes within nested categories',
    ],
    features: [
      'Squarified algorithm for optimal rectangle shapes',
      'Color coding by category or value',
      'Drill-down into nested levels',
      'Labels sized to fit available space',
    ],
    dataFormat: '''
Hierarchical tree structure:
```dart
final data = TreeNode(
  name: 'Root',
  children: [
    TreeNode(name: 'A', value: 100, children: [...]),
    TreeNode(name: 'B', value: 200),
  ],
);
```
''',
    codeSnippet: '''
// Squarified treemap layout
void layoutTreemap(TreeNode node, Rect bounds) {
  if (node.children.isEmpty) return;

  final total = node.children.fold(0, (sum, c) => sum + c.value);
  double x = bounds.left, y = bounds.top;

  for (final child in node.children) {
    final ratio = child.value / total;
    final childBounds = calculateBounds(ratio, bounds);
    child.bounds = childBounds;
    layoutTreemap(child, childBounds);
  }
}
''',
    relatedCharts: ['tree', 'pack'],
  );

  static const tree = ChartDocumentation(
    overview: '''
A tree diagram (dendrogram) shows hierarchical relationships using connected nodes. Different layouts (vertical, horizontal, radial) suit different data structures and visual preferences.
''',
    useCases: [
      'Displaying organizational charts',
      'Showing file system structures',
      'Visualizing decision trees',
      'Illustrating family trees or taxonomies',
    ],
    features: [
      'Multiple layout orientations (vertical, horizontal, radial)',
      'Collapsible/expandable nodes',
      'Curved or straight connecting lines',
      'Node styling based on depth or type',
    ],
    dataFormat: '''
Parent-child node structure:
```dart
final root = TreeNode(
  name: 'CEO',
  children: [
    TreeNode(name: 'CTO', children: [...]),
    TreeNode(name: 'CFO', children: [...]),
  ],
);
```
''',
    codeSnippet: '''
// Recursive tree layout
void layoutTree(TreeNode node, double x, double y, int depth) {
  node.x = x;
  node.y = y;

  if (node.children.isEmpty) return;

  final childWidth = width / node.children.length;
  for (int i = 0; i < node.children.length; i++) {
    layoutTree(
      node.children[i],
      x + (i - node.children.length / 2) * childWidth,
      y + levelHeight,
      depth + 1,
    );
  }
}
''',
    relatedCharts: ['treemap', 'pack', 'sankey'],
  );

  static const pack = ChartDocumentation(
    overview: '''
Circle packing displays hierarchical data using nested circles, where parent circles contain their children. The size of each circle represents a quantitative value, creating an organic, visually appealing layout.
''',
    useCases: [
      'Showing hierarchical compositions',
      'Visualizing nested categories with sizes',
      'Creating bubble-style organizational charts',
      'Displaying taxonomies with quantity information',
    ],
    features: [
      'Automatic circle sizing and positioning',
      'Smooth zooming into nested levels',
      'Color coding by depth or category',
      'Interactive hover to show details',
    ],
    dataFormat: '''
Hierarchical structure with values:
```dart
final data = PackNode(
  name: 'Root',
  children: [
    PackNode(name: 'Group A', children: [
      PackNode(name: 'Item 1', value: 50),
      PackNode(name: 'Item 2', value: 30),
    ]),
  ],
);
```
''',
    codeSnippet: '''
// Circle packing algorithm
void packCircles(PackNode node) {
  if (node.children.isEmpty) {
    node.radius = sqrt(node.value);
    return;
  }

  // Pack children first
  for (final child in node.children) {
    packCircles(child);
  }

  // Position children within parent
  positionCircles(node.children);
  node.radius = enclosingCircleRadius(node.children);
}
''',
    relatedCharts: ['treemap', 'tree'],
  );

  // ============================================================
  // SCATTER & DISTRIBUTION
  // ============================================================

  static const scatterChart = ChartDocumentation(
    overview: '''
A scatter plot displays individual data points on a two-dimensional grid, revealing correlations, clusters, and outliers. Point size can encode a third dimension (bubble chart).
''',
    useCases: [
      'Finding correlations between two variables',
      'Identifying clusters and outliers',
      'Showing distribution of data points',
      'Visualizing three variables with bubble size',
    ],
    features: [
      'Variable point sizes for third dimension',
      'Color coding by category',
      'Trend lines and regression curves',
      'Interactive zoom and brush selection',
    ],
    dataFormat: '''
Array of data points:
```dart
final data = [
  ScatterPoint(x: 10, y: 20, size: 5, category: 'A'),
  ScatterPoint(x: 25, y: 45, size: 8, category: 'B'),
];
```
''',
    codeSnippet: '''
// Draw scatter points
for (final point in data) {
  final px = xScale(point.x);
  final py = yScale(point.y);
  final radius = sizeScale(point.size);

  canvas.drawCircle(
    Offset(px, py),
    radius,
    Paint()..color = categoryColors[point.category],
  );
}
''',
    relatedCharts: ['heatmap', 'box-plot'],
  );

  static const heatmap = ChartDocumentation(
    overview: '''
A heatmap represents data values as colors in a matrix grid, making it easy to spot patterns, correlations, and anomalies across two categorical dimensions.
''',
    useCases: [
      'Showing correlations between variables',
      'Displaying activity patterns (time vs day)',
      'Visualizing confusion matrices',
      'Comparing values across two categories',
    ],
    features: [
      'Customizable color scales',
      'Cell labels with values',
      'Row and column clustering',
      'Interactive cell highlighting',
    ],
    dataFormat: '''
2D matrix of values:
```dart
final data = [
  [0.2, 0.5, 0.8, 0.3],
  [0.6, 0.9, 0.4, 0.7],
  [0.1, 0.3, 0.6, 0.9],
];
```
''',
    codeSnippet: '''
// Draw heatmap cells
for (int row = 0; row < rows; row++) {
  for (int col = 0; col < cols; col++) {
    final value = data[row][col];
    final color = colorScale(value);

    canvas.drawRect(
      Rect.fromLTWH(col * cellWidth, row * cellHeight,
                    cellWidth - gap, cellHeight - gap),
      Paint()..color = color,
    );
  }
}
''',
    relatedCharts: ['scatter-chart', 'box-plot'],
  );

  static const boxPlot = ChartDocumentation(
    overview: '''
A box plot (box-and-whisker plot) summarizes data distribution through five statistics: minimum, first quartile, median, third quartile, and maximum. Outliers are shown as individual points.
''',
    useCases: [
      'Comparing distributions across categories',
      'Identifying outliers in datasets',
      'Showing statistical summaries at a glance',
      'Comparing spread and central tendency',
    ],
    features: [
      'Automatic quartile calculation',
      'Outlier detection and display',
      'Horizontal or vertical orientation',
      'Notched boxes for median comparison',
    ],
    dataFormat: '''
Raw data arrays or pre-calculated statistics:
```dart
// Raw data
final data = {'Group A': [1, 2, 3, 4, 5, 6, 100]};

// Or pre-calculated
final stats = BoxPlotStats(
  min: 1, q1: 2, median: 3.5, q3: 5, max: 6,
  outliers: [100],
);
```
''',
    codeSnippet: '''
// Draw box plot
final boxRect = Rect.fromLTRB(
  x - boxWidth / 2, yScale(q3),
  x + boxWidth / 2, yScale(q1),
);

// Box
canvas.drawRect(boxRect, fillPaint);

// Median line
canvas.drawLine(
  Offset(boxRect.left, yScale(median)),
  Offset(boxRect.right, yScale(median)),
  medianPaint,
);

// Whiskers
canvas.drawLine(Offset(x, yScale(min)), Offset(x, yScale(max)), whiskerPaint);
''',
    relatedCharts: ['scatter-chart', 'heatmap'],
  );

  // ============================================================
  // NETWORK
  // ============================================================

  static const voronoi = ChartDocumentation(
    overview: '''
Voronoi diagrams partition a plane into regions based on distance to points, while Delaunay triangulation connects points into triangles. Both are fundamental for spatial analysis and proximity-based visualizations.
''',
    useCases: [
      'Finding nearest neighbors in spatial data',
      'Creating organic-looking region divisions',
      'Optimizing facility placement',
      'Generating terrain meshes',
    ],
    features: [
      'Interactive point manipulation',
      'Toggle between Voronoi and Delaunay views',
      'Color-coded regions',
      'Real-time recalculation on point movement',
    ],
    dataFormat: '''
Array of 2D points:
```dart
final points = [
  Point(100, 200),
  Point(300, 150),
  Point(200, 400),
];
```
''',
    codeSnippet: '''
// Generate Delaunay triangulation
final delaunay = Delaunay.from(points);
final triangles = delaunay.triangles;

// Get Voronoi cells
final voronoi = delaunay.voronoi(bounds);
for (int i = 0; i < points.length; i++) {
  final cell = voronoi.cellPolygon(i);
  canvas.drawPath(cell.toPath(), Paint()..color = colors[i]);
}
''',
    relatedCharts: ['network-graph', 'scatter-chart'],
  );

  static const networkGraph = ChartDocumentation(
    overview: '''
A network graph (force-directed graph) visualizes relationships between entities as nodes connected by edges. Physics-based simulation positions nodes to minimize edge crossings and reveal community structures.
''',
    useCases: [
      'Visualizing social networks and connections',
      'Showing dependencies between modules',
      'Mapping knowledge graphs',
      'Displaying citation or reference networks',
    ],
    features: [
      'Force-directed layout algorithm',
      'Interactive node dragging',
      'Node sizing by importance',
      'Edge thickness by relationship strength',
    ],
    dataFormat: '''
Nodes and edges:
```dart
final nodes = [
  Node(id: 'A', label: 'Node A'),
  Node(id: 'B', label: 'Node B'),
];
final edges = [
  Edge(source: 'A', target: 'B', weight: 1.0),
];
```
''',
    codeSnippet: '''
// Force simulation step
void simulate() {
  // Repulsion between all nodes
  for (final n1 in nodes) {
    for (final n2 in nodes) {
      if (n1 != n2) {
        final force = repulsionForce(n1, n2);
        n1.velocity += force;
      }
    }
  }

  // Attraction along edges
  for (final edge in edges) {
    final force = attractionForce(edge.source, edge.target);
    edge.source.velocity += force;
    edge.target.velocity -= force;
  }

  // Apply velocities
  for (final node in nodes) {
    node.position += node.velocity * damping;
  }
}
''',
    relatedCharts: ['chord-diagram', 'sankey'],
  );

  static const chordDiagram = ChartDocumentation(
    overview: '''
A chord diagram shows flows or relationships between entities arranged in a circle. Arcs on the circumference represent entities, and chords connecting them show the strength of relationships.
''',
    useCases: [
      'Showing migration or trade flows between regions',
      'Visualizing co-occurrence or collaboration',
      'Displaying cross-selling relationships',
      'Mapping communication patterns',
    ],
    features: [
      'Proportional arc sizes',
      'Bidirectional relationship support',
      'Interactive highlighting on hover',
      'Smooth chord curves',
    ],
    dataFormat: '''
Flow matrix between entities:
```dart
final matrix = [
  [0, 10, 5, 8],   // From A to [A, B, C, D]
  [12, 0, 7, 3],   // From B to [A, B, C, D]
  [4, 9, 0, 6],    // From C
  [7, 2, 11, 0],   // From D
];
```
''',
    codeSnippet: '''
// Calculate arc positions
double currentAngle = 0;
for (int i = 0; i < entities.length; i++) {
  final total = matrix[i].reduce((a, b) => a + b);
  final sweepAngle = (total / grandTotal) * 2 * pi;
  arcs[i] = Arc(startAngle: currentAngle, endAngle: currentAngle + sweepAngle);
  currentAngle += sweepAngle + gap;
}

// Draw chords
for (int i = 0; i < entities.length; i++) {
  for (int j = i + 1; j < entities.length; j++) {
    if (matrix[i][j] > 0) {
      drawChord(arcs[i], arcs[j], matrix[i][j]);
    }
  }
}
''',
    relatedCharts: ['network-graph', 'sankey'],
  );

  static const sankey = ChartDocumentation(
    overview: '''
A Sankey diagram visualizes flows between nodes, with link width proportional to flow quantity. It excels at showing how quantities split, merge, and transform through a system.
''',
    useCases: [
      'Tracking energy or material flows',
      'Showing budget allocation and spending',
      'Visualizing user journey funnels',
      'Mapping supply chain logistics',
    ],
    features: [
      'Proportional flow widths',
      'Automatic node positioning',
      'Color-coded flows by source or type',
      'Interactive flow highlighting',
    ],
    dataFormat: '''
Nodes and flows:
```dart
final nodes = ['Source', 'Process A', 'Process B', 'Output'];
final flows = [
  Flow(from: 'Source', to: 'Process A', value: 100),
  Flow(from: 'Source', to: 'Process B', value: 50),
  Flow(from: 'Process A', to: 'Output', value: 80),
];
```
''',
    codeSnippet: '''
// Layout nodes in columns
layoutNodes(nodes, flows);

// Draw flows with bezier curves
for (final flow in flows) {
  final sourceY = getNodeOutputY(flow.from);
  final targetY = getNodeInputY(flow.to);

  final path = Path()
    ..moveTo(sourceX, sourceY)
    ..cubicTo(
      midX, sourceY,
      midX, targetY,
      targetX, targetY,
    );

  canvas.drawPath(path, Paint()
    ..color = flowColor
    ..strokeWidth = flowScale(flow.value)
    ..style = PaintingStyle.stroke);
}
''',
    relatedCharts: ['chord-diagram', 'network-graph', 'tree'],
  );

  // ============================================================
  // GEOGRAPHIC
  // ============================================================

  static const geoMap = ChartDocumentation(
    overview: '''
Geographic visualizations display data on maps using various projections. They can show boundaries, points of interest, choropleth coloring, and flow patterns across geographic regions.
''',
    useCases: [
      'Showing regional data distributions',
      'Visualizing location-based metrics',
      'Mapping travel or migration patterns',
      'Displaying territorial boundaries',
    ],
    features: [
      'Multiple map projections',
      'Choropleth coloring by value',
      'Point markers with clustering',
      'Pan and zoom navigation',
    ],
    dataFormat: '''
GeoJSON format:
```dart
final geoJson = {
  'type': 'FeatureCollection',
  'features': [
    {
      'type': 'Feature',
      'properties': {'name': 'Country', 'value': 100},
      'geometry': {'type': 'Polygon', 'coordinates': [...]},
    },
  ],
};
```
''',
    codeSnippet: '''
// Project coordinates
final projection = MercatorProjection(center: center, scale: scale);

// Draw country polygons
for (final feature in geoJson['features']) {
  final path = Path();
  for (final ring in feature['geometry']['coordinates']) {
    for (int i = 0; i < ring.length; i++) {
      final point = projection(ring[i][0], ring[i][1]);
      if (i == 0) path.moveTo(point.x, point.y);
      else path.lineTo(point.x, point.y);
    }
  }
  path.close();

  final value = feature['properties']['value'];
  canvas.drawPath(path, Paint()..color = colorScale(value));
}
''',
    relatedCharts: ['heatmap', 'scatter-chart'],
  );

  static const geoChoropleth = ChartDocumentation(
    overview: '''
A choropleth map uses color to represent data values for geographic regions. The intensity of color corresponds to the data value, making it easy to identify patterns and compare regions.
''',
    useCases: [
      'Visualizing population density by region',
      'Showing election results by state/country',
      'Displaying economic indicators geographically',
      'Comparing health statistics across regions',
    ],
    features: [
      'Color scales mapped to data values',
      'Hover interactions to show details',
      'Multiple color scheme options',
      'Legend showing value ranges',
    ],
    dataFormat: '''
GeoJSON with data values in properties:
```dart
final geoJson = {
  'type': 'FeatureCollection',
  'features': [
    {
      'type': 'Feature',
      'properties': {'name': 'Country', 'density': 153},
      'geometry': {...},
    },
  ],
};
```
''',
    codeSnippet: '''
// Get color for density value using log scale
Color getColorForDensity(double? density) {
  if (density == null) return Colors.grey.shade300;
  final logDensity = density > 0 ? math.log(density + 1) : 0;
  final t = (logDensity / maxLog).clamp(0.0, 1.0);
  return Color.lerp(lightColor, darkColor, t)!;
}

// Draw each country with data-driven color
for (final feature in worldData.features) {
  final name = feature.properties?['name'];
  final density = densityData[name];
  final color = getColorForDensity(density);
  canvas.drawPath(path, Paint()..color = color);
}
''',
    relatedCharts: ['geo-map', 'geo-usa', 'heatmap'],
  );

  static const geoUsa = ChartDocumentation(
    overview: '''
The USA map uses the Albers equal-area conic projection, which is optimized for the contiguous United States. It preserves area measurements and is the standard projection for US statistical maps.
''',
    useCases: [
      'Displaying state-level statistics',
      'Showing election maps',
      'Visualizing regional economic data',
      'Comparing state demographics',
    ],
    features: [
      'Albers equal-area projection',
      'State boundary rendering',
      'Interactive state selection',
      'State abbreviation labels',
    ],
    dataFormat: '''
US States GeoJSON with properties:
```dart
{
  'type': 'Feature',
  'properties': {'name': 'California', 'density': 253.6},
  'geometry': {'type': 'Polygon', 'coordinates': [...]},
}
```
''',
    codeSnippet: '''
// Create Albers projection for USA
final proj = geoAlbers(
  center: (-96, 38),
  scale: scale,
  translate: center,
  parallels0: 29.5,
  parallels1: 45.5,
);

// Draw states with density coloring
for (final feature in usaData.features) {
  final density = feature.properties?['density'];
  final color = getColorForDensity(density);
  final paths = geoPathGenerator.generate(feature);

  for (final pathPoints in paths) {
    final path = Path()..addPolygon(pathPoints, true);
    canvas.drawPath(path, Paint()..color = color);
  }
}
''',
    relatedCharts: ['geo-choropleth', 'geo-map'],
  );

  static const geoGlobe = ChartDocumentation(
    overview: '''
An interactive globe uses orthographic projection to create a 3D sphere effect. Users can rotate the globe by dragging, revealing different parts of the world with a natural globe-like perspective.
''',
    useCases: [
      'Creating engaging global visualizations',
      'Showing worldwide data with 3D effect',
      'Educational geographic displays',
      'Navigation and exploration interfaces',
    ],
    features: [
      'Orthographic (globe) projection',
      'Interactive drag-to-rotate',
      'Auto-rotation animation',
      'Atmosphere glow effect',
    ],
    dataFormat: '''
World GeoJSON with standard format:
```dart
final worldData = GeoJsonFeatureCollection.fromJson(geoJson);
```
''',
    codeSnippet: '''
// Create orthographic projection with rotation
final proj = geoOrthographic(
  center: (0, 0),
  scale: radius,
  translate: center,
  rotate: (-rotationX, -rotationY, 0),
);

// Handle drag gestures for rotation
void onPanUpdate(DragUpdateDetails details) {
  final delta = details.localPosition - lastPanPosition!;
  setState(() {
    rotationX = (rotationX - delta.dx * 0.5) % 360;
    rotationY = (rotationY + delta.dy * 0.3).clamp(-90.0, 90.0);
  });
}

// Draw globe background with gradient
canvas.drawCircle(center, radius, Paint()..shader = globeGradient);

// Draw land masses (only visible hemisphere)
for (final feature in worldData.features) {
  final paths = geoPathGenerator.generate(feature);
  // Points on back hemisphere return NaN and are filtered out
}
''',
    relatedCharts: ['geo-map', 'geo-choropleth'],
  );

  // ============================================================
  // UTILITIES
  // ============================================================

  static const scales = ChartDocumentation(
    overview: '''
Scales are functions that map data values to visual properties like position, size, or color. Different scale types handle continuous, discrete, logarithmic, and time-based data.
''',
    useCases: [
      'Converting data values to pixel coordinates',
      'Mapping values to colors or sizes',
      'Creating axis tick marks and labels',
      'Handling different data distributions',
    ],
    features: [
      'Linear, logarithmic, and power scales',
      'Band scales for categorical data',
      'Time scales for date/time data',
      'Custom domain and range configuration',
    ],
    dataFormat: '''
Domain (input) and range (output):
```dart
final scale = scaleLinear(
  domain: [0, 100],    // Data range
  range: [0, 500],     // Pixel range
);
```
''',
    codeSnippet: '''
// Linear scale for continuous data
final yScale = scaleLinear(domain: [0, max], range: [height, 0]);

// Band scale for categories
final xScale = scaleBand(
  domain: ['A', 'B', 'C'],
  range: [0, width],
  paddingInner: 0.2,
);

// Logarithmic scale for exponential data
final logScale = scaleLog(domain: [1, 1000], range: [0, width]);

// Power scale with custom exponent
final sqrtScale = scalePow(domain: [0, 100], range: [0, 50], exponent: 0.5);
''',
    relatedCharts: [],
  );

  static const interactive = ChartDocumentation(
    overview: '''
Interactive features like hover effects, tooltips, and click handlers make charts more engaging and informative. They reveal additional data on demand without cluttering the initial view.
''',
    useCases: [
      'Showing detailed values on hover',
      'Highlighting related data points',
      'Enabling data exploration',
      'Providing drill-down capabilities',
    ],
    features: [
      'Hover detection and highlighting',
      'Customizable tooltips',
      'Click and tap handlers',
      'Animated transitions',
    ],
    dataFormat: '''
Standard chart data with event handlers:
```dart
onHover: (point) => showTooltip(point),
onClick: (point) => navigateToDetail(point),
```
''',
    codeSnippet: '''
// Hover detection
void onPointerHover(PointerHoverEvent event) {
  final localPosition = event.localPosition;

  // Find nearest point
  DataPoint? nearest;
  double minDist = double.infinity;
  for (final point in data) {
    final dist = (point.position - localPosition).distance;
    if (dist < minDist && dist < hitRadius) {
      minDist = dist;
      nearest = point;
    }
  }

  setState(() => hoveredPoint = nearest);
}

// Draw tooltip
if (hoveredPoint != null) {
  drawTooltip(canvas, hoveredPoint!);
}
''',
    relatedCharts: ['brush', 'zoom'],
  );

  static const brush = ChartDocumentation(
    overview: '''
Brush selection allows users to select a region of data by clicking and dragging. Selected data can be highlighted, filtered, or used to update linked views.
''',
    useCases: [
      'Selecting time ranges for analysis',
      'Filtering data points in scatter plots',
      'Creating focus+context views',
      'Enabling cross-filtering between charts',
    ],
    features: [
      '1D (x or y) or 2D brush selection',
      'Resize handles for adjustment',
      'Real-time selection feedback',
      'Programmatic brush control',
    ],
    dataFormat: '''
Brush state and callbacks:
```dart
BrushSelection? selection;
onBrushChange: (Rect? bounds) => updateSelection(bounds),
onBrushEnd: (Rect? bounds) => filterData(bounds),
```
''',
    codeSnippet: '''
// Handle brush gestures
void onPanStart(DragStartDetails details) {
  brushStart = details.localPosition;
}

void onPanUpdate(DragUpdateDetails details) {
  brushEnd = details.localPosition;
  brushRect = Rect.fromPoints(brushStart!, brushEnd!);

  // Find selected points
  selectedPoints = data.where((p) => brushRect!.contains(p.position)).toList();
  setState(() {});
}

// Draw brush rectangle
canvas.drawRect(brushRect!, Paint()
  ..color = Colors.blue.withOpacity(0.2)
  ..style = PaintingStyle.fill);
''',
    relatedCharts: ['zoom', 'interactive'],
  );

  static const zoom = ChartDocumentation(
    overview: '''
Zoom and pan capabilities allow users to explore large datasets by focusing on regions of interest. A minimap provides context and navigation for the visible area.
''',
    useCases: [
      'Exploring dense scatter plots',
      'Examining detailed time series',
      'Navigating large network graphs',
      'Providing overview+detail views',
    ],
    features: [
      'Pinch-to-zoom and scroll wheel support',
      'Smooth pan with momentum',
      'Minimap for orientation',
      'Reset to original view',
    ],
    dataFormat: '''
Transform state:
```dart
double scale = 1.0;
Offset offset = Offset.zero;
```
''',
    codeSnippet: '''
// Handle zoom gestures
void onScaleUpdate(ScaleUpdateDetails details) {
  setState(() {
    // Update scale
    final newScale = (scale * details.scale).clamp(0.5, 5.0);

    // Zoom towards focal point
    final focalPoint = details.localFocalPoint;
    offset = focalPoint - (focalPoint - offset) * (newScale / scale);
    scale = newScale;
  });
}

// Apply transform when drawing
canvas.save();
canvas.translate(offset.dx, offset.dy);
canvas.scale(scale);
// ... draw chart ...
canvas.restore();

// Draw minimap
drawMinimap(canvas, size, scale, offset);
''',
    relatedCharts: ['brush', 'interactive'],
  );

  static const annotations = ChartDocumentation(
    overview: '''
Annotations add context to charts through labels, callouts, reference lines, and highlighted regions. They help viewers understand significant data points and thresholds.
''',
    useCases: [
      'Marking important events or milestones',
      'Showing threshold or target lines',
      'Labeling peaks, valleys, or outliers',
      'Adding explanatory notes to charts',
    ],
    features: [
      'Reference lines (horizontal/vertical)',
      'Callout labels with connectors',
      'Highlighted regions and bands',
      'Customizable annotation styles',
    ],
    dataFormat: '''
Annotation definitions:
```dart
final annotations = [
  ReferenceLine(value: 50, label: 'Target'),
  Callout(x: 10, y: 80, label: 'Peak'),
  Band(y1: 40, y2: 60, label: 'Normal Range'),
];
```
''',
    codeSnippet: '''
// Draw reference line
canvas.drawLine(
  Offset(margin.left, yScale(referenceValue)),
  Offset(margin.left + chartWidth, yScale(referenceValue)),
  Paint()..color = Colors.red..strokeWidth = 2,
);

// Draw callout
canvas.drawCircle(point, 8, highlightPaint);
canvas.drawLine(point, labelPosition, connectorPaint);
drawLabel(canvas, labelPosition, text, backgroundColor);
''',
    relatedCharts: ['interactive', 'legends'],
  );

  static const legends = ChartDocumentation(
    overview: '''
Legends identify the meaning of visual encodings like colors and shapes. Interactive legends allow users to toggle series visibility, filter data, and focus on specific categories.
''',
    useCases: [
      'Identifying series in multi-line charts',
      'Filtering visible categories',
      'Showing color scale meanings',
      'Providing chart key information',
    ],
    features: [
      'Click to toggle series visibility',
      'Hover to highlight series',
      'Configurable position and layout',
      'Support for various symbol shapes',
    ],
    dataFormat: '''
Legend items:
```dart
final legendItems = [
  LegendItem(label: 'Revenue', color: Colors.blue, visible: true),
  LegendItem(label: 'Costs', color: Colors.red, visible: true),
];
```
''',
    codeSnippet: '''
// Build interactive legend
Widget buildLegend() {
  return Wrap(
    children: series.map((s) {
      final isVisible = visibleSeries.contains(s.name);
      return InkWell(
        onTap: () => toggleSeries(s.name),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 16, height: 16,
              color: isVisible ? s.color : Colors.grey,
            ),
            Text(s.name, style: TextStyle(
              decoration: isVisible ? null : TextDecoration.lineThrough,
            )),
          ],
        ),
      );
    }).toList(),
  );
}
''',
    relatedCharts: ['annotations', 'interactive'],
  );

  static const gradients = ChartDocumentation(
    overview: '''
Gradients add visual depth and meaning to charts through smooth color transitions. They can indicate value ranges, create aesthetic effects, or distinguish between chart regions.
''',
    useCases: [
      'Showing value intensity in area charts',
      'Creating depth in bar charts',
      'Indicating direction of change',
      'Adding visual polish to visualizations',
    ],
    features: [
      'Linear gradients (vertical/horizontal)',
      'Radial gradients for circular charts',
      'Custom color stops',
      'Gradient along data paths',
    ],
    dataFormat: '''
Gradient definition:
```dart
final gradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [Colors.blue.shade700, Colors.blue.shade100],
);
```
''',
    codeSnippet: '''
// Create gradient shader
final shader = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [primaryColor, primaryColor.withOpacity(0.1)],
).createShader(chartBounds);

// Apply to area fill
canvas.drawPath(areaPath, Paint()
  ..shader = shader
  ..style = PaintingStyle.fill);

// Radial gradient for pie charts
final radialShader = RadialGradient(
  center: Alignment.center,
  colors: [lightColor, darkColor],
).createShader(Rect.fromCircle(center: center, radius: radius));
''',
    relatedCharts: ['area-chart', 'radial-bar'],
  );

  static const wordcloud = ChartDocumentation(
    overview: '''
A word cloud displays text where word size represents frequency or importance. Words are packed together in an engaging layout that reveals the most prominent terms at a glance.
''',
    useCases: [
      'Showing keyword frequency in documents',
      'Visualizing tag popularity',
      'Summarizing survey responses',
      'Displaying trending topics',
    ],
    features: [
      'Word size based on frequency/weight',
      'Spiral or random placement algorithms',
      'Color coding by category or sentiment',
      'Interactive word selection',
    ],
    dataFormat: '''
Word frequencies:
```dart
final words = {
  'Flutter': 100,
  'Dart': 85,
  'Widget': 70,
  'State': 60,
};
```
''',
    codeSnippet: '''
// Layout words
final placedWords = <PlacedWord>[];
for (final entry in sortedWords) {
  final fontSize = fontScale(entry.value);
  final textPainter = TextPainter(
    text: TextSpan(text: entry.key, style: TextStyle(fontSize: fontSize)),
    textDirection: TextDirection.ltr,
  )..layout();

  // Find non-overlapping position
  final position = findPosition(textPainter.size, placedWords);
  if (position != null) {
    placedWords.add(PlacedWord(entry.key, position, textPainter));
  }
}

// Draw words
for (final word in placedWords) {
  word.painter.paint(canvas, word.position);
}
''',
    relatedCharts: ['heatmap', 'treemap'],
  );

  static const mockData = ChartDocumentation(
    overview: '''
The dv_mock_data package provides comprehensive mock data generators for testing and demos. Generate realistic random data for various chart types including scatter plots, line charts, bar charts, pie charts, heatmaps, networks, trees, and statistical distributions.
''',
    useCases: [
      'Testing chart implementations with realistic data',
      'Prototyping visualizations before real data is available',
      'Creating demo applications and examples',
      'Generating reproducible test cases with seeded random',
      'Simulating time series data with various patterns',
    ],
    features: [
      'Seeded random for reproducible results',
      'Multiple chart data generators (scatter, line, bar, pie, etc.)',
      'Statistical distributions (normal, exponential, Poisson, etc.)',
      'Time series patterns (linear, sinusoidal, random walk, stock prices)',
      'Hierarchical data (trees, treemaps)',
      'Network graph data (nodes and links)',
      'Geographic point data with clustering',
      'OHLC candlestick data generation',
    ],
    dataFormat: '''
MockData generators:
```dart
final mock = MockData(42); // optional seed

// Scatter data
final scatter = mock.scatterData(
  count: 100,
  correlation: 0.7,
);

// Bar data
final bars = mock.barData(
  bars: 5,
  categories: ['A', 'B', 'C', 'D', 'E'],
);

// Hierarchical data
final tree = mock.treemapData(
  depth: 3,
  minChildren: 2,
  maxChildren: 4,
);

// Network data
final network = mock.networkData(
  nodeCount: 30,
  linkProbability: 0.15,
);
```
''',
    codeSnippet: '''
import 'package:dv_mock_data/dv_mock_data.dart';

// Create seeded generator
final mock = MockData(42);

// Generate time series stock prices
final now = DateTime.now();
final prices = mock.timeSeries.stockPrice(
  start: now.subtract(Duration(days: 365)),
  end: now,
  interval: Duration(days: 1),
  startPrice: 100,
  annualVolatility: 0.3,
);

// Generate box plot statistical data
final boxData = mock.boxPlotData(
  groups: 5,
  samplesPerGroup: 100,
);

// Use random generator directly
final values = mock.random.normalList(100, 50, 10);
final walk = mock.random.randomWalk(50, start: 100, stepSize: 2);
''',
    relatedCharts: ['scatter-chart', 'line-chart', 'bar-chart', 'box-plot'],
  );
}
