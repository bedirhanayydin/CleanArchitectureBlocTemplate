import 'package:flutter/material.dart';

import '../constants/color/color_constants.dart';
import '../constants/font/fonts_constants.dart';

class TextThemeLight {
  static TextThemeLight? _instance;
  static TextThemeLight? get instance {
    _instance ??= TextThemeLight._init();
    return _instance;
  }

  TextThemeLight._init();

  TextStyle get signInInput => TextStyle(
        color: ColorConstants.instance.secondary,
        fontSize: 18,
        fontFamily: Fonts.SemiBold,
      );

  TextStyle get signInRemember => TextStyle(
        color: ColorConstants.instance.status_green,
        fontSize: 18,
        fontFamily: Fonts.Bold,
      );
}
