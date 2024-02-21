import 'package:flutter/material.dart';

class Tcolor {
  static Color get primaryColor1 => const Color(0xff92A3FD);
  static Color get primaryColor2 => const Color(0xff9DCEFF);

  static Color get secondryColor1 => const Color.fromARGB(255, 241, 99, 231);
  static Color get secondryColor2 => const Color.fromARGB(255, 181, 90, 230);

  static List<Color> get primaryGradient => [primaryColor1, primaryColor2];
  static List<Color> get secondryGradient => [secondryColor1, secondryColor2];
  static List<Color> get teritoryGradient => [secondryColor2, secondryColor1];
  static Color get black => const Color(0xff1D1617);
  static Color get gray => const Color(0xff786F72);
  static Color get white => Colors.white;
  static Color get lightGray => const Color(0xffF7F8F8);
}
