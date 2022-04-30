import 'package:cocdaily_app/core/base/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:cocdaily_app/core/base/cubits/product_cubit/product_cubit.dart';
import 'package:cocdaily_app/core/constants/image/image_path.dart';
import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:cocdaily_app/core/extensions/string_extension.dart';
import 'package:cocdaily_app/view/product/product_list/components/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../utils/locale_keys.g.dart';
class AlcoholicView extends StatelessWidget {
  const AlcoholicView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ProductCubit>(
              create: (BuildContext context) =>
                  ProductCubit()..fetchProductsAlcoholic()),
        ],
        child: BlocBuilder<FavoriteCubit, FavoriteCubitState>(
          builder: (context, state) {
            return ProductList(
              iconFavorite: Icons.favorite,
              cardBackgroundColor: context.customColors!.sinbad,
              stream: context
                  .read<ProductCubit>()
                  .collectionReferenceAlcoholicCocktails
                  .snapshots(),
              cardBackgroundName: SVGImagePaths.instance!.alcoholicCardSVG,
              appBarTitle: LocaleKeys.app_bar_alcoholic_cocktails.locale,
            );
          },
        ));
  }
}
