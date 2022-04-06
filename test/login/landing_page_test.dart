import 'package:flutter/material.dart';
import 'package:flutter_shop/login/landing_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('landing page render', (WidgetTester tester) async {
    // Build our app and trigger a frame.

    // Widget testWidget = MediaQuery(
    //   data: const MediaQueryData(),
    //   child: const MaterialApp(home: LandingScreen())

    await tester.pumpWidget(const MaterialApp(home: LandingScreen()));

    // Verify that our counter starts at 0.
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Sign up'), findsOneWidget);
  });
}
