# Data Visualization Monorepo - Build Instructions for Claude Code

Execute this plan sequentially. Complete each milestone before moving to the next.

---

## M0: Bootstrap (4 hours)

Create melos workspace with 28 packages:

### 1. Create melos.yaml
```yaml
name: data_visualization
packages:
  - packages/**
  - examples/**

scripts:
  bootstrap: melos exec -- flutter pub get
  analyze: melos exec -- flutter analyze
  test: melos exec -- flutter test
  format: melos exec -- dart format .
```

### 2. Create these 28 package directories in packages/:
- dv_vendor (dart package)
- dv_point (dart package)
- dv_scale (dart package)
- dv_curve (dart package)
- dv_geo_core (dart package)
- dv_delaunay (dart package)
- dv_voronoi (dart package)
- dv_stats (dart package)
- dv_hierarchy (dart package)
- dv_group (flutter package)
- dv_shape (flutter package)
- dv_glyph (flutter package)
- dv_gradient (flutter package)
- dv_pattern (flutter package)
- dv_clip_path (flutter package)
- dv_marker (flutter package)
- dv_text (flutter package)
- dv_axis (flutter package)
- dv_grid (flutter package)
- dv_legend (flutter package)
- dv_annotation (flutter package)
- dv_geo (flutter package)
- dv_event (flutter package)
- dv_tooltip (flutter package)
- dv_brush (flutter package)
- dv_drag (flutter package)
- dv_zoom (flutter package)
- dv_bounds (flutter package)
- dv_responsive (flutter package)
- dv_xychart (flutter package)
- dv_heatmap (flutter package)
- dv_network (flutter package)
- dv_threshold (flutter package)
- dv_mock_data (flutter package)
- data_visualization (flutter package - umbrella)

Create examples/showcase_app (flutter app)

### 3. Setup dependencies in pubspec.yaml for each package following this pattern:
- dv_vendor: no deps
- dv_point: no deps
- dv_scale: depends on dv_vendor, dv_point
- dv_curve: depends on dv_point
- dv_shape: depends on dv_point, dv_scale, dv_curve
- etc. (follow layer dependencies from plan)

### 4. Create shared analysis_options.yaml

### 5. Verify: `melos bootstrap` works

---

## M1: dv_vendor package

Port d3-array and d3-interpolate to packages/dv_vendor/

**Implement:**
- lib/src/array.dart: min, max, extent, sum, mean, median, quantile, histogram
- lib/src/bisect.dart: bisectLeft, bisectRight
- lib/src/interpolate.dart: interpolateNumber, interpolateRgb, interpolateNumberArray
- test/: tests with >80% coverage

**Verify:** `cd packages/dv_vendor && dart test`

---

## M2: dv_point package

Implement packages/dv_point/

**Implement:**
```dart
class Point {
  final double x, y;
  Point operator +(Point other);
  Point operator -(Point other);
  Point operator *(double scalar);
  double distanceTo(Point other);
}
```

**Verify:** `cd packages/dv_point && dart test`

---

## M3: dv_scale package

Port d3-scale to packages/dv_scale/

**Implement:**
- LinearScale, PowerScale, LogScale, SymlogScale, TimeScale
- BandScale, PointScale, OrdinalScale
- QuantizeScale, QuantileScale, ThresholdScale
- SequentialScale, DivergingScale
- ticks(), tickFormat()

**Verify:** `cd packages/dv_scale && dart test`

---

## M4: dv_curve package

Port d3-shape curves to packages/dv_curve/

**Implement:**
- CurveLinear, CurveStep, CurveBasis, CurveCardinal
- CurveCatmullRom, CurveMonotoneX, CurveMonotoneY, CurveNatural

**Verify:** `cd packages/dv_curve && dart test`

---

## M5: dv_geo_core package

Port d3-geo (pure Dart) to packages/dv_geo_core/

**Implement:**
- Projections: Equirectangular, Mercator, Albers, Orthographic
- GeoJSON parsing
- GeoPath generator

**Verify:** `cd packages/dv_geo_core && dart test`

---

## M6-M9: Continue for remaining packages

Follow same pattern for:
- dv_delaunay, dv_voronoi, dv_stats, dv_hierarchy
- dv_group, dv_shape, dv_glyph, dv_gradient, dv_pattern, dv_clip_path, dv_marker, dv_text
- dv_axis, dv_grid, dv_legend, dv_annotation, dv_geo
- dv_event, dv_tooltip, dv_brush, dv_drag, dv_zoom
- dv_bounds, dv_responsive
- dv_xychart, dv_heatmap, dv_network, dv_threshold
- dv_mock_data

---

## M10: data_visualization umbrella package

Create packages/data_visualization/lib/data_visualization.dart:
```dart
export 'package:dv_vendor/dv_vendor.dart';
export 'package:dv_point/dv_point.dart';
export 'package:dv_scale/dv_scale.dart';
// ... export all packages
```

---

## M11: Showcase app

Create examples/showcase_app with demo screens for:
- Line chart
- Bar chart
- Area chart
- Pie chart
- Geo map
- Interactive chart with tooltip

---

## Final verification

Run from repo root:
- `melos bootstrap`
- `melos analyze`
- `melos test`
- `cd examples/showcase_app && flutter run`

---

## Reference implementations

Port algorithms from:
- d3-array: https://github.com/d3/d3-array
- d3-scale: https://github.com/d3/d3-scale
- d3-shape: https://github.com/d3/d3-shape
- d3-geo: https://github.com/d3/d3-geo
- visx: https://github.com/airbnb/visx

Match TypeScript API naming where possible.