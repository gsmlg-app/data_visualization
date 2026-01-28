# dv_axis

Axis components with ticks and labels

Part of the [data_visualization](https://pub.dev/packages/data_visualization) package suite.

📚 **[Live Examples](https://gsmlg-app.github.io/data_visualization/)** | **[Documentation](https://gsmlg-app.github.io/data_visualization/#/docs)**

## Overview

Provides axis components for charts with customizable ticks, labels, and grid lines for both horizontal and vertical axes.

## Features

- Horizontal and vertical axes
- Customizable tick count
- Label formatting
- Tick size and padding
- Grid line support

## Installation

```yaml
dependencies:
  dv_axis: ^1.1.0
```

## Usage

import 'package:dv_axis/dv_axis.dart';
import 'package:dv_scale/dv_scale.dart';

final xScale = scaleLinear(
  domain: [0, 100],
  range: [0, 400],
);

final xAxis = Axis(
  scale: xScale,
  orientation: AxisOrientation.bottom,
  tickCount: 10,
  tickFormat: (value) => '${value.toInt()}%',
)


## Documentation

For complete API documentation and interactive examples, visit:
- [Interactive Gallery](https://gsmlg-app.github.io/data_visualization/)
- [API Reference](https://pub.dev/documentation/dv_axis/latest/)

## Related Packages

This package is part of the data_visualization suite. See all packages at [pub.dev/publishers/gsmlg.dev](https://pub.dev/publishers/gsmlg.dev/packages).

## License

MIT License - see [LICENSE](LICENSE) for details.
