import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mastery_hub_its_task/core/utils/extension/media_query_values.dart';

import 'core/routes/app_routes.dart';
import 'core/services/connectivity_controller.dart';
import 'core/styles/colors/my_colors.dart';
import 'core/utils/screens/no_network_screen.dart';
import 'di/di.dart';

class MasteryHubTask extends StatelessWidget {
  MasteryHubTask({super.key});

  final GlobalKey<NavigatorState> navigatorKey =
      getIt<GlobalKey<NavigatorState>>();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (context, value, child) {
        if (value) {
          return ScreenUtilInit(
              child: ScreenUtilInit(
                  designSize: kIsWeb
                      ? Size(context.width, context.height)
                      : const Size(390, 844),
                  minTextAdapt: true,
                  child: MaterialApp(
                    initialRoute: AppRoutes.login,
                    debugShowCheckedModeBanner: false,
                    builder: (context, child) {
                      return Scaffold(
                        backgroundColor: MyColors.white,
                        body: Builder(
                          builder: (context) {
                            ConnectivityController.instance.init();
                            return child!;
                          },
                        ),
                      );
                    },
                    onGenerateRoute: AppRoutes.onGenerateRoute,
                    navigatorKey: getIt<GlobalKey<NavigatorState>>(),
                  )));
        } else {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: NoNetworkScreen(),
          );
        }
      },
    );
  }
}

// String _getInitialRoute() {}
