import 'package:flutter/material.dart';

class LocaleConstant {
  static const TR_LOCALE = Locale("tr", "TR");
  static const EN_LOCALE = Locale("en", "US");
  static const LANG_PATH = "assets/lang";
  static const SUPPORTED_LOCALES = [
    LocaleConstant.TR_LOCALE,
    LocaleConstant.EN_LOCALE
  ];
}
