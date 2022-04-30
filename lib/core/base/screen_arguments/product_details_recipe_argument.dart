import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ScreenArgumentProductDetailsRecipe {
  final String? urlPhoto;
  final String? name;
  final String? recipe;
  final Color? cardBackgroundColor;
  final AsyncSnapshot<dynamic> snapshot;
  final QueryDocumentSnapshot<Object?> e;
  final bool changeIconColor;

  ScreenArgumentProductDetailsRecipe(
      {this.urlPhoto, this.name, this.recipe, this.cardBackgroundColor, required this.e,required this.snapshot, required this.changeIconColor});
}
