import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mastery_hub_its_task/mastery_hub_task.dart';

import 'di/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configureDependencies();
  runApp( MasteryHubTask());
}



