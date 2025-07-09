import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'di/di.dart';
import 'mastery_hub_task.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configureDependencies();
  runApp(MasteryHubTask());
}



