import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocdaily_app/core/extensions/string_extension.dart';
import 'package:cocdaily_app/utils/locale_keys.g.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../view/product/product_list/components/favorites_snack_bar.dart';
import '../../../constants/app/app_router_constants.dart';
import '../../screen_arguments/product_details_recipe_argument.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteCubitState> {
  FavoriteCubit() : super(FavoriteCubitInitial());
  bool isChange = false;

  Future addFavorite(BuildContext context, String name, String urlPhoto,
      String recipe, String recipeTR) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("UserFavoritesCocktails");
    return _collectionRef
        .doc(currentUser!.email)
        .collection("Cocktails")
        .doc()
        .set({
      "name": name,
      "urlPhoto": urlPhoto,
      "recipe": recipe,
      "recipeTR": recipeTR,
    }).then((value) => print("Added to favourite $name"));
  }

  nextDetailViewNavigate(
      BuildContext context,
      String name,
      String urlPhoto,
      String recipe,
      Color cardBackgroundColor,
      AsyncSnapshot<dynamic> snapshot,
      QueryDocumentSnapshot<Object?> e,
      bool changeColor) {
    Navigator.pushNamed(context, RouterConstant.PRODUCT_DETAIL_VIEW,
        arguments: ScreenArgumentProductDetailsRecipe(
            cardBackgroundColor: cardBackgroundColor,
            name: name,
            urlPhoto: urlPhoto,
            recipe: recipe,
            e: e,
            snapshot: snapshot,
            changeIconColor: changeColor));
  }

  Future deleteFavorite(BuildContext context, QueryDocumentSnapshot e) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("UserFavoritesCocktails");
    return _collectionRef
        .doc(currentUser!.email)
        .collection("Cocktails")
        .doc(e.id)
        .delete()
        .then((value) => print("DELETE "));
  }

  productDetailFavorites(BuildContext context, bool isFavoritesView,
      AsyncSnapshot<dynamic> snapshot, QueryDocumentSnapshot<Object?> e) {
    if (snapshot.data.docs.length == 0) {
      context.read<FavoriteCubit>().addFavorite(
          context, e["name"], e["urlPhoto"], e["recipe"], e["recipeTR"]);
      FavoritesSnackBar()
          .showSnackFavorites(context, LocaleKeys.favorites_added.locale);
    } else if (isFavoritesView == true) {
      context.read<FavoriteCubit>().deleteFavorite(context, e);
      FavoritesSnackBar().showSnackFavorites(
          context, LocaleKeys.favorites_removed_added.locale);
    } else {
      context.read<FavoriteCubit>().deleteFavorite(context, e);
      FavoritesSnackBar().showSnackFavorites(
          context, LocaleKeys.already_favorites_added.locale);
    }
  }
}
