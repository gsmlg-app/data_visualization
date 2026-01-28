# dv_point

2D Point class with vector operations and utilities

Part of the [data_visualization](https://pub.dev/packages/data_visualization) package suite.

📚 **[Live Examples](https://gsmlg-app.github.io/data_visualization/)** | **[Documentation](https://gsmlg-app.github.io/data_visualization/#/docs)**

## Overview

The dv_point package provides a simple Point class representing 2D coordinates. It includes utility methods for common operations like distance calculation, interpolation, and vector operations.

## Features

- 2D point representation with x and y coordinates
- Distance calculations
- Linear interpolation (lerp)
- Vector operations
- Conversion to/from Offset

## Installation

```yaml
dependencies:
  dv_point: ^1.1.0
```

## Usage

import 'package:dv_point/dv_point.dart';

final p1 = Point(0, 0);
final p2 = Point(10, 10);

// Calculate distance
final distance = p1.distanceTo(p2); // ~14.14

// Interpolate between points
final midpoint = p1.lerp(p2, 0.5); // Point(5, 5)

// Convert to Offset
final offset = p1.toOffset();


## Documentation

For complete API documentation and interactive examples, visit:
- [Interactive Gallery](https://gsmlg-app.github.io/data_visualization/)
- [API Reference](https://pub.dev/documentation/dv_point/latest/)

## Related Packages

This package is part of the data_visualization suite. See all packages at [pub.dev/publishers/gsmlg.dev](https://pub.dev/publishers/gsmlg.dev/packages).

## License

MIT License - see [LICENSE](LICENSE) for details.
