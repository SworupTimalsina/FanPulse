import 'package:fanpulse/features/auth/presentation/view/registration_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Register Screen Tests', () {
    testWidgets('Register Screen has essential UI elements',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: RegisterScreen(),
      ));

      // Wait for the UI to settle
      await tester.pumpAndSettle();

      // Check for required widgets
      expect(find.byType(TextFormField), findsNWidgets(6));
      expect(find.text('Full Name'), findsOneWidget);
      expect(find.text('Phone'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('UserName'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('Confirm Password'), findsOneWidget);
      expect(find.text('REGISTER'), findsOneWidget);
      expect(find.text('Sign in'), findsOneWidget);
      expect(find.byType(CircleAvatar), findsOneWidget);
    });

    testWidgets('Test form field validation when fields are empty',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: RegisterScreen(),
      ));

      // Wait for the UI to settle
      await tester.pumpAndSettle();

      // Tap on REGISTER button to trigger form validation
      await tester.tap(find.text('REGISTER'));
      await tester.pump();

      // Wait for validation to complete
      await tester.pumpAndSettle();

      // Check for validation error messages
      expect(find.text('Please enter your full name'), findsOneWidget);
      expect(find.text('Please enter a phone number'), findsOneWidget);
      expect(find.text('Please enter an email'), findsOneWidget);
      expect(find.text('Please enter your full name'), findsOneWidget);
      expect(find.text('Please enter a password'), findsOneWidget);
      expect(find.text('Please confirm your password'), findsOneWidget);
    });

    testWidgets('Test image upload functionality', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: RegisterScreen(),
      ));

      // Wait for the UI to settle
      await tester.pumpAndSettle();

      // Open the image picker modal
      await tester.tap(find.byType(CircleAvatar));
      await tester.pumpAndSettle();

      // Select the camera or gallery
      await tester.tap(find.text('Camera'));
      await tester.pumpAndSettle();

      // Ensure the avatar is updated after selecting an image
      expect(find.byType(CircleAvatar), findsOneWidget);
    });

    testWidgets('Check navigation to Sign In screen',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: RegisterScreen(),
      ));

      // Wait for the UI to settle
      await tester.pumpAndSettle();

      // Scroll to ensure the 'Sign in' button is visible
      await tester.scrollUntilVisible(find.text('Sign in'), 50.0);

      // Tap on 'Sign in' to navigate to the login screen
      await tester.tap(find.text('Sign in'));
      await tester.pumpAndSettle();

      // Check that RegisterScreen is no longer present
      expect(find.byType(RegisterScreen), findsNothing);
    });
  });
}
