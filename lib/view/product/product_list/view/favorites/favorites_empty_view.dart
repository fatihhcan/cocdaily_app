import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:cocdaily_app/core/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/constants/app/app_router_constants.dart';
import '../../../../../core/constants/image/image_path.dart';
import '../../../../../utils/locale_keys.g.dart';

class FavoritesEmptyView extends StatelessWidget {
  const FavoritesEmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(context),
    );
  }

  SafeArea buildBody(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.only(
        left: 70.w,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            SVGImagePaths.instance!.favoritesEmptySVG,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 100.h,
          ),
          Text(
           LocaleKeys.do_not_have_any_favorite_cocktails.locale,
            style: context.textTheme.bodyText2!.copyWith(
                fontWeight: FontWeight.w500,
                color: context.customColors!.doveGray),
          )
        ],
      ),
    ));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: context.customColors!.doveGray,
      title: Text(
        LocaleKeys.app_bar_favorites_cocktails.locale,
        style: context.textTheme.headline4!.copyWith(color: Colors.white),
      ),
      leading: IconButton(
          onPressed: () => Navigator.pushNamedAndRemoveUntil(context,
              RouterConstant.HOME_VIEW, ModalRoute.withName('/homeView')),
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
          )),
    );
  }
}
