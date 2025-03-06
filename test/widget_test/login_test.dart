import 'package:fanpulse/features/auth/presentation/view/login_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Login Screen UI Tests', () {
    testWidgets('Email field is present', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: LoginScreen(),
      ));
      expect(find.text('Email'), findsOneWidget);
    });

    testWidgets('Password field is present', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: LoginScreen(),
      ));
      expect(find.text('Password'), findsOneWidget);
    });

    testWidgets('Login button is present', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: LoginScreen(),
      ));
      expect(find.text('LOG IN'), findsOneWidget);
    });

    testWidgets('Forgot Password button is present',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: LoginScreen(),
      ));
      expect(find.text('Forgot Password?'), findsOneWidget);
    });

    testWidgets('Register text is present', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: LoginScreen(),
      ));
      expect(find.text("Don't have an account?"), findsOneWidget);
      expect(find.text('Register'), findsOneWidget);
    });
  });
}
