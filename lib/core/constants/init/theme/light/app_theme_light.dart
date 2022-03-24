import 'package:cocdaily_app/core/constants/init/theme/light/theme_interface_light.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_theme.dart';


class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    return _instance ??= AppThemeLight.init();
  }

  AppThemeLight.init();

  @override
  ThemeData get theme => ThemeData(
      fontFamily: GoogleFonts.montserrat().fontFamily,
      primaryColor: colorThemeLight!.wildSand,
      colorScheme: colorThemeLight!.colorScheme,
      backgroundColor: colorThemeLight!.wildSand,
      scaffoldBackgroundColor: colorThemeLight!.wildSand,
   //   bottomNavigationBarTheme: bottomNavigationBarTheme(),
      brightness: Brightness.dark,
      textTheme: textTheme(),
      //cardTheme: CardTheme(color: colorThemeLight!.darkBlueShade),
      //bottomSheetTheme: bottomSheetTheme()
      );

 /*  BottomNavigationBarThemeData bottomNavigationBarTheme() =>
      BottomNavigationBarThemeData(backgroundColor: colorThemeLight!.wildSand);
 */
  TextTheme textTheme() {
    return TextTheme(
        headline1: textThemeDark!.headline1,
        headline2: textThemeDark!.headline2,
        headline3: textThemeDark!.headline3,
        headline4: textThemeDark!.headline4,
        overline: textThemeDark!.overline,
        bodyText1: textThemeDark!.bodyText1,
        bodyText2: textThemeDark!.bodyText2);
  }

/*   BottomSheetThemeData bottomSheetTheme() {
    return BottomSheetThemeData(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      backgroundColor: colorThemeLight!.darkBlue,
      modalBackgroundColor: colorThemeLight!.darkBlue,
    );
  } */
}
