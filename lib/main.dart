import 'package:flutter/material.dart';
import 'package:mvvm/app/di.dart';

import 'app/app.dart';

// MVVM : Model view viewModel
// app layer
// presentation layer
// data layer
// domain layer

void main() async {
  WidgetsFlutterBinding();
  await initAppModule();
  runApp(MyApp());
}
