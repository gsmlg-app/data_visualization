# dv_gradient

Gradient utilities for fills and strokes

Part of the [data_visualization](https://pub.dev/packages/data_visualization) package suite.

📚 **[Live Examples](https://gsmlg-app.github.io/data_visualization/)** | **[Documentation](https://gsmlg-app.github.io/data_visualization/#/docs)**

## Overview

Provides utilities for creating and manipulating gradients including linear gradients, radial gradients, and color interpolation.

## Features

- Linear gradients
- Radial gradients
- Color interpolation
- Gradient stops
- Shader creation

## Installation

```yaml
dependencies:
  dv_gradient: ^1.1.0
```

## Usage

import 'package:dv_gradient/dv_gradient.dart';
import 'package:flutter/material.dart';

// Create linear gradient
final gradient = linearGradient(
  colors: [Colors.blue, Colors.green, Colors.yellow],
  stops: [0, 0.5, 1],
);

final paint = Paint()
  ..shader = gradient.createShader(Rect.fromLTWH(0, 0, 200, 100));

canvas.drawRect(rect, paint);

// Create radial gradient
final radial = radialGradient(
  colors: [Colors.white, Colors.blue],
  stops: [0, 1],
);


## Documentation

For complete API documentation and interactive examples, visit:
- [Interactive Gallery](https://gsmlg-app.github.io/data_visualization/)
- [API Reference](https://pub.dev/documentation/dv_gradient/latest/)

## Related Packages

This package is part of the data_visualization suite. See all packages at [pub.dev/publishers/gsmlg.dev](https://pub.dev/publishers/gsmlg.dev/packages).

## License

MIT License - see [LICENSE](LICENSE) for details.
