import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit() : super(HomeCubitInitial());
  List products = [];
  var _firestoreInstance = FirebaseFirestore.instance;

  init(BuildContext context) async {
    emit(HomeCubitLoading());
    await fetchProducts();
    emit(HomeCubitCompleted());
  }

  fetchProducts() async {
    QuerySnapshot qn = await _firestoreInstance.collection("Cocktails").doc("Alcoholic").collection("AlcoholicCocktails").get();
    for (int i = 0; i < qn.docs.length; i++) {
      products.add({
        "name": qn.docs[i]["name"],
        "urlPhoto": qn.docs[i]["urlPhoto"],
        "recipe": qn.docs[i]["recipe"],
        "recipeTR": qn.docs[i]["recipeTR"],
      });
    }
    return qn.docs;
  }
}
