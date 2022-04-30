import 'package:cocdaily_app/core/base/cubits/product_cubit/product_cubit.dart';
import 'package:cocdaily_app/core/constants/image/image_path.dart';
import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:cocdaily_app/core/extensions/string_extension.dart';
import 'package:cocdaily_app/view/product/product_list/components/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../utils/locale_keys.g.dart';
import 'favorites_empty_view.dart';
class FavoritesView extends StatelessWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          
          BlocProvider<ProductCubit>(
              create: (BuildContext context) =>
                  ProductCubit()..fetchProductsFavorites()),
                  
      
        ],
        child: BlocBuilder<ProductCubit, ProductCubitState>(
          builder: (context, state) {
            return context.read<ProductCubit>().favoritesLength != 0
                ? ProductList(
                    isFavoritesView: true,
                    iconFavorite: Icons.close,
                    cardBackgroundColor: context.customColors!.yourPink,
                    stream: context
                        .read<ProductCubit>()
                        .collectionReferenceFavoritesCocktails
                        .snapshots(),
                    cardBackgroundName:
                        SVGImagePaths.instance!.favoritesCardSVG,
                    appBarTitle: LocaleKeys.app_bar_favorites_cocktails.locale,
                  )
                : const FavoritesEmptyView();
          },
        ));
  }
}