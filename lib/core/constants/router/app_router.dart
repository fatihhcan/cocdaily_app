import 'package:cocdaily_app/view/authentication/login/view/login_view.dart';
import 'package:cocdaily_app/view/authentication/register/view/sign_up_view.dart';
import 'package:cocdaily_app/view/home/view/home_view.dart';
import 'package:cocdaily_app/view/launch/view/splash_view.dart';
import 'package:cocdaily_app/view/product/product_list/view/alcoholic/alcoholic_view.dart';
import 'package:cocdaily_app/view/product/product_list/view/classic/classic_view.dart';
import 'package:cocdaily_app/view/product/product_list/view/favorites/favorites_view.dart';
import 'package:cocdaily_app/view/settings/view/settings_view.dart';
import 'package:flutter/material.dart';
import '../../../view/product/product_list/view/non_alcoholic/non_alcoholic_view.dart';
import '../app/app_router_constants.dart';
class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouterConstant.SPLASH_VIEW:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case RouterConstant.REGISTER_VIEW:
        return MaterialPageRoute(builder: (_) => const SignUpView());
      case RouterConstant.LOGIN_VIEW:
        return MaterialPageRoute(
          builder: (_) => const LoginView(),
        );
      case RouterConstant.HOME_VIEW:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );
      case RouterConstant.SETTINGS_VIEW:
        return MaterialPageRoute(
          builder: (_) => const SettingsView(),
        );
      case RouterConstant.ALCOHOLIC_PRODUCT_VIEW:
        return MaterialPageRoute(
          builder: (_) =>  const AlcoholicView(),
        );
      case RouterConstant.NON_ALCOHOLIC_PRODUCT_VIEW:
        return MaterialPageRoute(
          builder: (_) => const NonAlcoholicView(),
        );
    case RouterConstant.CLASSIC_PRODUCT_VIEW:
        return MaterialPageRoute(
          builder: (_) => const ClassicView(),
        );
    case RouterConstant.FAVORITES_PRODUCT_VIEW:
        return MaterialPageRoute(
          builder: (_) => const FavoritesView(),
        );
      default:
        return null;
    }
  }
}
