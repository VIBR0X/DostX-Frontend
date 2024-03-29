import 'package:flutter/material.dart';

class GradientOptions {
  static const LinearGradient backgroundGradient = LinearGradient(
    colors: <Color>[
      Color(
        0xFFFFFFFF,
      ),
      Color(
        0xFFE5A194,
      ),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const LinearGradient signInGradient = LinearGradient(
    colors: <Color>[
      Color(
        0xFF436992,
      ),
      Color(
        0xFF17395C,
      ),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

class ColorOptions {
  static const Color darkblue = Color(
    0xFF414F91,
  );
  static const Color lightblue = Color(
    0xFF436992,
  );
  static const Color skin = Color(
    0xFFE4A194,
  );
  static const Color whitish = Color(
    0xFFFFF2E3,
  );
}
