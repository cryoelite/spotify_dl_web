import 'package:flutter/material.dart' show Color, MaterialColor;

class AppColors {
  static const colorWhite = Color(0xffFFFFFF);
  static const colorGrey = Color(0xffBFCED9);
  static const colorDarkGrey = Color(0xff4A494B);
  static const colorPink = Color(0xffFC5271);
  static const colorMediumDarkGrey = Color(0xff707070);
  static const colorYellow = Color(0xffFFC148);

  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }
}
