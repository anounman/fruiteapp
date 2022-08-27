import 'package:flutter/material.dart';

height(context) {
  return MediaQuery.of(context).size.height;
}

width(context) {
  return MediaQuery.of(context).size.width;
}

navigate({required context, required page}) {
  return Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
