

import 'package:cocdaily_app/core/extensions/string_extension.dart';

class SVGImagePaths {
  static SVGImagePaths? _instance;
  static SVGImagePaths? get instance {
    return _instance ??= SVGImagePaths.init();
  }

  SVGImagePaths.init();

  final rectangleTopSVG = 'rectangle_top'.toSVG;
  final rectangleBottomSVG = 'rectangle_bottom'.toSVG;
  final cocdailyLogoSVG = 'cocdaily_logo'.toSVG;

}
