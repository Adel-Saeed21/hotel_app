import 'package:flutter/material.dart';
import 'package:hotelapp/core/routing/routes.dart';
import 'package:hotelapp/feature/auth/login_screen/presentation/pages/login_screen.dart';
import 'package:hotelapp/feature/start_screen/start_screen.dart';

class AppRoute {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.startScreen:
        return MaterialPageRoute(builder: (_) => const StartScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
