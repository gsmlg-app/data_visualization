# dv_bounds

Bounding box calculations and margins

Part of the [data_visualization](https://pub.dev/packages/data_visualization) package suite.

📚 **[Live Examples](https://gsmlg-app.github.io/data_visualization/)** | **[Documentation](https://gsmlg-app.github.io/data_visualization/#/docs)**

## Overview

Provides utilities for bounding box calculations and margin handling in charts.

## Features

- Margin calculation
- Bounding box utilities
- Inner bounds calculation
- Size helpers

## Installation

```yaml
dependencies:
  dv_bounds: ^1.1.0
```

## Usage

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
print('Width: ${bounds.width}'); // 420
print('Height: ${bounds.height}'); // 340


## Documentation

For complete API documentation and interactive examples, visit:
- [Interactive Gallery](https://gsmlg-app.github.io/data_visualization/)
- [API Reference](https://pub.dev/documentation/dv_bounds/latest/)

## Related Packages

This package is part of the data_visualization suite. See all packages at [pub.dev/publishers/gsmlg.dev](https://pub.dev/publishers/gsmlg.dev/packages).

## License

MIT License - see [LICENSE](LICENSE) for details.
