import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:praktikum_9/main.dart';

void main() {
  testWidgets('Image Picker UI elements test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Latihan Memilih Gambar'), findsOneWidget);
    expect(find.byIcon(Icons.image_outlined), findsOneWidget);
    expect(find.text('Camera'), findsOneWidget);
    expect(find.text('Gallery'), findsOneWidget);
    expect(find.text('Hapus Gambar'), findsOneWidget);

    await tester.tap(find.text('Camera'));
    await tester.pumpAndSettle();

    // Verifies that navigation to the CameraScreen occurred
    expect(find.text('Camera Example'), findsOneWidget);
  });
}
