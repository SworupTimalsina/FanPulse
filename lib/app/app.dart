import 'package:fanpulse/core/theme/app_theme.dart';
import 'package:fanpulse/features/view/splashscreen_view.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FanPulse',
      theme: getApplicationTheme(),
      home: const SplashScreen(),
    );
  }
}
