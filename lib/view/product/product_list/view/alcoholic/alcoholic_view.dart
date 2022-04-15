import 'package:cocdaily_app/core/base/cubits/product_cubit/product_cubit.dart';
import 'package:cocdaily_app/core/constants/app/text_constants.dart';
import 'package:cocdaily_app/core/constants/image/image_path.dart';
import 'package:cocdaily_app/view/product/product_list/components/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlcoholicView extends StatelessWidget {
  const AlcoholicView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProductList(
      stream: context
          .read<ProductCubit>()
          .collectionReferenceAlcoholicCocktails
          .snapshots(),
      cardBackgroundName: SVGImagePaths.instance!.alcoholicCardSVG,
      appBarTitle: TextConstants.appBarAlcoholicCocktails,
      
    );
  }
}
