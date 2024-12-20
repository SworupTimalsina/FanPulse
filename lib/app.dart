import 'package:fanpulse/core/app_theme1/app_theme.dart';
import 'package:fanpulse/view/onboarding_screen_view.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FanPulse',
      theme: getApplicationTheme(),
      home: const OnboardingScreen(),
    );
  }
}
