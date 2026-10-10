import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('background image appears on home and login pages', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    const backgroundImage = AssetImage('asset/bg_app.jpg');
    expect(find.image(backgroundImage), findsOneWidget);
    expect(find.text('Nama: Donald Trump'), findsOneWidget);

    await tester.tap(find.text('Login').first);
    await tester.pumpAndSettle();

    expect(find.image(backgroundImage), findsOneWidget);
    expect(find.text('Username'), findsOneWidget);
  });
}
