import 'package:cloud_firestore/cloud_firestore.dart';
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
          .doc('Alcoholic')
          .collection('AlcoholicCocktails');
  ProductCubit() : super(ProductCubitInitial());

  productInit(BuildContext context) async {
    try {
      emit(ProductCubitLoading());
    } catch (e) {}
  }

  alcoholicProduct() {}


}
