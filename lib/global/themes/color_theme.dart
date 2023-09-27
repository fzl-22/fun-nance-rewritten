import 'package:flutter/material.dart';

class ColorTheme {
  Color mainLighterOrange = const Color.fromARGB(255, 243, 190, 138);

  Color mainDarkerOrange = const Color.fromARGB(255, 241, 147, 54);

  Color mainGrey = const Color(0xFFBCBCBC);

  LinearGradient orangeGradient = const LinearGradient(
    colors: [
      Color.fromARGB(255, 243, 190, 138),
      Color.fromARGB(255, 241, 147, 54),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  LinearGradient warmGradient = const LinearGradient(
    colors: [
      Colors.white,
      Color.fromARGB(255, 243, 190, 138),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
