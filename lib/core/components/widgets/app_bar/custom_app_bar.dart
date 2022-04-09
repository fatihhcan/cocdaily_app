import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../constants/app/text_constants.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.customColors!.doveGray,
      title: Text(TextConstants.appBarNonAlcoholicCocktails,style: context.textTheme.headline4!.copyWith(color: Colors.white),),
      leading: IconButton(onPressed: (){}, icon: Icon( Icons.keyboard_arrow_left, color: Colors.white,)),
      //actions: [settingsButton(context)],
    );
  }
}