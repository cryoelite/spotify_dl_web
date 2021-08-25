import 'package:flutter/material.dart';
import 'package:spotify_dl_web/app/home/homeRoute.dart';
import 'package:spotify_dl_web/routing/AppRoutes.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case AppRoutes.homeRoute:
        return MaterialPageRoute<dynamic>(
          builder: (_) => HomeRoute(),
          settings: settings,
          fullscreenDialog: true,
        );
      default:
        return null;
    }
  }
}
