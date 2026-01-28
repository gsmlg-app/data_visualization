# dv_event

Event handling for chart interactions

Part of the [data_visualization](https://pub.dev/packages/data_visualization) package suite.

📚 **[Live Examples](https://gsmlg-app.github.io/data_visualization/)** | **[Documentation](https://gsmlg-app.github.io/data_visualization/#/docs)**

## Overview

Provides event handling utilities for chart interactions including hit testing, event dispatching, and gesture handling.

## Features

- Hit testing
- Event dispatching
- Gesture handling
- Event bubbling
- Custom events

## Installation

```yaml
dependencies:
  dv_event: ^1.1.0
```

## Usage

import 'package:dv_event/dv_event.dart';

final dispatcher = EventDispatcher();

// Register event listener
dispatcher.on('hover', (event) {
  print('Hovered: ${event.data}');
});

// Dispatch event
dispatcher.dispatch('hover', data: {'x': 100, 'y': 50});


## Documentation

For complete API documentation and interactive examples, visit:
- [Interactive Gallery](https://gsmlg-app.github.io/data_visualization/)
- [API Reference](https://pub.dev/documentation/dv_event/latest/)

## Related Packages

This package is part of the data_visualization suite. See all packages at [pub.dev/publishers/gsmlg.dev](https://pub.dev/publishers/gsmlg.dev/packages).

## License

MIT License - see [LICENSE](LICENSE) for details.
