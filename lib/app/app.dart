import 'package:flutter/material.dart';
import 'package:mvvm/presentation/resources/routes_manager.dart';
import 'package:mvvm/presentation/resources/theme_manager.dart';

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  MyApp._internal(); // private named constructor . it used to create static variables or methods

  int appState = 0;
  static final MyApp instance =
      MyApp._internal(); // single instance -- singleton

  factory MyApp() => instance; // factory for the class instance

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}



// The Singleton pattern ensures that there is only one instance of a class created throughout the application's lifetime. 
// This can be useful for scenarios where you want to have a global, shared resource or configuration settings that need to be 
// consistent across your app.
