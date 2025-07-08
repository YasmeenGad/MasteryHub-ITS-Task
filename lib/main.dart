import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mastery_hub_its_task/core/utils/extension/media_query_values.dart';
import 'package:mastery_hub_its_task/features/auth/presentation/views/signup_view.dart';

import 'core/routes/app_routes.dart';
import 'core/services/connectivity_controller.dart';
import 'core/styles/colors/my_colors.dart';
import 'core/utils/screens/no_network_screen.dart';
import 'di/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SignUpView());
  }
}

class MasteryHubTask extends StatelessWidget {
  MasteryHubTask({super.key});

  final GlobalKey<NavigatorState> navigatorKey =
      getIt<GlobalKey<NavigatorState>>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.signup,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      navigatorKey: navigatorKey,
    );
  }
}
