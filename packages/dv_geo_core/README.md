# dv_geo_core

Core geographic utilities and GeoJSON parsing

Part of the [data_visualization](https://pub.dev/packages/data_visualization) package suite.

📚 **[Live Examples](https://gsmlg-app.github.io/data_visualization/)** | **[Documentation](https://gsmlg-app.github.io/data_visualization/#/docs)**

## Overview

Provides core geographic utilities including GeoJSON parsing, coordinate transformations, and geographic data structures.

## Features

- GeoJSON parsing
- Feature collections
- Geometry types (Point, LineString, Polygon)
- Coordinate systems
- Properties handling

## Installation

```yaml
dependencies:
  dv_geo_core: ^1.1.0
```

## Usage

import 'package:dv_geo_core/dv_geo_core.dart';
import 'dart:convert';

// Parse GeoJSON
final geoJson = GeoJsonFeatureCollection.fromJson(
  jsonDecode(geoJsonString),
);

// Access features
for (final feature in geoJson.features) {
  print('Type: ${feature.geometry.type}');
  print('Name: ${feature.properties?['name']}');
}


## Documentation

For complete API documentation and interactive examples, visit:
- [Interactive Gallery](https://gsmlg-app.github.io/data_visualization/)
- [API Reference](https://pub.dev/documentation/dv_geo_core/latest/)

## Related Packages

This package is part of the data_visualization suite. See all packages at [pub.dev/publishers/gsmlg.dev](https://pub.dev/publishers/gsmlg.dev/packages).

## License

MIT License - see [LICENSE](LICENSE) for details.
