import 'package:flutter/material.dart';

class ColorThemeLight {
  static ColorThemeLight? _instance;
  static ColorThemeLight? get instance {
    return _instance ??= ColorThemeLight.init();
  }

  ColorThemeLight.init();

  final Color amethystSmoke = const Color(0xff907FA4);
  final Color sinbad = const Color(0xffA6D6D6);
  final Color athsSpecial = const Color(0xffEDEDD0);
  final Color yourPink = const Color(0xffFFC7C7);
  final Color wildSand = const Color(0xffF6F6F6);
  final Color manatee = const Color(0xff8785A2);
  final Color pippin = const Color(0xffFFE2E2);
  final Color doveGray = const Color(0xff707070);

  ColorScheme get colorScheme => ColorScheme(
      primary: doveGray, //xx
      primaryVariant: doveGray,
      secondary: yourPink, //xx
      secondaryVariant: yourPink, //xx
      surface: doveGray,
      background: doveGray, //xx
      error: pippin,
      onPrimary: sinbad, //changes the color of text inside elevated button
      onSecondary: Colors.black,
      onSurface: Colors.white30,
      onBackground: doveGray,
      onError: Colors.red,
      brightness: Brightness.dark);
}
