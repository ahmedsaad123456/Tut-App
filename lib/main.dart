import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:mvvm/app/di.dart';
import 'package:mvvm/presentation/resources/language_manager.dart';

import 'app/app.dart';

// MVVM : Model view viewModel
// app layer
// presentation layer
// data layer
// domain layer

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initAppModule();
  runApp(EasyLocalization(
    supportedLocales: const [ENGLISH_LOCALE, ARABIC_LOCALE],
    path: ASSETS_PATH_LOCALISATIONS,
    child: Phoenix(
      child: MyApp(),
    ),
  ));
}
