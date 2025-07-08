import 'package:flutter/material.dart';
import 'package:mastery_hub_its_task/features/auth/presentation/views/login_view.dart';
import 'package:mastery_hub_its_task/features/auth/presentation/views/signup_view.dart';
import 'package:mastery_hub_its_task/features/home/presentation/views/home_view.dart';

import '../utils/screens/under_build_screen.dart';
import 'base_routes.dart';

class AppRoutes {
  static const String login = "/";
  static const String signup = 'signup';
  static const String home = 'home';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case signup:
        return BaseRoute(page: SignUpView());
      case login:
        return BaseRoute(page: LoginView());
      case home:
        return BaseRoute(page: HomeView());
      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
