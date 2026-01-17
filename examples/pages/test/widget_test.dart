import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pages/main.dart';

void main() {
  testWidgets('DataVisualizationShowcase renders navigation', (WidgetTester tester) async {
    // Set a large enough window size to show the sidebar navigation
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(const DataVisualizationShowcase());
    await tester.pumpAndSettle();

    // Verify that the app title is displayed
    expect(find.text('Data Visualization'), findsOneWidget);

    // Verify that category headers are present
    expect(find.text('Core'), findsOneWidget);
    expect(find.text('Charts'), findsOneWidget);

    // Reset the view
    addTearDown(() => tester.view.resetPhysicalSize());
  });
}
