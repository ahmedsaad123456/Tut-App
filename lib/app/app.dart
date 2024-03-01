import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/app/app_prefs.dart';
import 'package:mvvm/app/di.dart';
import 'package:mvvm/presentation/resources/routes_manager.dart';
import 'package:mvvm/presentation/resources/theme_manager.dart';

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  MyApp._internal(); // private named constructor . it used to create static variables or methods

  //================================================================================================================


  int appState = 0;
  static final MyApp instance =
      MyApp._internal(); // single instance -- singleton


  //================================================================================================================

  // to return the same instance when called multiple times
  factory MyApp() => instance; // factory for the class instance

  //================================================================================================================

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final AppPreferences _appPreferences = instance<AppPreferences>();

  //================================================================================================================

  @override
  void didChangeDependencies() {
    _appPreferences.getLocal().then((locale) => {context.setLocale(locale)});
    super.didChangeDependencies();
  }

  //================================================================================================================

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
      debugShowCheckedModeBanner: false,
    );
  }

  //================================================================================================================

}



// The Singleton pattern ensures that there is only one instance of a class created throughout the application's lifetime. 
// This can be useful for scenarios where you want to have a global, shared resource or configuration settings that need to be 
// consistent across your app.
