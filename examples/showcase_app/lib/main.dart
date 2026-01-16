import 'package:flutter/material.dart';
import 'screens/line_chart_screen.dart';
import 'screens/bar_chart_screen.dart';
import 'screens/area_chart_screen.dart';
import 'screens/pie_chart_screen.dart';
import 'screens/geo_map_screen.dart';
import 'screens/interactive_chart_screen.dart';

void main() {
  runApp(const ShowcaseApp());
}

class ShowcaseApp extends StatelessWidget {
  const ShowcaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Visualization Showcase',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Visualization Showcase'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildDemoCard(
            context,
            'Line Chart',
            'Interactive line chart with multiple series',
            Icons.show_chart,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const LineChartScreen()),
            ),
          ),
          _buildDemoCard(
            context,
            'Bar Chart',
            'Grouped and stacked bar charts',
            Icons.bar_chart,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const BarChartScreen()),
            ),
          ),
          _buildDemoCard(
            context,
            'Area Chart',
            'Stacked area chart with smooth curves',
            Icons.area_chart,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AreaChartScreen()),
            ),
          ),
          _buildDemoCard(
            context,
            'Pie Chart',
            'Pie and donut charts with labels',
            Icons.pie_chart,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const PieChartScreen()),
            ),
          ),
          _buildDemoCard(
            context,
            'Geo Map',
            'Geographic visualization with projections',
            Icons.map,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const GeoMapScreen()),
            ),
          ),
          _buildDemoCard(
            context,
            'Interactive Chart',
            'Chart with tooltip and brush selection',
            Icons.touch_app,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const InteractiveChartScreen()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDemoCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, size: 40, color: Theme.of(context).primaryColor),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
