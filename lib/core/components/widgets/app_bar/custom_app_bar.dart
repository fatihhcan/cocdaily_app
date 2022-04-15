import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../constants/app/app_router_constants.dart';
import '../../../constants/app/text_constants.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
      AppBar build(BuildContext context) {
    return AppBar(
      backgroundColor: context.customColors!.doveGray,
      title: Text(
        TextConstants.appBarAlcoholicCocktails,
        style: context.textTheme.headline4!.copyWith(color: Colors.white),
      ),
      leading: IconButton(
          onPressed: () =>
              Navigator.pushNamedAndRemoveUntil(context, RouterConstant.HOME_VIEW,
        ModalRoute.withName('/homeView')),
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
          )),
      //actions: [settingsButton(context)],
    );
  }
}