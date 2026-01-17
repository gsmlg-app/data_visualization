import 'package:flutter_test/flutter_test.dart';
import 'package:pages/main.dart';

void main() {
  testWidgets('DataVisualizationShowcase renders navigation', (WidgetTester tester) async {
    await tester.pumpWidget(const DataVisualizationShowcase());

    // Verify that the app title is displayed
    expect(find.text('Data Visualization'), findsOneWidget);

    // Verify that category headers are present
    expect(find.text('Core'), findsOneWidget);
    expect(find.text('Charts'), findsOneWidget);
  });
}
