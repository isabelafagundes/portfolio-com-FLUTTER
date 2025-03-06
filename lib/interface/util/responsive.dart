import 'package:flutter/material.dart';

class Responsive {
  static const double _smallWidth = 650;
  static const double _smallHeight = 935;
  static const double _mediumWidth = 950;
  static const double _mediumHeight = 1200;
  static const double _largeWidth = 1200;
  static const double _largeHeight = 1400;

  static bool mobile(context) => larguraTela(context) < _smallWidth;

  static bool tablet(context) => larguraTela(context) < _mediumWidth;

  static bool desktop(context) => larguraTela(context) > _largeWidth;

  static double larguraTela(context) {
    return MediaQuery.of(context).size.width;
  }

  static double alturaTela(context) {
    return MediaQuery.of(context).size.height;
  }
}
