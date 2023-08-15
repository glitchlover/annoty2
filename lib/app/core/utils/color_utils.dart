import 'package:flutter/material.dart';

class ColorUtils {

  static Color darken(Color color, double factor) {
    assert(factor >= 0 && factor <= 1, 'Factor must be between 0 and 1');
  
    int red = (color.red * (1 - factor)).round();
    int green = (color.green * (1 - factor)).round();
    int blue = (color.blue * (1 - factor)).round();

    return Color.fromARGB(color.alpha, red, green, blue);
  }


  static Color lighten(Color color, double factor) {
    assert(factor >= 0 && factor <= 1, 'Factor must be between 0 and 1');

    int red = (color.red + (255 - color.red) * factor).round();
    int green = (color.green + (255 - color.green) * factor).round();
    int blue = (color.blue + (255 - color.blue) * factor).round();

    return Color.fromARGB(color.alpha, red, green, blue);
  }

}
