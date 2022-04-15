import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/image/image_path.dart';

class CustomFavoritesCard extends StatelessWidget {
  final String? pngName;
  final IconData? iconFavorite;
  final void Function()? onPressedFavorite;
  final void Function()? onPressedNextDetail;
  const CustomFavoritesCard({Key? key, this.pngName, this.iconFavorite, this.onPressedFavorite, this.onPressedNextDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        buildCocktailsCard(),
        buildButtons(context),
        buildCocktailsImage(),
        buildCocktailsName(context)
      ],
    );
  }

  Padding buildCocktailsName(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 165.h, left: 50.w),
        child: Text(
          "Virgin Mary",
          style: context.textTheme.headline3!.copyWith(fontSize: 12.sp),
          textAlign: TextAlign.center,
        ),
      );
  }

  Padding buildCocktailsImage() {
    return Padding(
        padding: EdgeInsets.only(top: 50.h, left: 70.w),
        child: SvgPicture.asset(
          SVGImagePaths.instance!.exampleCocSVG,
          fit: BoxFit.cover,
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
                   heroTag:'nextDetail',
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
                      heroTag:'favorite',
                  backgroundColor: context.customColors!.doveGray,
                  onPressed: onPressedFavorite,
                  elevation: 0,
                  child: Icon(
                    iconFavorite, //Icons.favorite
                    size: 16.h,
                    color: Colors.white,
                  ),
                ));
  }

  SvgPicture buildCocktailsCard() {
    return SvgPicture.asset(
        SVGImagePaths.instance!.favoritesCardSVG,
        fit: BoxFit.cover,
      );
  }
}
