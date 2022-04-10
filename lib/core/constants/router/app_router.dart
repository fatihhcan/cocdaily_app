import 'package:cocdaily_app/view/authentication/login/view/login_view.dart';
import 'package:cocdaily_app/view/authentication/register/view/sign_up_view.dart';
import 'package:cocdaily_app/view/home/view/home_view.dart';
import 'package:cocdaily_app/view/launch/view/splash_view.dart';
import 'package:flutter/material.dart';
import '../app/app_router_constants.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouterConstant.SPLASH_VIEW:
        return MaterialPageRoute(builder: (_) => SplashView());
      case RouterConstant.REGISTER_VIEW:
        return MaterialPageRoute(builder: (_) => SignUpView());
      case RouterConstant.LOGIN_VIEW:
        return MaterialPageRoute(
          builder: (_) => LoginView(),
        );
      case RouterConstant.HOME_VIEW:
        return MaterialPageRoute(
          builder: (_) => HomeView(),
        );

      default:
        return null;
    }
  }
}
