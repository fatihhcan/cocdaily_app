import 'package:cocdaily_app/core/base/cubits/language_cubit/language_cubit.dart';
import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:cocdaily_app/core/extensions/string_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/locale_keys.g.dart';

class LanguageSettingsListTile extends StatelessWidget {
  final String? languageTitle;
  final Locale? localeTR;
  final Locale? localeEN;
  bool trState = false;
  bool enState = false;
   LanguageSettingsListTile({
    Key? key,
    this.languageTitle,
    this.localeTR,
    this.localeEN,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildListTileTR(context),
        SizedBox(
          height: 5.h,
        ),
        buildListTileEN(context),
      ],
    );
  }

  ListTile buildListTileEN(BuildContext context) {
    return ListTile(
        leading: context.locale == localeEN
            ? Icon(Icons.check_box_rounded)
            : Icon(Icons.check_box_outline_blank),
        tileColor: context.customColors!.doveGray,
        title: Text(LocaleKeys.en_lang.locale),
        onTap: () {
          enState = true;
          context.read<LanguageCubit>().setLangState(enState);
          context.setLocale(localeEN!);
        },
      );
  }

  ListTile buildListTileTR(BuildContext context) {
    return ListTile(
        leading: context.locale == localeTR
            ? Icon(Icons.check_box_rounded)
            : Icon(Icons.check_box_outline_blank),
        tileColor: context.customColors!.doveGray,
        title: Text(LocaleKeys.tr_lang.locale),
        onTap: () {
          context.setLocale(localeTR!);
           trState = false;
          context.read<LanguageCubit>().setLangState(trState); 
        },
      );
  }
}
