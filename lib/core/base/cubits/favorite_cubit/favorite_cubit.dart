import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteCubitState> {
  FavoriteCubit() : super(FavoriteCubitInitial());

/*   init(BuildContext context) async {
    emit(FavoriteCubitLoading());
    await context.read<ProductCubit>().fetchProductsAlcoholic();
    emit(FavoriteCubitCompleted());

    //setActiveAddress(activeAddressId);
  } */

  Future addFavorite(BuildContext context,String name,String urlPhoto, String recipe) async {
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
}
