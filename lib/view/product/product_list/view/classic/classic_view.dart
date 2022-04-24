import 'package:cocdaily_app/core/base/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:cocdaily_app/core/base/cubits/product_cubit/product_cubit.dart';
import 'package:cocdaily_app/core/constants/app/text_constants.dart';
import 'package:cocdaily_app/core/constants/image/image_path.dart';
import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:cocdaily_app/view/product/product_list/components/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassicView extends StatefulWidget {
  const ClassicView({
    Key? key,
  }) : super(key: key);

  @override
  State<ClassicView> createState() => _ClassicViewState();
}

class _ClassicViewState extends State<ClassicView> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ProductCubit>(
              create: (BuildContext context) =>
                  ProductCubit()..fetchProductsClassic()),
        ],
        child: BlocBuilder<FavoriteCubit, FavoriteCubitState>(
          builder: (context, state) {
            return ProductList(
              iconFavorite: Icons.favorite,
              cardBackgroundColor: context.customColors!.hitPink,
              stream: context
                  .read<ProductCubit>()
                  .collectionReferenceClassicAlcoholicCocktails
                  .snapshots(),
              cardBackgroundName: SVGImagePaths.instance!.classicCardSVG,
              appBarTitle: TextConstants.appBarClassicCocktails,
            );
          },
        )
        );
  }
}
