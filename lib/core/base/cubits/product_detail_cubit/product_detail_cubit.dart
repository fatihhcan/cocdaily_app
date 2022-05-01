import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../favorite_cubit/favorite_cubit.dart';
import '../language_cubit/language_cubit.dart';

part 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailCubitState> {

  ProductDetailCubit()
      : super(ProductDetailCubitInitial());


  nextDetailView(BuildContext context,  QueryDocumentSnapshot<Object?> e,
  bool isFavoritesView,
  Color? cardBackgroundColor,
  AsyncSnapshot<dynamic> snapshot) async {

    if (context.read<LanguageCubit>().state == false) {
      await context.read<FavoriteCubit>().nextDetailViewNavigate(
          context,
          e["name"],
          e["urlPhoto"],
          e["recipeTR"],
          cardBackgroundColor!,
          snapshot,
          e,
          isFavoritesView ? true : false);
    } else {
      await context.read<FavoriteCubit>().nextDetailViewNavigate(
          context,
          e["name"],
          e["urlPhoto"],
          e["recipe"],
          cardBackgroundColor!,
          snapshot,
          e,
          isFavoritesView ? true : false);
    }
  }

}
