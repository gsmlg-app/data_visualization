# dv_vendor

Shared utilities and common dependencies

Part of the [data_visualization](https://pub.dev/packages/data_visualization) package suite.

📚 **[Live Examples](https://gsmlg-app.github.io/data_visualization/)** | **[Documentation](https://gsmlg-app.github.io/data_visualization/#/docs)**

## Overview

Provides shared utilities and common dependencies used across the data_visualization ecosystem. Includes array operations, color utilities, math helpers, and interpolation functions.

## Features

- Array manipulation utilities
- Color interpolation
- Mathematical helpers
- Type definitions
- Common constants

## Installation

```yaml
dependencies:
  dv_vendor: ^1.1.0
```

## Usage

import 'package:dv_vendor/dv_vendor.dart';

// Array operations
final values = [1, 2, 3, 4, 5];
final sum = values.reduce((a, b) => a + b);

// Interpolation
final t = 0.5;
final interpolated = interpolateNumber(0, 100, t); // 50


## Documentation

For complete API documentation and interactive examples, visit:
- [Interactive Gallery](https://gsmlg-app.github.io/data_visualization/)
- [API Reference](https://pub.dev/documentation/dv_vendor/latest/)

## Related Packages

This package is part of the data_visualization suite. See all packages at [pub.dev/publishers/gsmlg.dev](https://pub.dev/publishers/gsmlg.dev/packages).

## License

MIT License - see [LICENSE](LICENSE) for details.
