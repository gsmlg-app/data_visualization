# dv_drag

Drag interactions for movable elements

Part of the [data_visualization](https://pub.dev/packages/data_visualization) package suite.

📚 **[Live Examples](https://gsmlg-app.github.io/data_visualization/)** | **[Documentation](https://gsmlg-app.github.io/data_visualization/#/docs)**

## Overview

Provides drag interactions for movable elements, useful for dragging nodes in network graphs or adjusting positions.

## Features

- Drag gesture handling
- Constrained dragging
- Drag events
- Multi-touch support

## Installation

```yaml
dependencies:
  dv_drag: ^1.1.0
```

## Usage

import 'package:dv_drag/dv_drag.dart';

Drag(
  onDragStart: (event) => print('Drag started'),
  onDrag: (event) {
    setState(() {
      node.x = event.x;
      node.y = event.y;
    });
  },
  onDragEnd: (event) => print('Drag ended'),
  child: Container(
    width: 40,
    height: 40,
    decoration: BoxDecoration(
      color: Colors.blue,
      shape: BoxShape.circle,
    ),
  ),
)


## Documentation

For complete API documentation and interactive examples, visit:
- [Interactive Gallery](https://gsmlg-app.github.io/data_visualization/)
- [API Reference](https://pub.dev/documentation/dv_drag/latest/)

## Related Packages

This package is part of the data_visualization suite. See all packages at [pub.dev/publishers/gsmlg.dev](https://pub.dev/publishers/gsmlg.dev/packages).

## License

MIT License - see [LICENSE](LICENSE) for details.
