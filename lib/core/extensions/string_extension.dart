
import 'package:flutter/material.dart';


extension StringExtension on String {


}

extension SVGImagePathExtension on String {
  String get toSVG => 'assets/svg/$this.svg';
}

extension StringColorExtension on String {
  Color get color => Color(int.parse('0xff$this'));
}

extension AuthorizationExtension on String {
  Map<String, dynamic> get bearer => {'Authorization': 'Bearer ${this}'};
}

extension NetworkImageExtension on String {
  String get randomImage => 'https://picsum.photos/200/300';
  String get randomSquareImage => 'https://picsum.photos/200';

  String get customProfileImage => 'https://www.gravatar.com/avatar/?d=mp';
  String get customHighProfileImage => 'https://www.gravatar.com/avatar/?d=mp&s=200';
}
