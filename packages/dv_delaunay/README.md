# dv_delaunay

Delaunay triangulation algorithm

Part of the [data_visualization](https://pub.dev/packages/data_visualization) package suite.

📚 **[Live Examples](https://gsmlg-app.github.io/data_visualization/)** | **[Documentation](https://gsmlg-app.github.io/data_visualization/#/docs)**

## Overview

Computes Delaunay triangulation for a set of points. Delaunay triangulation maximizes the minimum angle of all triangles, avoiding skinny triangles. Useful for mesh generation and spatial analysis.

## Features

- Fast Delaunay triangulation
- Half-edge data structure
- Triangle iteration
- Spatial queries

## Installation

```yaml
dependencies:
  dv_delaunay: ^1.1.0
```

## Usage

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
  print('Triangle: ${points[a]}, ${points[b]}, ${points[c]}');
}


## Documentation

For complete API documentation and interactive examples, visit:
- [Interactive Gallery](https://gsmlg-app.github.io/data_visualization/)
- [API Reference](https://pub.dev/documentation/dv_delaunay/latest/)

## Related Packages

This package is part of the data_visualization suite. See all packages at [pub.dev/publishers/gsmlg.dev](https://pub.dev/publishers/gsmlg.dev/packages).

## License

MIT License - see [LICENSE](LICENSE) for details.
