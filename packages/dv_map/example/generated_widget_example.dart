import 'package:flutter/material.dart';
import 'package:dv_geo_core/dv_geo_core.dart';

// Import specific map files - each exports both data and widget
import 'package:dv_map/maps/world/110m.dart';
import 'package:dv_map/maps/asia/china/110m.dart';
import 'package:dv_map/maps/africa/nigeria/50m.dart';

void main() {
  runApp(const GeneratedWidgetExampleApp());
}

class GeneratedWidgetExampleApp extends StatelessWidget {
  const GeneratedWidgetExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Generated Map Widgets Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const GeneratedWidgetExamplePage(),
    );
  }
}

class GeneratedWidgetExamplePage extends StatefulWidget {
  const GeneratedWidgetExamplePage({super.key});

  @override
  State<GeneratedWidgetExamplePage> createState() =>
      _GeneratedWidgetExamplePageState();
}

class _GeneratedWidgetExamplePageState
    extends State<GeneratedWidgetExamplePage> {
  String? _selectedFeature;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generated Map Widgets'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          if (_selectedFeature != null)
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.blue.shade50,
              child: Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.blue),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Selected: $_selectedFeature',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      setState(() {
                        _selectedFeature = null;
                      });
                    },
                  ),
                ],
              ),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: _buildMapView(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            _selectedFeature = null;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            label: 'World',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'China',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.landscape),
            label: 'Nigeria',
          ),
        ],
      ),
    );
  }

  Widget _buildMapView() {
    switch (_selectedIndex) {
      case 0:
        return _buildWorldMap();
      case 1:
        return _buildChinaMap();
      case 2:
        return _buildNigeriaMap();
      default:
        return _buildWorldMap();
    }
  }

  Widget _buildWorldMap() {
    // Use the generated World110mWidget from world/110m.dart
    return World110mWidget(
      projection: MercatorProjection(),
      fillColor: Colors.blue.shade100,
      strokeColor: Colors.blue.shade700,
      strokeWidth: 0.5,
      onFeatureTap: (feature, position) {
        setState(() {
          _selectedFeature =
              feature.properties!['name'] as String? ?? 'Unknown';
        });
      },
    );
  }

  Widget _buildChinaMap() {
    // Use the generated AsiaChina110mWidget from asia/china/110m.dart
    return AsiaChina110mWidget(
      projection: MercatorProjection(),
      fillColor: Colors.red.shade200,
      strokeColor: Colors.red.shade900,
      strokeWidth: 2.0,
      onFeatureTap: (feature, position) {
        setState(() {
          _selectedFeature = 'China';
        });
      },
    );
  }

  Widget _buildNigeriaMap() {
    // Use the generated AfricaNigeria50mWidget from africa/nigeria/50m.dart
    return AfricaNigeria50mWidget(
      projection: MercatorProjection(),
      fillColor: Colors.green.shade300,
      strokeColor: Colors.green.shade700,
      strokeWidth: 2.0,
      onFeatureTap: (feature, position) {
        setState(() {
          _selectedFeature = 'Nigeria';
        });
      },
    );
  }
}
