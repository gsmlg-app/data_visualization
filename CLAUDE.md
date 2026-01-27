# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

A comprehensive Flutter data visualization library inspired by D3.js, published as 35+ modular packages on pub.dev under the `gsmlg.dev` verified publisher.

**Live Demo**: https://gsmlg-app.github.io/data_visualization/

## Repository Structure

This is a **Dart workspace monorepo** managed by Melos:

```
data_visualization/
├── packages/               # 35+ publishable packages
│   ├── data_visualization/ # Umbrella package (re-exports all)
│   ├── dv_scale/          # Scale functions
│   ├── dv_curve/          # Curve interpolation
│   ├── dv_shape/          # Shape generators
│   ├── dv_geo_core/       # Map projections
│   ├── dv_hierarchy/      # Hierarchical layouts
│   └── ...                # 30+ other packages
└── examples/
    ├── pages/             # Gallery app (deployed to GitHub Pages)
    └── showcase_app/      # Desktop showcase app
```

### Package Architecture

Packages are organized by function, not by dependency layer:

- **Core utilities**: `dv_vendor` (array ops), `dv_point` (2D points)
- **Data transformation**: `dv_scale`, `dv_curve`, `dv_shape`, `dv_hierarchy`
- **Geographic**: `dv_geo_core` (projections), `dv_geo` (widgets), `dv_map` (prebuilt maps)
- **Visual primitives**: `dv_glyph`, `dv_gradient`, `dv_pattern`, `dv_marker`
- **Chart components**: `dv_axis`, `dv_grid`, `dv_legend`, `dv_annotation`
- **Interactions**: `dv_tooltip`, `dv_brush`, `dv_drag`, `dv_zoom`, `dv_event`
- **Charts**: `dv_xychart`, `dv_heatmap`, `dv_network`, `dv_threshold`
- **Utilities**: `dv_stats`, `dv_mock_data`, `dv_bounds`, `dv_responsive`

The `data_visualization` umbrella package re-exports all packages for convenience.

### Workspace Dependencies

All packages use `resolution: workspace` in their `pubspec.yaml`, meaning they reference each other via the workspace rather than pub.dev versions. Dependencies between packages have **no version constraints** (as seen in pubspec files) because workspace resolution handles this.

## Development Commands

### Initial Setup

```bash
# Install Melos globally
dart pub global activate melos

# Bootstrap workspace (get dependencies for all packages)
melos run prepare
```

### Common Tasks

```bash
# Format code
melos run format

# Check formatting
melos run format-check

# Run static analysis on all packages
melos run analyze

# Run tests on all packages
melos run test

# Run tests for a single package
cd packages/dv_scale
flutter test

# Run example apps
cd examples/pages
flutter run -d chrome  # Gallery app

cd examples/showcase_app
flutter run            # Desktop showcase
```

### Publishing

```bash
# Dry run to check for issues
melos run pub-publish:dry-run

# Publish to pub.dev (manual, hits rate limits)
melos run pub-publish

# Individual package publish
cd packages/dv_scale
dart pub publish --force
```

**Note**: pub.dev has a rate limit of **12 packages per 24-hour rolling window**. When publishing many packages, spread them across multiple days or wait for the rolling window to clear.

### Versioning

```bash
# Bump versions for changed packages
melos run version:patch   # 1.0.0 -> 1.0.1
melos run version:minor   # 1.0.0 -> 1.1.0
melos run version:major   # 1.0.0 -> 2.0.0
```

Versioning is **independent** - each package has its own version number.

## Key Architecture Patterns

### 1. CustomPainter-based Rendering

Most visualizations use Flutter's `CustomPainter` for rendering:

```dart
class MyChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Use scales to map data -> screen coordinates
    final xScale = scaleLinear(domain: [0, 100], range: [0, size.width]);
    final yScale = scaleLinear(domain: [0, 100], range: [size.height, 0]);

    // Use generators to create paths
    final lineGen = LineGenerator<Point>(
      x: (d, i) => xScale(d.x),
      y: (d, i) => yScale(d.y),
      curve: curveCatmullRom(),
    );
  }
}
```

