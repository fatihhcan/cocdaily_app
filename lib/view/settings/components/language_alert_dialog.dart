import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:cocdaily_app/core/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import '../../../core/components/widgets/list_tile/language_list_tile.dart';
import '../../../core/constants/app/locale_constant.dart';
import '../../../utils/locale_keys.g.dart';

class LanguageAlertDialog {
  TextEditingController controller = TextEditingController();
  Future<void> showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            LocaleKeys.language.locale,
            style: context.textTheme.headline3!.copyWith(
              color: Colors.white,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                LanguageSettingsListTile(
                  localeEN: LocaleConstant.EN_LOCALE,
                  localeTR: LocaleConstant.TR_LOCALE,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text(
                LocaleKeys.select_lang.locale,
                style: context.textTheme.bodyText2,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
