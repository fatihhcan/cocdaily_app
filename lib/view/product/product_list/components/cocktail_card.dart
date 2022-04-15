import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CocktailCard extends StatelessWidget {
  final String urlPhoto;
  final String name;
  final String cardBackgroundName;
  final void Function()? onPressedFavorite;
  const CocktailCard(
      {Key? key,
      required this.urlPhoto,
      required this.name,
      required this.cardBackgroundName, this.onPressedFavorite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        buildCocktailsCard(),
        buildButtons(context),
        buildCocktailsImage(urlPhoto),
        buildCocktailsName(context, name)
      ],
    );
  }

  SvgPicture buildCocktailsCard() {
    return SvgPicture.asset(
      cardBackgroundName,
      fit: BoxFit.cover,
    );
  }

  Padding buildCocktailsName(BuildContext context, String name) {
    return Padding(
      padding: EdgeInsets.only(top: 165.h, left: 50.w),
      child: Text(
        name,
        style: context.textTheme.headline3!.copyWith(fontSize: 12.sp),
        textAlign: TextAlign.center,
      ),
    );
  }

  Padding buildCocktailsImage(String urlPhoto) {
    return Padding(
      padding: EdgeInsets.only(top: 50.h, left: 70.w),
      child: Image.network(urlPhoto),
    );
  }

  Padding buildButtons(BuildContext context) {
    return Padding(
      padding: context.paddingLowVertical,
      child: Row(
        children: [
          SizedBox(
            width: 7.w,
          ),
          buildFavoriteButton(context),
          SizedBox(
            width: 45.w,
          ),
          buildNextDetailButton(context),
        ],
      ),
    );
  }

  SizedBox buildNextDetailButton(BuildContext context) {
    return SizedBox(
        height: 35.h,
        child: FloatingActionButton(
          heroTag: 'nextDetail',
          backgroundColor: context.customColors!.doveGray,
          onPressed: () {},
          elevation: 0,
          child: Icon(
            Icons.keyboard_arrow_right,
            size: 30.h,
            color: Colors.white,
          ),
        ));
  }

  SizedBox buildFavoriteButton(BuildContext context) {
    return SizedBox(
        height: 35.h,
        child: FloatingActionButton(
          heroTag: 'favorite',
          backgroundColor: context.customColors!.doveGray,
          onPressed: onPressedFavorite,
          elevation: 0,
          child: Icon(
            Icons.favorite,
            size: 16.h,
            color: Colors.white,
          ),
        ));
  }
}
