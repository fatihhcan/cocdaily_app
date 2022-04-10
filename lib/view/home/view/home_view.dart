import 'package:cocdaily_app/core/constants/app/text_constants.dart';
import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:cocdaily_app/view/home/components/favorites_card.dart';
import 'package:cocdaily_app/view/home/components/welcome_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/image/image_constants.dart';
import '../../../core/constants/image/image_path.dart';
import '../components/categories_card.dart';
import '../components/sub_title.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(context),
    );
  }

  SafeArea buildBody(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 5.h,
          ),
          buildWelcomeCard(context),
          SizedBox(
            height: 40.h,
          ),
          buildCategoriesTitle(),
          SizedBox(
            height: 25.h,
          ),
          buildCategoriesListView(context),
          SizedBox(
            height: 50.h,
          ),
          buildFavoritesTitle(),
          SizedBox(
            height: 25.h,
          ),
          buildFavoritesListView(),
        ],
      ),
    );
  }

  SizedBox buildFavoritesListView() {
    return SizedBox(
      height: 200.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          const CustomFavoritesCard(
            iconFavorite: Icons.favorite,
          ),
          const CustomFavoritesCard(
            iconFavorite: Icons.favorite,
          ),
          const CustomFavoritesCard(
            iconFavorite: Icons.favorite,
          ),
        ],
      ),
    );
  }

  CustomSubTitle buildFavoritesTitle() {
    return const CustomSubTitle(
      title: TextConstants.favorites,
    );
  }

  SizedBox buildCategoriesListView(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CustomCategoriesCard(
            color: context.customColors!.athsSpecial,
            svgName: SVGImagePaths.instance!.categoriesCardNonSVG,
            categoriesTitle: TextConstants.nonAlcoholicCocktails,
            paddingTet: EdgeInsets.only(top: 150.h, left: 60.w),
          ),
          SizedBox(
            width: 15.w,
          ),
          CustomCategoriesCard(
            color: context.customColors!.sinbad,
            svgName: SVGImagePaths.instance!.categoriesCardAlcSVG,
            categoriesTitle: TextConstants.alcoholicCocktails,
            paddingTet: EdgeInsets.only(top: 150.h, left: 85.w),
          ),
          SizedBox(
            width: 15.w,
          ),
          CustomCategoriesCard(
            color: context.customColors!.hitPink,
            svgName: SVGImagePaths.instance!.categoriesCardClsSVG,
            categoriesTitle: TextConstants.clsoholicCocktails,
            paddingTet: EdgeInsets.only(top: 150.h, left: 90.w),
          ),
          SizedBox(
            width: 15.w,
          ),
          CustomCategoriesCard(
            color: context.customColors!.pippin,
            svgName: SVGImagePaths.instance!.categoriesCardFavoritesSVG,
            categoriesTitle: TextConstants.favoritesoholicCocktails,
            paddingTet: EdgeInsets.only(top: 150.h, left: 85.w),
          ),
        ],
      ),
    );
  }

  CustomSubTitle buildCategoriesTitle() {
    return const CustomSubTitle(
      title: TextConstants.categories,
    );
  }

  CustomWelcomeCard buildWelcomeCard(BuildContext context) {
    return CustomWelcomeCard(
      userFullName: "Fatih Can",
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading:false,
      backgroundColor: context.customColors!.doveGray,
      title: Image.asset(
        ImageConstants.instance.projectIcon,
        fit: BoxFit.cover,
        color: Colors.white,
        height: 35.h,
      ),
      actions: [settingsButton(context)],
    );
  }

  IconButton settingsButton(BuildContext context) => IconButton(
        onPressed: () {},
        icon: const Icon(Icons.settings),
        color: context.customColors!.wildSand,
      );
}
