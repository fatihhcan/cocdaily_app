
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
extension StringLocalization on String {
  String get locale => this.tr();
}


extension SVGImagePathExtension on String {
  String get toSVG => 'assets/svg/$this.svg';
}

extension StringColorExtension on String {
  Color get color => Color(int.parse('0xff$this'));
}

