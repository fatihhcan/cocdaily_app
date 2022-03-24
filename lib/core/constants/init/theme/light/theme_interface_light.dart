import 'package:cocdaily_app/core/constants/init/theme/light/color_theme.dart';
import 'package:cocdaily_app/core/constants/init/theme/light/text_theme.dart';


abstract class ILightTheme {
  TextThemeLight? textThemeDark = TextThemeLight.instance;
  ColorThemeLight? colorThemeLight = ColorThemeLight.instance;
}
