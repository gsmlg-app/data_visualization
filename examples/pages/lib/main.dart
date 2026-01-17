import 'package:flutter/material.dart';

import 'examples/scales_example.dart';
import 'examples/curves_example.dart';
import 'examples/line_chart_example.dart';
import 'examples/bar_chart_example.dart';
import 'examples/area_chart_example.dart';
import 'examples/pie_chart_example.dart';
import 'examples/scatter_chart_example.dart';
import 'examples/geo_map_example.dart';
import 'examples/hierarchy_example.dart';
import 'examples/heatmap_example.dart';
import 'examples/interactive_example.dart';
import 'examples/delaunay_voronoi_example.dart';

void main() {
  runApp(const DataVisualizationShowcase());
}

class DataVisualizationShowcase extends StatelessWidget {
  const DataVisualizationShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Visualization',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class ExampleCategory {
  final String name;
  final IconData icon;
  final List<ExampleItem> items;

  const ExampleCategory({
    required this.name,
    required this.icon,
    required this.items,
  });
}

class ExampleItem {
  final String title;
  final String description;
  final Widget Function() builder;

  const ExampleItem({
    required this.title,
    required this.description,
    required this.builder,
  });
}

final categories = [
  ExampleCategory(
    name: 'Core',
    icon: Icons.settings,
    items: [
      ExampleItem(
        title: 'Scales',
        description: 'Linear, log, band, ordinal scales',
        builder: () => const ScalesExample(),
      ),
      ExampleItem(
        title: 'Curves',
        description: 'Curve interpolation algorithms',
        builder: () => const CurvesExample(),
      ),
    ],
  ),
  ExampleCategory(
    name: 'Charts',
    icon: Icons.bar_chart,
    items: [
      ExampleItem(
        title: 'Line Chart',
        description: 'Line chart with smooth curves',
        builder: () => const LineChartExample(),
      ),
      ExampleItem(
        title: 'Bar Chart',
        description: 'Grouped bar chart',
        builder: () => const BarChartExample(),
      ),
      ExampleItem(
        title: 'Area Chart',
        description: 'Stacked area chart',
        builder: () => const AreaChartExample(),
      ),
      ExampleItem(
        title: 'Pie Chart',
        description: 'Donut/pie chart',
        builder: () => const PieChartExample(),
      ),
      ExampleItem(
        title: 'Scatter Chart',
        description: 'Scatter plot with points',
        builder: () => const ScatterChartExample(),
      ),
    ],
  ),
  ExampleCategory(
    name: 'Geographic',
    icon: Icons.public,
    items: [
      ExampleItem(
        title: 'World Map',
        description: 'Map projections and GeoJSON',
        builder: () => const GeoMapExample(),
      ),
    ],
  ),
  ExampleCategory(
    name: 'Hierarchical',
    icon: Icons.account_tree,
    items: [
      ExampleItem(
        title: 'Treemap',
        description: 'Hierarchical treemap layout',
        builder: () => const HierarchyExample(),
      ),
    ],
  ),
  ExampleCategory(
    name: 'Specialized',
    icon: Icons.auto_awesome,
    items: [
      ExampleItem(
        title: 'Heatmap',
        description: 'Color-coded matrix',
        builder: () => const HeatmapExample(),
      ),
      ExampleItem(
        title: 'Delaunay/Voronoi',
        description: 'Triangulation and diagrams',
        builder: () => const DelaunayVoronoiExample(),
      ),
    ],
  ),
  ExampleCategory(
    name: 'Interactive',
    icon: Icons.touch_app,
    items: [
      ExampleItem(
        title: 'Interactive Chart',
        description: 'Hover, tooltips, and brush',
        builder: () => const InteractiveExample(),
      ),
    ],
  ),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ExampleItem? _selectedExample;

  @override
  void initState() {
    super.initState();
    _selectedExample = categories.first.items.first;
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.auto_graph, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 12),
            const Text('Data Visualization'),
          ],
        ),
      ),
      drawer: isWide ? null : _buildDrawer(),
      body: Row(
        children: [
          if (isWide)
            SizedBox(
              width: 280,
              child: _buildNavigation(),
            ),
          Expanded(
            child: _buildContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: _buildNavigation(),
    );
  }

  Widget _buildNavigation() {
    return Container(
      color: Theme.of(context).colorScheme.surfaceContainerLow,
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Examples',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          for (final category in categories) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                children: [
                  Icon(
                    category.icon,
                    size: 18,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    category.name,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            ),
            for (final item in category.items)
              ListTile(
                dense: true,
                selected: _selectedExample == item,
                selectedTileColor:
                    Theme.of(context).colorScheme.primaryContainer,
                title: Text(item.title),
                subtitle: Text(
                  item.description,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                onTap: () {
                  setState(() => _selectedExample = item);
                  if (!MediaQuery.of(context).size.width.isFinite ||
                      MediaQuery.of(context).size.width <= 800) {
                    Navigator.of(context).pop();
                  }
                },
              ),
          ],
        ],
      ),
    );
  }

  Widget _buildContent() {
    if (_selectedExample == null) {
      return const Center(
        child: Text('Select an example from the sidebar'),
      );
    }

    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _selectedExample!.title,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  _selectedExample!.description,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: _selectedExample!.builder(),
          ),
        ],
      ),
    );
  }
}
