import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';


class HomeCubit extends Cubit<HomeCubitState> {
  final CollectionReference collectionReferenceAlcoholicCocktails = FirebaseFirestore.instance
        .collection('UserData')
        .doc('Alcoholic')
        .collection('AlcoholicCocktails');


  HomeCubit() : super(HomeCubitInitial());

  productInit(BuildContext context) async {
    try {
      emit(HomeCubitLoading());
     
    } catch (e) {}
  }


  alcoholicProduct(){

  }
}
