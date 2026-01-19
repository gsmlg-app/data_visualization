import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pages/main.dart';

void main() {
  testWidgets('DataVisualizationApp renders gallery', (WidgetTester tester) async {
    // Set a large enough window size to show the gallery
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(const DataVisualizationApp());
    await tester.pumpAndSettle();

    // Verify that the app title is displayed
    expect(find.text('Data Visualization'), findsOneWidget);

    // Reset the view
    addTearDown(() => tester.view.resetPhysicalSize());
  });
}
