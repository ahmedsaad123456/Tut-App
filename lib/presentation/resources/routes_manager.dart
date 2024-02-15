import 'package:flutter/material.dart';
import 'package:mvvm/app/di.dart';
import 'package:mvvm/presentation/forgot_password/forgot_password.dart';
import 'package:mvvm/presentation/login/login.dart';
import 'package:mvvm/presentation/main/main_view.dart';
import 'package:mvvm/presentation/onBoarding/onboarding.dart';
import 'package:mvvm/presentation/register/register.dart';
import 'package:mvvm/presentation/resources/strings_manager.dart';
import 'package:mvvm/presentation/splash/splash.dart';
import 'package:mvvm/presentation/store_details/store_details.dart';

class Routes {
  static const splashRoute = "/";
  static const onBoardingRoute = "/onBoarding";
  static const loginRoute = "/login";
  static const registerRoute = "/register";
  static const forgptPasswordRoute = "/forgotPassword";
  static const mainRoute = "/main";
  static const storeDetailsRoute = "/storeDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forgptPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => const StoreDetailsView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}
