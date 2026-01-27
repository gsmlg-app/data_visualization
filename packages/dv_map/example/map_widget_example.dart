import 'package:flutter/material.dart';
import 'package:dv_map/dv_map.dart';
import 'package:dv_geo_core/dv_geo_core.dart';

// Import specific maps for tree shaking
import 'package:dv_map/maps/world/110m.dart';
import 'package:dv_map/maps/africa/nigeria/110m.dart';

void main() {
  runApp(const MapWidgetExampleApp());
}

class MapWidgetExampleApp extends StatelessWidget {
  const MapWidgetExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Map Widget Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const MapWidgetExamplePage(),
    );
  }
}

class MapWidgetExamplePage extends StatefulWidget {
  const MapWidgetExamplePage({super.key});

  @override
  State<MapWidgetExamplePage> createState() => _MapWidgetExamplePageState();
}

class _MapWidgetExamplePageState extends State<MapWidgetExamplePage> {
  String? _selectedCountry;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Widget Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          if (_selectedCountry != null)
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.blue.shade50,
              child: Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.blue),
                  const SizedBox(width: 8),
                  Text(
                    'Selected: $_selectedCountry',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      setState(() {
                        _selectedCountry = null;
                      });
                    },
                  ),
                ],
              ),
            ),
          Expanded(
            child: _buildMapView(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            _selectedCountry = null;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            label: 'World Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Nigeria',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.layers),
            label: 'Custom Style',
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
        return _buildCountryMap();
      case 2:
        return _buildCustomStyledMap();
      default:
        return _buildWorldMap();
    }
  }

  Widget _buildWorldMap() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: WorldMapWidget(
        geoJson: world110m,
        projection: MercatorProjection(),
        onCountryTap: (country, position) {
          setState(() {
            _selectedCountry = country.properties!['name'] as String? ?? 'Unknown';
          });
        },
      ),
    );
  }

  Widget _buildCountryMap() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CountryMapWidget(
        geoJson: africaNigeria110m,
        projection: MercatorProjection(),
        fillColor: Colors.green.shade300,
        strokeColor: Colors.green.shade700,
        strokeWidth: 2.0,
        onTap: (feature, position) {
          setState(() {
            _selectedCountry = 'Nigeria';
          });
        },
      ),
    );
  }

  Widget _buildCustomStyledMap() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: MapWidget(
        geoJson: world110m,
        projection: OrthographicProjection(
          rotate: (0, -30, 0),
        ),
        fillColor: Colors.blue.shade200,
        strokeColor: Colors.blue.shade900,
        strokeWidth: 1.5,
        onFeatureTap: (feature, position) {
          setState(() {
            _selectedCountry = feature.properties!['name'] as String? ?? 'Unknown';
          });
        },
      ),
    );
  }
}
