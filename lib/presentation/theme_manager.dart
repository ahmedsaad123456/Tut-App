import 'package:flutter/material.dart';
import 'package:mvvm/presentation/color_manager.dart';
import 'package:mvvm/presentation/fonts_manager.dart';
import 'package:mvvm/presentation/styles_manager.dart';
import 'package:mvvm/presentation/values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors of the app
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager
        .grey1, // will be used incase of disabled button for example
    //ripple color
    splashColor: ColorManager.primaryOpacity70,
    // accentColor : ColorManager.grey

    // card view theme

    cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppSize.s4),

    // App bar theme

    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.primaryOpacity70,
      titleTextStyle:
          getRegularStyle(color: ColorManager.white, fontSize: FontSize.s16),
    ),

    // button theme

    buttonTheme: ButtonThemeData(
      shape: StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.primaryOpacity70,
    ),

    // elevated button theme

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(color: ColorManager.white),
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s12)),
      ),
    ),

    // text theme
    textTheme: TextTheme(
      // headline 1
      displayLarge: getSemiBoldStyle(color: ColorManager.darkGrey, fontSize: FontSize.s16),
      // subtitle 1
      titleMedium: getmediumStyle(color: ColorManager.lightGrey, fontSize: FontSize.s14),
      // caption
      bodySmall:  getRegularStyle(color: ColorManager.grey1),
      // bodyText 1
      bodyLarge: getRegularStyle(color: ColorManager.grey)

    ),

    // input decoration theme (text form field)
  );
}
