import 'package:flutter/material.dart';
import 'package:mastery_hub_its_task/features/auth/presentation/views/login_view.dart';
import 'package:mastery_hub_its_task/features/auth/presentation/views/signup_view.dart';
import 'package:mastery_hub_its_task/features/home/presentation/views/home_view.dart';
import 'package:mastery_hub_its_task/features/search/presentation/views/search_view.dart';

import '../../features/home/presentation/views/book_details_view.dart';
import '../../features/personal list/presentation/views/my_reading_list_view.dart';
import '../utils/screens/under_build_screen.dart';
import 'base_routes.dart';

class AppRoutes {
  static const String login = "/";
  static const String signup = 'signup';
  static const String home = 'home';
  static const String search = 'search';
  static const String bookDetails = 'bookDetails';
  static const String personalList = 'personalList';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case signup:
        return BaseRoute(page: SignUpView());
      case login:
        return BaseRoute(page: LoginView());
      case home:
        return BaseRoute(page: HomeView());
      case search:
        return BaseRoute(page: const SearchView());
      case bookDetails:
        return BaseRoute(page: BookDetailsView(book: args,));
      case personalList:
        return BaseRoute(page: const MyReadingListView());
      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
