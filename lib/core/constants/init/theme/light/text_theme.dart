import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'color_theme.dart';

class TextThemeLight {
  static TextThemeLight? _instance;
  static TextThemeLight get instance {
    return _instance ??= TextThemeLight.init();
  }

  TextThemeLight.init();

  final TextStyle headline1 =
      TextStyle(fontSize: 34.sp, fontWeight: FontWeight.bold, color: ColorThemeLight.instance!.doveGray);
  final TextStyle headline2 = TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w300, letterSpacing: -0.5);
  final TextStyle headline3 =
      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600, color: ColorThemeLight.instance!.doveGray);
  final TextStyle headline4 = TextStyle(
      fontSize: 18.sp, fontWeight: FontWeight.w600, letterSpacing: 0.25, color: ColorThemeLight.instance!.doveGray);
  final TextStyle overline = TextStyle(
      fontSize: 12.sp, fontWeight: FontWeight.w100, letterSpacing: 0.5, color: ColorThemeLight.instance!.doveGray);
  final TextStyle bodyText1 = TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, letterSpacing: 0.5);
  final TextStyle bodyText2 = TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, letterSpacing: 0.25);
}
