import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:exam/main.dart';

void main() {
  testWidgets('App loads with Lily House title', (WidgetTester tester) async {
    final oldOnError = FlutterError.onError;
    FlutterError.onError = (details) {
      if (details.exception is NetworkImageLoadException) return;
      oldOnError?.call(details);
    };

    await tester.pumpWidget(const MyApp());
    expect(find.text('Lily House'), findsOneWidget);

    FlutterError.onError = oldOnError;
  });
}
