import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocdaily_app/core/base/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:cocdaily_app/core/base/cubits/share_social_media_cubit/share_social_media_cubit.dart';
import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:cocdaily_app/view/product/product_details_recipe/components/detail_recipe_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/image/image_path.dart';

class ProductDetailsRecipeView extends StatelessWidget {
  final String? urlPhoto;
  final String? name;
  final String? recipe;
  final Color? cardBackgroundColor;
  final AsyncSnapshot<dynamic>? snapshot;
  final QueryDocumentSnapshot<Object?>? e;
  const ProductDetailsRecipeView(
      {Key? key,
      this.name,
      this.recipe,
      this.urlPhoto,
      this.cardBackgroundColor,
      this.e,
      this.snapshot})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isFavoritesView = false;
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(context, isFavoritesView),
    );
  }

  SafeArea buildBody(BuildContext context, bool isFavoritesView) {
    return SafeArea(
        child: Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          buildImage(),
          SizedBox(
            height: 50.h,
          ),
          buildDetailRecipeCard(context, isFavoritesView),
        ],
      ),
    ));
  }

  DetailRecipeCard buildDetailRecipeCard(
      BuildContext context, bool isFavoritesView) {
    return DetailRecipeCard(
      cardBackgroundColor: cardBackgroundColor,
      child: buildDetailRecipeCardChild(context, isFavoritesView),
    );
  }

  Column buildDetailRecipeCardChild(
      BuildContext context, bool isFavoritesView) {
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        buildButtons(context, isFavoritesView),
        buildDescriptionRecipe(context)
      ],
    );
  }

  Row buildButtons(BuildContext context, bool isFavoritesView) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildFavoriteButton(context, isFavoritesView),
        buildShareButton(context),
      ],
    );
  }

  GestureDetector buildShareButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ShareSocialMediaCubit>().share(context, name!, recipe!);
      },
      child: SvgPicture.asset(
        SVGImagePaths.instance!.shareRecipeSVG,
        fit: BoxFit.cover,
      ),
    );
  }

  GestureDetector buildFavoriteButton(
      BuildContext context, bool isFavoritesView) {
    return GestureDetector(
      onTap: () => context
          .read<FavoriteCubit>()
          .productDetailFavorites(context, isFavoritesView, snapshot!, e!),
      child: SvgPicture.asset(
        SVGImagePaths.instance!.favoriteRecipeSVG,
        fit: BoxFit.cover,
      ),
    );
  }

  Center buildImage() {
    return Center(
      child: Image.network(
        urlPhoto!,
        height: 200.h,
      ),
    );
  }

  Padding buildDescriptionRecipe(BuildContext context) {
    return Padding(
      padding: context.paddingLowOnly,
      child: Center(
        child: Text(
          recipe!,
          style: context.textTheme.headline3!
              .copyWith(fontSize: 22.sp, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: context.customColors!.doveGray,
      title: Text(
        name!,
        style: context.textTheme.headline4!.copyWith(color: Colors.white),
      ),
      leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
          )),
    );
  }
}
