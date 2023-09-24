import 'package:flutter/material.dart';
import 'package:mvvm/app/app.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  void updateAppState() {
    MyApp.instance.appState = 10;
  }

  void getAppState() {
    print(MyApp.instance.appState); // 10 
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
