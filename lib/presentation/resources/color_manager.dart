import 'package:flutter/material.dart';


// we can use hexColor package instead of this 
class ColorManager {
  static Color primary = HexColor.fromHex("#ED9728");
  static Color darkGrey = HexColor.fromHex("#525252");
  static Color grey = HexColor.fromHex("#737477");
  static Color lightGrey = HexColor.fromHex("#9E9E9E");
  static Color primaryOpacity70 =
      HexColor.fromHex("#B3ED9728"); // length > 6 that mean opacity , B3 = 70

  // new colors
  static Color darkPrimary = HexColor.fromHex("#d17d11");
  static Color grey1 = HexColor.fromHex("#707070");
  static Color grey2 = HexColor.fromHex("#797979");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color error = HexColor.fromHex("#e61f34"); // red color
}

// An extension allows you to add new functionality to an existing class without modifying the class itself.
// every static method in HexColor return Color

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString =
        hexColorString.replaceAll('#', ''); // replace all '#' with nothing
    // length == 6 that means the color has not Opacity
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString,
        radix:
            16)); // convert the hex color string to int and radix: 16 here mean that the hex color is hex decimal
  }
}
