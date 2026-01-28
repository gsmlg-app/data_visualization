# dv_voronoi

Voronoi diagram generation

Part of the [data_visualization](https://pub.dev/packages/data_visualization) package suite.

📚 **[Live Examples](https://gsmlg-app.github.io/data_visualization/)** | **[Documentation](https://gsmlg-app.github.io/data_visualization/#/docs)**

## Overview

Generates Voronoi diagrams from a set of points. A Voronoi diagram partitions space into regions where each region contains all points closest to a particular seed point. Built on top of Delaunay triangulation.

## Features

- Voronoi cell generation
- Bounded diagrams
- Cell polygon extraction
- Neighbor queries

## Installation

```yaml
dependencies:
  dv_voronoi: ^1.1.0
```

## Usage

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


## Documentation

For complete API documentation and interactive examples, visit:
- [Interactive Gallery](https://gsmlg-app.github.io/data_visualization/)
- [API Reference](https://pub.dev/documentation/dv_voronoi/latest/)

## Related Packages

This package is part of the data_visualization suite. See all packages at [pub.dev/publishers/gsmlg.dev](https://pub.dev/publishers/gsmlg.dev/packages).

## License

MIT License - see [LICENSE](LICENSE) for details.
