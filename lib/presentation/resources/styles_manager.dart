import 'package:flutter/material.dart';
import 'package:mvvm/presentation/resources/fonts_manager.dart';

//================================================================================================================

TextStyle _getTextStyle(double fontSize, String fontFamily,FontWeight fontWeight, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    color: color,
    fontWeight: fontWeight,
  );
}

//================================================================================================================

// regular style

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontConstants.fontFamily,FontWeightManager.regular ,color);
}

//================================================================================================================

// light style


TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontConstants.fontFamily,FontWeightManager.light ,color);
}

//================================================================================================================


// bold style 

TextStyle getBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontConstants.fontFamily,FontWeightManager.bold ,color);
}

//================================================================================================================


// semiBold style 

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontConstants.fontFamily,FontWeightManager.semiBold ,color);
}

//================================================================================================================


// medium style 

TextStyle getmediumStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontConstants.fontFamily,FontWeightManager.medium ,color);
}

//================================================================================================================