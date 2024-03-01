import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mvvm/app/app_prefs.dart';
import 'package:mvvm/app/di.dart';
import 'package:mvvm/presentation/resources/assets_manager.dart';
import 'package:mvvm/presentation/resources/color_manager.dart';
import 'package:mvvm/presentation/resources/routes_manager.dart';

//================================================================================================================

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

//================================================================================================================

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  final AppPreferences _appPreferences = instance<AppPreferences>();

  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }

  _goNext() async {
    _appPreferences.isUserLoggedIn().then((isUserLoggedIn) => {
          if (isUserLoggedIn)
            {
              Navigator.popAndPushNamed(context, Routes.mainRoute),
            }
          else
            {
              _appPreferences
                  .isOnBoardingScreenViewed()
                  .then((isOnBoardingScreenViewed) => {
                        if (isOnBoardingScreenViewed)
                          {
                            Navigator.popAndPushNamed(
                                context, Routes.loginRoute),
                          }
                        else
                          {
                            Navigator.popAndPushNamed(
                                context, Routes.onBoardingRoute),
                          }
                      }),
            }
        });
  }

  //================================================================================================================

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  //================================================================================================================

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  //================================================================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: const Center(child: Image(image: AssetImage(ImageAssets.splashLogo))),
    );
  }

  //================================================================================================================
}
