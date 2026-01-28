# dv_geo

Geographic projections and map rendering

Part of the [data_visualization](https://pub.dev/packages/data_visualization) package suite.

📚 **[Live Examples](https://gsmlg-app.github.io/data_visualization/)** | **[Documentation](https://gsmlg-app.github.io/data_visualization/#/docs)**

## Overview

Provides geographic projections and map rendering capabilities with support for GeoJSON parsing and various map projections.

## Features

- Mercator projection
- Orthographic projection
- Equirectangular projection
- Albers projection
- GeoPath generator
- Projection transforms

## Installation

```yaml
dependencies:
  dv_geo: ^1.1.0
```

## Usage

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


## Documentation

For complete API documentation and interactive examples, visit:
- [Interactive Gallery](https://gsmlg-app.github.io/data_visualization/)
- [API Reference](https://pub.dev/documentation/dv_geo/latest/)

## Related Packages

This package is part of the data_visualization suite. See all packages at [pub.dev/publishers/gsmlg.dev](https://pub.dev/publishers/gsmlg.dev/packages).

## License

MIT License - see [LICENSE](LICENSE) for details.
