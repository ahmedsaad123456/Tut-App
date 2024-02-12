import 'package:flutter/material.dart';
import 'package:mvvm/presentation/resources/color_manager.dart';
import 'package:mvvm/presentation/resources/fonts_manager.dart';
import 'package:mvvm/presentation/resources/styles_manager.dart';
import 'package:mvvm/presentation/resources/values_manager.dart';

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
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.primaryOpacity70, // test it
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
        displayLarge: getSemiBoldStyle(
            color: ColorManager.darkGrey, fontSize: FontSize.s16),
        // subtitle 1
        titleMedium: getmediumStyle(
            color: ColorManager.lightGrey, fontSize: FontSize.s14),
        // subtitle 2
        titleSmall:
            getmediumStyle(color: ColorManager.primary, fontSize: FontSize.s14),

        // caption
        bodySmall: getRegularStyle(color: ColorManager.grey1),
        // bodyText 1
        bodyLarge: getRegularStyle(color: ColorManager.grey)),

    // input decoration theme (text form field)

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),

      // hint style
      hintStyle: getRegularStyle(color: ColorManager.grey1),

      // label style
      labelStyle: getmediumStyle(color: ColorManager.darkGrey),

      //error style
      errorStyle: getRegularStyle(color: ColorManager.error),

      // enabled border
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      // focused border
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      // error border
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      // focused error border
      focusedErrorBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    ),
  );
}
