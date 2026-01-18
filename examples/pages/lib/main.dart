import 'package:flutter/material.dart';

import 'gallery/gallery_home.dart';
import 'gallery/theme_provider.dart';

void main() {
  runApp(const DataVisualizationGallery());
}

class DataVisualizationGallery extends StatefulWidget {
  const DataVisualizationGallery({super.key});

  @override
  State<DataVisualizationGallery> createState() =>
      _DataVisualizationGalleryState();
}

class _DataVisualizationGalleryState extends State<DataVisualizationGallery> {
  final _themeNotifier = ThemeModeNotifier();

  @override
  void dispose() {
    _themeNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _themeNotifier,
      builder: (context, child) {
        return MaterialApp(
          title: 'Data Visualization Gallery',
          debugShowCheckedModeBanner: false,
          theme: GalleryTheme.lightTheme,
          darkTheme: GalleryTheme.darkTheme,
          themeMode: _themeNotifier.themeMode,
          home: GalleryHome(themeNotifier: _themeNotifier),
        );
      },
    );
  }
}
