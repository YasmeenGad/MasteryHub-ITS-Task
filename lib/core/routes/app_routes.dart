import 'package:flutter/material.dart';

import '../utils/screens/under_build_screen.dart';
import 'base_routes.dart';

class AppRoutes {
  static const String login = 'login';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case login:
        return BaseRoute(page: const PageUnderBuildScreen());
      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
