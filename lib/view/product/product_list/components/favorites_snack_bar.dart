import 'package:cocdaily_app/core/constants/app/text_constants.dart';
import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';


class FavoritesSnackBar {
  showSnackFavorites(BuildContext context, String description) {
    final snackBar = SnackBar(
      content: Text(
        description,
        style: context.textTheme.bodyText2!
            .copyWith(color: context.customColors!.doveGray),
      ),
      backgroundColor: context.customColors!.yourPink,
      action: SnackBarAction(
        label: TextConstants.undo,
        onPressed: () {
          print("UNDO");
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
