import 'package:cocdaily_app/core/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import '../../../../utils/locale_keys.g.dart';

SnackBar snackBarWhenFailure({required String snackBarFailureText}) {
  return SnackBar(
    content: Text(snackBarFailureText),
    backgroundColor: Colors.red,
  );
}

SnackBar snackBarWhenSuccess() {
  return  SnackBar(
    content: Text(LocaleKeys.success.locale),
    backgroundColor: Colors.green,
  );
}
