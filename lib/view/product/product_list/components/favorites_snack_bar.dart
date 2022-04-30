import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:cocdaily_app/core/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import '../../../../utils/locale_keys.g.dart';


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
        label: LocaleKeys.undo.locale,
        onPressed: () {
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
