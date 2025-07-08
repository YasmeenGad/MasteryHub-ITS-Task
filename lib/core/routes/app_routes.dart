import 'package:flutter/material.dart';
import 'package:mastery_hub_its_task/features/auth/presentation/views/signup_view.dart';

import '../utils/screens/under_build_screen.dart';
import 'base_routes.dart';

class AppRoutes {
  static const String signup = '/';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case signup:
        return BaseRoute(page: SignUpView());
      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
