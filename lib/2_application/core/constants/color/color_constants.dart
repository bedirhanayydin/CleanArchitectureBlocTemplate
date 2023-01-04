import 'package:flutter/material.dart';

import '../../extension/color_extension.dart';

class ColorConstants {
  static ColorConstants? _instance;
  static ColorConstants get instance => _instance ??= ColorConstants._init();
  ColorConstants._init();

  Color get secondary => HexColor.fromHex("#EFEFEF");
  Color get border => HexColor.fromHex("#EAEAF5");
  Color get shadow => HexColor.fromHex("#000000").withOpacity(0.29);
  Color get status_green => const Color.fromRGBO(59, 207, 94, 1);
  Color get status_red => const Color.fromARGB(255, 233, 24, 24);
  Color get blue => const Color.fromARGB(255, 35, 112, 226);
}
