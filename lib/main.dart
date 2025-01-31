import 'package:fanpulse/app/app.dart';
import 'package:fanpulse/app/di/di.dart';
import 'package:fanpulse/core/network/hive_service.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();

  // await HiveService().clearStudentBox();

  await initDependencies();

  runApp(
    App(),
  );
}
