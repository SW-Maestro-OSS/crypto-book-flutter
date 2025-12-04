// Basic Flutter widget test for Crypto Book

import 'package:flutter_test/flutter_test.dart';
import 'package:crypto_book/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that app starts (basic test)
    expect(find.byType(MyApp), findsOneWidget);
  });
}
