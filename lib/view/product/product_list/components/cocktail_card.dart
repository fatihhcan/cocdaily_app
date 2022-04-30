import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CocktailCard extends StatelessWidget {
  final String urlPhoto;
  final String name;
  final String cardBackgroundName;
  final void Function()? onPressedFavorite;
  final void Function()? onPressedNextDetail;
  final void Function()? onPressedNextDetailDetector;
  final IconData favoriteIcon;
  const CocktailCard(
      {Key? key,
      required this.urlPhoto,
      required this.name,
      required this.cardBackgroundName,
      this.onPressedFavorite,
      this.onPressedNextDetail,
      required this.favoriteIcon,
      this.onPressedNextDetailDetector})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressedNextDetailDetector,
      child: Stack(
        children: [
          buildCocktailsCard(),
          buildButtons(context),
          buildCocktailsImage(urlPhoto),
          buildCocktailsName(context, name)
        ],
      ),
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
      padding: EdgeInsets.only(top: 170.h, left: 50.w),
      child: Text(
        name,
        style: context.textTheme.headline3!.copyWith(fontSize: 12.sp),
        textAlign: TextAlign.center,
      ),
    );
  }

  Padding buildCocktailsImage(String urlPhoto) {
    return Padding(
      padding: EdgeInsets.only(top: 60.h, left: 55.w, bottom: 70.h),
      child: Image.network(
        urlPhoto,
        fit: BoxFit.contain,
        height: 75.0.h,
        width: 75.0.w,
      ),
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
          onPressed: onPressedNextDetail,
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
            favoriteIcon,
            size: 16.h,
            color: Colors.white,
          ),
        ));
  }
}
