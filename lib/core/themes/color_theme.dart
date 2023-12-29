import 'package:flutter/material.dart';

class ColorTheme {
  static Color mainLighterOrange = const Color.fromARGB(255, 243, 190, 138);

  static Color mainDarkerOrange = const Color.fromARGB(255, 241, 147, 54);

  static Color mainGrey = const Color(0xFFBCBCBC);

  static LinearGradient orangeGradient = const LinearGradient(
    colors: [
      Color.fromARGB(255, 243, 190, 138),
      Color.fromARGB(255, 241, 147, 54),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static LinearGradient warmGradient = const LinearGradient(
    colors: [
      Colors.white,
      Color.fromARGB(255, 243, 190, 138),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static Color white = Colors.white;
}
