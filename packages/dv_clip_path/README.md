# dv_clip_path

Clipping paths for visualizations

Part of the [data_visualization](https://pub.dev/packages/data_visualization) package suite.

📚 **[Live Examples](https://gsmlg-app.github.io/data_visualization/)** | **[Documentation](https://gsmlg-app.github.io/data_visualization/#/docs)**

## Overview

Provides clipping path utilities for constraining drawing regions.

## Features

- Rectangle clipping
- Circle clipping
- Path-based clipping
- Clip combining

## Installation

```yaml
dependencies:
  dv_clip_path: ^1.1.0
```

## Usage

import 'package:dv_clip_path/dv_clip_path.dart';
import 'dart:ui';

// Clip to rectangle
canvas.save();
canvas.clipRect(Rect.fromLTWH(0, 0, 200, 100));
// Draw content
canvas.restore();


## Documentation

For complete API documentation and interactive examples, visit:
- [Interactive Gallery](https://gsmlg-app.github.io/data_visualization/)
- [API Reference](https://pub.dev/documentation/dv_clip_path/latest/)

## Related Packages

This package is part of the data_visualization suite. See all packages at [pub.dev/publishers/gsmlg.dev](https://pub.dev/publishers/gsmlg.dev/packages).

## License

MIT License - see [LICENSE](LICENSE) for details.
