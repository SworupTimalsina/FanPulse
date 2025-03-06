import 'package:fanpulse/features/splash/presentation/view/onboarding_screen_view.dart';
import 'package:fanpulse/features/splash/presentation/view_model/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OnboardingScreen Widget Tests', () {
    testWidgets('displays onboarding pages correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider(
            create: (_) => OnboardingCubit(),
            child: const OnboardingScreen(),
          ),
        ),
      );

      expect(find.text('Your Ultimate Hub for Sports'), findsOneWidget);
      expect(find.text('Stay Updated with Live Scores'), findsNothing);
    });

    testWidgets('navigates to next page on Next button tap',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider(
            create: (_) => OnboardingCubit(),
            child: const OnboardingScreen(),
          ),
        ),
      );

      await tester.tap(find.text('Next'));
      await tester.pumpAndSettle();

      expect(find.text('Stay Updated with Live Scores'), findsOneWidget);
    });

    testWidgets('Skip button navigates to login screen',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider(
            create: (_) => OnboardingCubit(),
            child: const OnboardingScreen(),
          ),
        ),
      );

      await tester.tap(find.text('Skip'));
      await tester.pumpAndSettle();

      expect(find.byType(OnboardingScreen), findsNothing);
    });

    testWidgets('displays all onboarding indicators',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider(
            create: (_) => OnboardingCubit(),
            child: const OnboardingScreen(),
          ),
        ),
      );

      expect(find.byType(Container), findsNWidgets(3)); // Three indicators
    });

    testWidgets('final page shows Done button', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider(
            create: (_) => OnboardingCubit(),
            child: const OnboardingScreen(),
          ),
        ),
      );

      await tester.drag(find.byType(PageView), const Offset(-500, 0));
      await tester.pumpAndSettle();
      await tester.drag(find.byType(PageView), const Offset(-500, 0));
      await tester.pumpAndSettle();

      expect(find.text('Done'), findsOneWidget);
    });

    testWidgets('Done button navigates to login screen',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider(
            create: (_) => OnboardingCubit(),
            child: const OnboardingScreen(),
          ),
        ),
      );

      await tester.drag(find.byType(PageView), const Offset(-500, 0));
      await tester.pumpAndSettle();
      await tester.drag(find.byType(PageView), const Offset(-500, 0));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Done'));
      await tester.pumpAndSettle();

      expect(find.byType(OnboardingScreen), findsNothing);
    });
  });
}
