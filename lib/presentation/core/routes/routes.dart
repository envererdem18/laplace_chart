import 'package:flutter/material.dart';
import 'package:laplace_chart/presentation/core/constants/route_constants.dart';
import 'package:laplace_chart/presentation/screens/home/home_screen.dart';
import 'package:laplace_chart/presentation/screens/settings/settings_screen.dart';

class Routes {
  static Routes _instance = Routes._init();
  static Routes get instance => _instance;

  Routes._init();

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.HOME_SCREEN:
        return normalNavigate(HomeScreen());
        break;
      case RouteConstants.SETTINGS_SCREEN:
        return normalNavigate(SettingsScreen());
        break;
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("No route defined for ${settings.name}"),
            ),
          ),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
