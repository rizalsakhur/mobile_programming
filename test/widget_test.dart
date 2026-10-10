import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/pages/control_flow.dart';

void main() {
  testWidgets('home shows only this week and opens Control Flow', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Daftar Materi Mobile Programming'), findsOneWidget);
    expect(find.text('Control Flow'), findsOneWidget);
    expect(find.text('Percabangan'), findsNothing);
    expect(find.text('Minggu 2'), findsNothing);

    await tester.tap(find.text('Control Flow'));
    await tester.pumpAndSettle();

    expect(find.text('Praktik Control Flow'), findsOneWidget);
    expect(find.text('If dan Else'), findsOneWidget);
  });

  testWidgets('Control Flow page shows explanations, code, and output', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: ControlFlowPage()));

    expect(find.text('If dan Else'), findsOneWidget);
    expect(
      find.textContaining(
        'If Else merupakan struktur kontrol yang memungkinkan eksekusi kode '
        'berdasarkan kondisi yang diberikan.',
      ),
      findsOneWidget,
    );
    expect(find.textContaining('print("Hari ini Libur");'), findsOneWidget);
    expect(find.text('Hari ini Libur'), findsOneWidget);
    expect(find.text('Praktik mahasiswa'), findsNothing);
    expect(find.text('Latihan dari materi'), findsNothing);

    await tester.tap(find.byType(SwitchListTile));
    await tester.pump();
    expect(find.text('Hari ini Tidak Libur'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('Switch-case'),
      300,
      scrollable: find.byType(Scrollable).last,
    );
    expect(find.text('Hasil praktik untuk nilai = B:'), findsOneWidget);
    expect(find.text('Baik'), findsOneWidget);
  });
}
