import 'package:flutter/material.dart';
import 'package:mvvm/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_LANG = "PREFS_KEY_LANG";
const String PREFS_KEY_ONBOARDING_SCREEN = "PREFS_KEY_ONBOARDING_SCREEN";
const String PREFS_KEY_IS_USER_LOGGED_IN = "PREFS_KEY_IS_USER_LOGGED_IN";

class AppPreferences {
  final SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);

  //================================================================================================================

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(PREFS_KEY_LANG);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.ENGLISH.getValue();
    }
  }

  //================================================================================================================


  Future<void> setAppLanguage() async {
    String currentLanguage = await getAppLanguage();
    if (currentLanguage == LanguageType.ARABIC.getValue()) {
      _sharedPreferences.setString(
          PREFS_KEY_LANG, LanguageType.ENGLISH.getValue());
    } else {
      _sharedPreferences.setString(
          PREFS_KEY_LANG, LanguageType.ARABIC.getValue());
    }
  }

  //================================================================================================================


  Future<Locale> getLocal() async {
    String currentLanguage = await getAppLanguage();
    if (currentLanguage == LanguageType.ARABIC.getValue()) {
      return ARABIC_LOCALE;
    } else {
      return ENGLISH_LOCALE;
    }
  }

  //================================================================================================================


  Future<void> setOnBoardingScreenViewed() async {
    await _sharedPreferences.setBool(PREFS_KEY_ONBOARDING_SCREEN, true);
  }

  //================================================================================================================

  Future<bool> isOnBoardingScreenViewed() async {
    return _sharedPreferences.getBool(PREFS_KEY_ONBOARDING_SCREEN) ?? false;
  }

  //================================================================================================================

  Future<void> setIsUserLoggedIn() async {
    await _sharedPreferences.setBool(PREFS_KEY_IS_USER_LOGGED_IN, true);
  }

  //================================================================================================================

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(PREFS_KEY_IS_USER_LOGGED_IN) ?? false;
  }

  //================================================================================================================

  Future<void> logout() async {
    _sharedPreferences.remove(PREFS_KEY_IS_USER_LOGGED_IN);
  }

  //================================================================================================================

}
