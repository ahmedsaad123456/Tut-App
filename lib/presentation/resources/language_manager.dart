import 'package:flutter/material.dart';

//================================================================================================================

enum LanguageType {
  ENGLISH,
  ARABIC,
}

//================================================================================================================

const String ARABIC = "ar";
const String ENGLISH = "en";
const String ASSETS_PATH_LOCALISATIONS = "assets/translations";
const Locale ARABIC_LOCALE = Locale("ar", "SA");
const Locale ENGLISH_LOCALE = Locale("en", "US");


//================================================================================================================

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ENGLISH:
        return ENGLISH;
      case LanguageType.ARABIC:
        return ARABIC;
    }
  }
}

//================================================================================================================
