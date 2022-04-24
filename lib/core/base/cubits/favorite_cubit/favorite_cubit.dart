import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../view/product/product_list/components/favorites_snack_bar.dart';
import '../../../constants/app/app_router_constants.dart';
import '../../../constants/app/text_constants.dart';
import '../../screen_arguments/product_details_recipe_argument.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteCubitState> {
  FavoriteCubit() : super(FavoriteCubitInitial());
  bool isChange = false;

/*   init(BuildContext context) async {
    emit(FavoriteCubitLoading());
    await context.read<ProductCubit>().fetchProductsAlcoholic();
    emit(FavoriteCubitCompleted());

    //setActiveAddress(activeAddressId);
  } */

  Future addFavorite(
      BuildContext context, String name, String urlPhoto, String recipe) async {
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
    }).then((value) => print("Added to favourite $name"));
  }

  nextDetailViewNavigate(BuildContext context, String name, String urlPhoto,
      String recipe, Color cardBackgroundColor,AsyncSnapshot<dynamic> snapshot,QueryDocumentSnapshot<Object?> e) {
    Navigator.pushNamed(context, RouterConstant.PRODUCT_DETAIL_VIEW,
        arguments: ScreenArgumentProductDetailsRecipe(
          cardBackgroundColor: cardBackgroundColor,
          name: name,
          urlPhoto: urlPhoto,
          recipe: recipe,
          e: e,
          snapshot: snapshot
        ));
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

  productDetailFavorites(BuildContext context, bool isFavoritesView, AsyncSnapshot<dynamic> snapshot,QueryDocumentSnapshot<Object?> e
){
        if (snapshot.data.docs.length == 0) {
                        context.read<FavoriteCubit>().addFavorite(
                            context, e["name"], e["urlPhoto"], e["recipe"]);
                        FavoritesSnackBar().showSnackFavorites(context, TextConstants.favoritesAdded);
                      } else if (isFavoritesView == true) {
                        context
                            .read<FavoriteCubit>()
                            .deleteFavorite(context, e);
                        FavoritesSnackBar()
                            .showSnackFavorites(context, TextConstants.favoritesRemovedFromFavorites);
                      } else {
                        context
                            .read<FavoriteCubit>()
                            .deleteFavorite(context, e);
                        FavoritesSnackBar()
                            .showSnackFavorites(context, TextConstants.alreadyFavoritesAdded);
                      }
  }
}
