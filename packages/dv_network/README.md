# dv_network

Network graph and force-directed layout

Part of the [data_visualization](https://pub.dev/packages/data_visualization) package suite.

📚 **[Live Examples](https://gsmlg-app.github.io/data_visualization/)** | **[Documentation](https://gsmlg-app.github.io/data_visualization/#/docs)**

## Overview

Provides network graph visualization with force-directed layout including node and edge rendering with interactive dragging.

## Features

- Force-directed layout
- Node dragging
- Edge rendering
- Customizable forces
- Interactive simulation

## Installation

```yaml
dependencies:
  dv_network: ^1.1.0
```

## Usage

import 'package:dv_network/dv_network.dart';
import 'package:flutter/material.dart';

final nodes = [
  Node(id: 'A', data: {'label': 'Node A'}),
  Node(id: 'B', data: {'label': 'Node B'}),
  Node(id: 'C', data: {'label': 'Node C'}),
];

final edges = [
  Edge(source: 'A', target: 'B'),
  Edge(source: 'B', target: 'C'),
];

NetworkGraph(
  nodes: nodes,
  edges: edges,
  nodeBuilder: (node) => CircleAvatar(
    backgroundColor: Colors.blue,
    child: Text(node.data['label']),
  ),
  width: 500,
  height: 400,
)


## Documentation

For complete API documentation and interactive examples, visit:
- [Interactive Gallery](https://gsmlg-app.github.io/data_visualization/)
- [API Reference](https://pub.dev/documentation/dv_network/latest/)

## Related Packages

This package is part of the data_visualization suite. See all packages at [pub.dev/publishers/gsmlg.dev](https://pub.dev/publishers/gsmlg.dev/packages).

## License

MIT License - see [LICENSE](LICENSE) for details.
