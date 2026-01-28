# dv_marker

Line markers and arrows

Part of the [data_visualization](https://pub.dev/packages/data_visualization) package suite.

📚 **[Live Examples](https://gsmlg-app.github.io/data_visualization/)** | **[Documentation](https://gsmlg-app.github.io/data_visualization/#/docs)**

## Overview

Provides markers for line endpoints including arrows, dots, and custom markers.

## Features

- Arrow markers
- Dot markers
- Custom marker support
- Marker positioning

## Installation

```yaml
dependencies:
  dv_marker: ^1.1.0
```

## Usage

import 'package:dv_marker/dv_marker.dart';
import 'package:flutter/material.dart';

// Create arrow marker
final arrow = MarkerArrow(
  size: 10,
  color: Colors.black,
);

// Apply to line endings
// (Typically used with dv_annotation or custom line drawing)


## Documentation

For complete API documentation and interactive examples, visit:
- [Interactive Gallery](https://gsmlg-app.github.io/data_visualization/)
- [API Reference](https://pub.dev/documentation/dv_marker/latest/)

## Related Packages

This package is part of the data_visualization suite. See all packages at [pub.dev/publishers/gsmlg.dev](https://pub.dev/publishers/gsmlg.dev/packages).

## License

MIT License - see [LICENSE](LICENSE) for details.