### 2. Generator Pattern (D3-like)

Generators are functions/classes that transform data into visual elements:

```dart
// Line generator: data -> Path
final lineGen = LineGenerator<T>(
  x: (datum, index) => double,
  y: (datum, index) => double,
  curve: Curve,
);

// Pie generator: values -> arc data
final pieGen = PieGenerator<T>(
  value: (datum, index) => double,
  startAngle: double,
  endAngle: double,
);
```

### 3. Scale Functions

Scales map from **data domain** to **visual range**:

```dart
// Linear: y = mx + b
final scale = scaleLinear(domain: [0, 100], range: [0, 400]);
scale(50);  // -> 200

// Band: for categorical data (bar charts)
final band = scaleBand(domain: ['A', 'B', 'C'], range: [0, 300]);
band('B');         // -> 100 (position)
band.bandwidth;    // -> 100 (width)
```

### 4. Hierarchy Data Structure

Hierarchical layouts (treemap, tree, pack) use a recursive node structure:

```dart
class HierarchyNode<T> {
  T data;
  List<HierarchyNode<T>> children;
  double? value;  // Computed by sum()

  // Layout sets these:
  double? x, y;        // Position (tree, cluster)
  double? x0, y0, x1, y1;  // Bounds (treemap, partition)
  double? r;           // Radius (pack)
}

// Usage:
root.sum((d) => d['value']);  // Compute values bottom-up
treemapLayout(root, width: 400, height: 300);  // Set x0,y0,x1,y1
```

### 5. Geographic Projections

Map projections convert (longitude, latitude) to (x, y):

```dart
final proj = geoMercator(
  center: (0, 0),
  scale: 100,
  translate: Point(width/2, height/2),
);

final point = proj.project(-74.0, 40.7);  // NYC
final path = GeoPath(proj).generate(geoJson);
```

## Example App Structure

### Gallery App (examples/pages)

The gallery app deployed to GitHub Pages has a structured approach:

- **Chart sources**: `lib/gallery/chart_sources.dart` - All chart example implementations
- **Chart docs**: `lib/gallery/chart_docs.dart` - Documentation for each chart type
- **Registry**: `lib/gallery/gallery_registry.dart` - Central registration of all charts
- **Examples**: `lib/examples/*.dart` - Individual chart implementations

When adding a new chart example:
1. Create the example in `lib/examples/`
2. Add source code to `chart_sources.dart`
3. Add documentation to `chart_docs.dart`
4. Register in `gallery_registry.dart`

## Testing

- Tests use standard Flutter testing (`flutter test`)
- Most packages have `test/` directories with unit tests
- Focus on:
  - Mathematical correctness (scales, projections, statistics)
  - Generator output (paths, layouts)
  - Edge cases (empty data, single point, etc.)

## CI/CD

GitHub Actions workflows:

- **ci.yml**: Format check, analyze, test, build (runs on all pushes)
- **pages.yml**: Deploy gallery app to GitHub Pages (on main branch)
- **publish.yml**: Automated publishing workflow (manual trigger)

Paths ignored by CI: `.md` files, `.claude/`, docs, IDE configs.

## Package Publishing

All packages are published to pub.dev under the `gsmlg.dev` verified publisher.

After publishing, packages need to be transferred to the publisher:
1. Navigate to `https://pub.dev/packages/{package}/admin`
2. Select `gsmlg.dev` from publisher dropdown
3. Click "TRANSFER TO PUBLISHER"

## Dependencies

- **Flutter SDK**: >=3.0.0
- **Dart SDK**: >=3.8.0
- **Melos**: ^7.0.0
- No external dependencies except Flutter SDK

All visualization is done with Flutter's built-in Canvas API - no native dependencies.
