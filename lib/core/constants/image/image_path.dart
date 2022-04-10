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
  final homeAppBarSVG = 'home_app_bar'.toSVG;
  final categoriesCardNonSVG = 'categories_card_non'.toSVG;
  final categoriesCardAlcSVG = 'categories_card_alc'.toSVG;
  final categoriesCardClsSVG = 'categories_card_cls'.toSVG;
  final categoriesCardFavoritesSVG = 'categories_card_favorites'.toSVG;
  final favoritesCardSVG = 'favorites_card'.toSVG;
  final exampleCocSVG = 'example_coc'.toSVG;
  final appBarSVG = 'app_bar'.toSVG;
  final classicCardSVG = 'classic_card'.toSVG;
  final alcoholicCardSVG = 'alcoholic_card'.toSVG;
  final nonAlcoholicCardSVG = 'non_alcoholic_card'.toSVG;
  final splashJSON = 'assets/json/splash.json';   //JSON - SPLASH 
}
