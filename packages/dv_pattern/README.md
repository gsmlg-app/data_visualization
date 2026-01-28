# dv_pattern

Pattern fills for visualizations

Part of the [data_visualization](https://pub.dev/packages/data_visualization) package suite.

📚 **[Live Examples](https://gsmlg-app.github.io/data_visualization/)** | **[Documentation](https://gsmlg-app.github.io/data_visualization/#/docs)**

## Overview

Provides pattern fills like stripes, dots, and grids for chart backgrounds and fills.

## Features

- Stripe patterns
- Dot patterns
- Grid patterns
- Custom pattern support

## Installation

```yaml
dependencies:
  dv_pattern: ^1.1.0
```

## Usage

import 'package:dv_pattern/dv_pattern.dart';
import 'package:flutter/material.dart';

// Create stripe pattern
final pattern = PatternStripes(
  color: Colors.blue,
  spacing: 5,
  angle: 45,
);

// Use as paint shader
final paint = Paint()..shader = pattern.createShader(bounds);


## Documentation

For complete API documentation and interactive examples, visit:
- [Interactive Gallery](https://gsmlg-app.github.io/data_visualization/)
- [API Reference](https://pub.dev/documentation/dv_pattern/latest/)

## Related Packages

This package is part of the data_visualization suite. See all packages at [pub.dev/publishers/gsmlg.dev](https://pub.dev/publishers/gsmlg.dev/packages).

## License

MIT License - see [LICENSE](LICENSE) for details.
