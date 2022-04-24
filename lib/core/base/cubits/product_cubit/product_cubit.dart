import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductCubitState> {
  final CollectionReference collectionReferenceAlcoholicCocktails =
      FirebaseFirestore.instance
          .collection('Cocktails')
          .doc('Alcoholic')
          .collection('AlcoholicCocktails');
  final CollectionReference collectionReferenceNonAlcoholicCocktails =
      FirebaseFirestore.instance
          .collection('Cocktails')
          .doc('NonAlcoholic')
          .collection('NonAlcoholicCocktails');
  final CollectionReference collectionReferenceClassicAlcoholicCocktails =
      FirebaseFirestore.instance
          .collection('Cocktails')
          .doc('Classic')
          .collection('ClassicCocktails');
  late CollectionReference collectionReferenceFavoritesCocktails;
  List productsFavorites = [];
  List productsAlcoholic = [];
  List productsNonAlcoholic = [];
  List productsClassic = [];
  List _products = [];
  var _firestoreInstance = FirebaseFirestore.instance;
  ProductCubit() : super(ProductCubitInitial());

  productInit(BuildContext context) async {
    emit(ProductCubitLoading());
    await fetchProductsAlcoholic();
    await fetchProductsNonAlcoholic();
    await fetchProductsClassic();
    emit(ProductCubitCompleted());
  }

  fetchProductsAlcoholic() async {
    QuerySnapshot qn = await collectionReferenceAlcoholicCocktails.get();

    for (int i = 0; i < qn.docs.length; i++) {
      productsAlcoholic.add({
        "name": qn.docs[i]["name"],
        "urlPhoto": qn.docs[i]["urlPhoto"],
        "recipe": qn.docs[i]["recipe"],
      });
      productsAlcoholic[i];
    }
    return qn.docs;
  }

  fetchProductsNonAlcoholic() async {
    QuerySnapshot qn = await collectionReferenceNonAlcoholicCocktails.get();

    for (int i = 0; i < qn.docs.length; i++) {
      productsNonAlcoholic.add({
        "name": qn.docs[i]["name"],
        "urlPhoto": qn.docs[i]["urlPhoto"],
        "recipe": qn.docs[i]["recipe"],
      });
      productsNonAlcoholic[i];
    }
    return qn.docs;
  }

  fetchProductsFavorites() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    collectionReferenceFavoritesCocktails = FirebaseFirestore.instance
        .collection('UserFavoritesCocktails')
        .doc(currentUser!.email)
        .collection("Cocktails");
    QuerySnapshot qn = await collectionReferenceFavoritesCocktails.get();

    for (int i = 0; i < qn.docs.length; i++) {
      productsFavorites.add({
        "name": qn.docs[i]["name"],
        "urlPhoto": qn.docs[i]["urlPhoto"],
        "recipe": qn.docs[i]["recipe"],
      });
      productsFavorites[i];
    }
    return qn.docs;
  }

  fetchProductsClassic() async {
    QuerySnapshot qn = await collectionReferenceClassicAlcoholicCocktails.get();

    for (int i = 0; i < qn.docs.length; i++) {
      productsClassic.add({
        "name": qn.docs[i]["name"],
        "urlPhoto": qn.docs[i]["urlPhoto"],
        "recipe": qn.docs[i]["recipe"],
      });
      productsClassic[i];
    }
    return qn.docs;
  }
}
