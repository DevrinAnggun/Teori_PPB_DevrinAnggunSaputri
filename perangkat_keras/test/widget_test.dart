import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tp/main.dart';

void main() {
  testWidgets('Image Picker UI elements test', (WidgetTester tester) async {
    // Ensure MyApp widget exists and doesn't throw errors during build.
    await tester.pumpWidget(MyApp());

    // Check if the app bar title is displayed correctly.
    expect(find.text('Latihan Memilih Gambar'), findsOneWidget);

    // Verify that the image icon is displayed.
    expect(find.byIcon(Icons.image_outlined), findsOneWidget);

    // Verify that the buttons (Camera, Gallery, Hapus Gambar) are present.
    expect(find.text('Camera'), findsOneWidget);
    expect(find.text('Gallery'), findsOneWidget);
    expect(find.text('Hapus Gambar'), findsOneWidget);

    // Test button taps to ensure the app doesn't throw errors during interaction.
    await tester.tap(find.text('Camera'));
    await tester.pump();

    await tester.tap(find.text('Gallery'));
    await tester.pump();

    await tester.tap(find.text('Hapus Gambar'));
    await tester.pump();
  });
}
