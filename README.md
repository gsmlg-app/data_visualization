# Data Visualization

A comprehensive data visualization library for Flutter, inspired by D3.js.

[![CI](https://github.com/gsmlg-dev/data_visualization/actions/workflows/ci.yml/badge.svg)](https://github.com/gsmlg-dev/data_visualization/actions/workflows/ci.yml)
[![pub package](https://img.shields.io/pub/v/data_visualization.svg)](https://pub.dev/packages/data_visualization)
[![publisher](https://img.shields.io/pub/publisher/data_visualization.svg)](https://pub.dev/publishers/gsmlg.dev)

## 🌐 Live Demo

**[View Interactive Gallery →](https://gsmlg-app.github.io/data_visualization/)**

Explore 30+ chart types with live examples, source code, and documentation.

## Features

- **Scales**: Linear, logarithmic, power, time, band, ordinal, and more
- **Curves**: Smooth curve interpolation for line and area charts
- **Geographic**: Map projections and GeoJSON rendering
- **Hierarchical**: Treemap, pack, partition, tree, and cluster layouts
- **Statistical**: Regression, correlation, density estimation
- **Interactive**: Tooltips, brushing, dragging, zooming

## Installation

Add the umbrella package to your `pubspec.yaml`:

```yaml
dependencies:
  data_visualization: ^0.1.0
```

Or add individual packages as needed:

```yaml
dependencies:
  dv_scale: ^0.1.0
  dv_curve: ^0.1.0
  dv_geo_core: ^0.1.0
```

## Packages

### Core Utilities

| Package | Description |
|---------|-------------|
| [dv_vendor](packages/dv_vendor) | Array operations and interpolation functions |
| [dv_point](packages/dv_point) | 2D Point class with vector operations |

### Scales

| Package | Description |
|---------|-------------|
| [dv_scale](packages/dv_scale) | Scale functions (linear, log, band, ordinal, etc.) |

### Shapes & Curves

| Package | Description |
|---------|-------------|
| [dv_curve](packages/dv_curve) | Curve interpolation (basis, cardinal, catmull-rom, etc.) |
| [dv_shape](packages/dv_shape) | Shape generators (line, area, arc, pie, stack) |

### Geographic

| Package | Description |
|---------|-------------|
| [dv_geo_core](packages/dv_geo_core) | Projections and GeoJSON parsing |
| [dv_geo](packages/dv_geo) | Geographic visualization widgets |

### Data Processing

| Package | Description |
|---------|-------------|
| [dv_delaunay](packages/dv_delaunay) | Delaunay triangulation |
| [dv_voronoi](packages/dv_voronoi) | Voronoi diagram generation |
| [dv_stats](packages/dv_stats) | Statistical functions |
| [dv_hierarchy](packages/dv_hierarchy) | Hierarchical layouts |

### Visual Primitives

| Package | Description |
|---------|-------------|
| [dv_glyph](packages/dv_glyph) | Symbol glyphs (circle, square, triangle, etc.) |
| [dv_gradient](packages/dv_gradient) | Gradient definitions |
| [dv_pattern](packages/dv_pattern) | Pattern fills |
| [dv_marker](packages/dv_marker) | Markers (circle, arrow) |
| [dv_text](packages/dv_text) | Text rendering utilities |
| [dv_group](packages/dv_group) | SVG-like group with transforms |
| [dv_clip_path](packages/dv_clip_path) | Clipping paths |

### Chart Components

| Package | Description |
|---------|-------------|
| [dv_axis](packages/dv_axis) | Chart axes |
| [dv_grid](packages/dv_grid) | Grid lines |
| [dv_legend](packages/dv_legend) | Legend widgets |
| [dv_annotation](packages/dv_annotation) | Chart annotations |
| [dv_bounds](packages/dv_bounds) | Chart bounds and margins |
| [dv_responsive](packages/dv_responsive) | Responsive containers |

### Interactions

| Package | Description |
|---------|-------------|
| [dv_event](packages/dv_event) | Pointer event handling |
| [dv_tooltip](packages/dv_tooltip) | Tooltip widget |
| [dv_brush](packages/dv_brush) | Brush selection |
| [dv_drag](packages/dv_drag) | Drag interaction |
| [dv_zoom](packages/dv_zoom) | Zoom and pan |

### Charts

| Package | Description |
|---------|-------------|
| [dv_xychart](packages/dv_xychart) | XY chart series (line, bar, area, scatter) |
| [dv_heatmap](packages/dv_heatmap) | Heatmap visualization |
| [dv_network](packages/dv_network) | Force-directed network graph |
| [dv_threshold](packages/dv_threshold) | Reference lines and areas |

### Utilities

| Package | Description |
|---------|-------------|
| [dv_mock_data](packages/dv_mock_data) | Mock data generators |

## Usage

### Basic Line Chart

```dart
import 'package:data_visualization/data_visualization.dart';

class LineChartPainter extends CustomPainter {
  final List<Point> data;

  LineChartPainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    // Create scales
    final xScale = scaleLinear(
      domain: [0, data.length - 1],
      range: [50, size.width - 20],
    );
    final yScale = scaleLinear(
      domain: [0, 100],
      range: [size.height - 40, 20],
    );

    // Generate smooth curve
    final curve = curveCatmullRom();
    final points = data.map((p) => Point(xScale(p.x), yScale(p.y))).toList();
    final smoothed = curve.generate(points);

    // Draw line
    final path = Path();
    path.moveTo(smoothed.first.x, smoothed.first.y);
    for (final p in smoothed.skip(1)) {
      path.lineTo(p.x, p.y);
    }

    canvas.drawPath(path, Paint()
      ..color = Colors.blue
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
```

### Geographic Map

```dart
import 'package:data_visualization/data_visualization.dart';

class MapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final projection = geoMercator(
      center: (0, 0),
      scale: size.width / 6,
      translate: Point(size.width / 2, size.height / 2),
    );

    // Project coordinates
    final nyc = projection.project(-74.0, 40.7);
    final london = projection.project(-0.1, 51.5);

    // Draw cities
    canvas.drawCircle(Offset(nyc.x, nyc.y), 5, Paint()..color = Colors.red);
    canvas.drawCircle(Offset(london.x, london.y), 5, Paint()..color = Colors.blue);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
```

### Hierarchical Treemap

```dart
import 'package:data_visualization/data_visualization.dart';

final root = HierarchyNode<Map<String, dynamic>>(
  data: {'name': 'root'},
  children: [
    HierarchyNode(data: {'name': 'A', 'value': 100}),
    HierarchyNode(data: {'name': 'B', 'value': 200}),
    HierarchyNode(data: {'name': 'C', 'value': 150}),
  ],
);

// Calculate values and layout
root.sum((d) => (d['value'] as num?)?.toDouble() ?? 0);
treemapLayout(root, width: 400, height: 300);

// Each node now has x0, y0, x1, y1 coordinates
for (final node in root.descendants()) {
  print('${node.data['name']}: ${node.x0}, ${node.y0} - ${node.x1}, ${node.y1}');
}
```

## Examples

### Online Gallery

Visit the **[Interactive Gallery](https://gsmlg-app.github.io/data_visualization/)** to explore all chart types with:

- 📊 **30+ visualizations** - Lines, bars, pies, maps, networks, hierarchies, and more
- 📖 **Documentation** - API reference and usage guides for each package
- 💻 **Source code** - View the implementation code for every example
- 🎨 **Interactive** - Tooltips, brushing, zooming, and dragging

### Run Locally

```bash
# Run the gallery app
cd examples/pages
flutter run

# Or run the showcase app
cd examples/showcase_app
flutter run
```

### Chart Types

| Category | Charts |
|----------|--------|
| Lines & Curves | Line, Area, Streamgraph, Threshold, Curves |
| Bars | Grouped, Stacked, Horizontal |
| Radial | Pie/Donut, Radar, Radial Bar |
| Hierarchy | Treemap, Tree/Dendrogram, Circle Packing |
| Scatter & Distribution | Scatter, Heatmap, Box Plot |
| Network | Force Graph, Chord, Sankey, Voronoi |
| Geographic | World Map with projections |
| Utilities | Scales, Brush, Zoom, Annotations, Legends |

## Development

This project uses [Melos](https://melos.invertase.dev/) for monorepo management.

```bash
# Install melos
dart pub global activate melos

# Bootstrap the workspace
melos run prepare

# Run analysis
melos run analyze

# Run tests
melos run test

# Format code
melos run format
```

## License

MIT License - see [LICENSE](LICENSE) for details.

## Credits

Inspired by [D3.js](https://d3js.org/) by Mike Bostock.
