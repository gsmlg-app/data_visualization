# dv_mock_data

Mock data generators for testing and demos

Part of the [data_visualization](https://pub.dev/packages/data_visualization) package suite.

📚 **[Live Examples](https://gsmlg-app.github.io/data_visualization/)** | **[Documentation](https://gsmlg-app.github.io/data_visualization/#/docs)**

## Overview

Provides comprehensive mock data generators for testing and examples. Includes generators for various chart types and statistical distributions.

## Features

- Chart-specific data generators (scatter, line, bar, pie)
- Statistical distributions (normal, exponential, poisson)
- Time series patterns (trends, seasonality, random walk)
- Network and hierarchical data
- Geographic data
- Reproducible with seeds

## Installation

```yaml
dependencies:
  dv_mock_data: ^1.1.0
```

## Usage

import 'package:dv_mock_data/dv_mock_data.dart';

// Create generator with seed for reproducibility
final mock = MockData(42);

// Generate scatter data with correlation
final scatter = mock.scatterData(count: 100, correlation: 0.7);

// Generate time series
final timeSeries = mock.timeSeries.stockPrice(
  start: DateTime.now().subtract(Duration(days: 365)),
  end: DateTime.now(),
  startPrice: 100,
  volatility: 0.3,
);

// Generate network data
final network = mock.networkData(
  nodeCount: 30,
  linkProbability: 0.15,
);

// Use random distributions
final random = mock.random;
final values = random.normalList(100, mean: 50, stdDev: 10);


## Documentation

For complete API documentation and interactive examples, visit:
- [Interactive Gallery](https://gsmlg-app.github.io/data_visualization/)
- [API Reference](https://pub.dev/documentation/dv_mock_data/latest/)

## Related Packages

This package is part of the data_visualization suite. See all packages at [pub.dev/publishers/gsmlg.dev](https://pub.dev/publishers/gsmlg.dev/packages).

## License

MIT License - see [LICENSE](LICENSE) for details.
