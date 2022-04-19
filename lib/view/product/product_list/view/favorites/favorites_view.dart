import 'package:cocdaily_app/core/base/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:cocdaily_app/core/base/cubits/product_cubit/product_cubit.dart';
import 'package:cocdaily_app/core/constants/app/text_constants.dart';
import 'package:cocdaily_app/core/constants/image/image_path.dart';
import 'package:cocdaily_app/view/product/product_list/components/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({
    Key? key,
  }) : super(key: key);

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ProductCubit>(
              create: (BuildContext context) =>
                  ProductCubit()..fetchProductsFavorites()),
        ],
        child: BlocBuilder<FavoriteCubit, FavoriteCubitState>(
          builder: (context, state) {
            return ProductList(
              stream: context
                  .read<ProductCubit>()
                  .collectionReferenceFavoritesCocktails
                  .snapshots(),
              cardBackgroundName: SVGImagePaths.instance!.favoritesCardSVG,
              appBarTitle: TextConstants.appBarFavoritesCocktails,
            );
          },
        )
        );
  }
}
