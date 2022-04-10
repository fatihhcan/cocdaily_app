import 'package:cocdaily_app/core/constants/app/text_constants.dart';
import 'package:cocdaily_app/core/constants/image/image_path.dart';
import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


class ProductListView extends StatelessWidget {
  const ProductListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:buildAppBar(context),
      body: SafeArea(child: Padding(
        padding:  EdgeInsets.only(left:25.w),
        child: productGridViewBuilder(context),
      )),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
    backgroundColor: context.customColors!.doveGray,
    title: Text(TextConstants.appBarNonAlcoholicCocktails,style: context.textTheme.headline4!.copyWith(color: Colors.white),),
    leading: IconButton(onPressed: (){}, icon: Icon( Icons.keyboard_arrow_left, color: Colors.white,)),
    //actions: [settingsButton(context)],
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
                  backgroundColor: context.customColors!.doveGray,
                  onPressed: (){},
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
                  backgroundColor: context.customColors!.doveGray,
                  onPressed: (){},
                  elevation: 0,
                  child: Icon(
                    Icons.favorite,
                    size: 16.h,
                    color: Colors.white,
                  ),
                ));
  }

  SvgPicture buildCocktailsCard() {
    return SvgPicture.asset(
        SVGImagePaths.instance!.nonAlcoholicCardSVG,
        fit: BoxFit.cover,
      );
  }
  Widget productGridViewBuilder(BuildContext context) {
  return MediaQuery.removePadding(
    context: context,
    removeTop: true,
    child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Stack(
      children: [
        buildCocktailsCard(),
        buildButtons(context),
        buildCocktailsImage(),
        buildCocktailsName(context)
      ],
    );
      }
    ),
  );
}
}