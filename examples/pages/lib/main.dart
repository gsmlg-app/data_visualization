import 'package:flutter/material.dart';

import 'shell/app_shell.dart';
import 'gallery/theme_provider.dart';

void main() {
  runApp(const DataVisualizationApp());
}

class DataVisualizationApp extends StatefulWidget {
  const DataVisualizationApp({super.key});

  @override
  State<DataVisualizationApp> createState() => _DataVisualizationAppState();
}

class _DataVisualizationAppState extends State<DataVisualizationApp> {
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
          title: 'Data Visualization',
          debugShowCheckedModeBanner: false,
          theme: GalleryTheme.lightTheme,
          darkTheme: GalleryTheme.darkTheme,
          themeMode: _themeNotifier.themeMode,
          home: AppShell(themeNotifier: _themeNotifier),
        );
      },
    );
  }
}
