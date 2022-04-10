import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app/text_constants.dart';

class CustomWelcomeCard extends StatelessWidget {
  final String? userFullName;
  const CustomWelcomeCard({Key? key, this.userFullName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.customColors!.manatee,
        child: Container(
      padding: context.paddingLowHorizontal,
      height: 60.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            TextConstants.welcomeToTheCocktailWorld,
            style: context.textTheme.headline4!
                .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          Expanded(
            child: AnimatedTextKit(animatedTexts: [
              //SharedPrefs.Name
              TyperAnimatedText('$userFullName.',
                  textStyle: context.textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15.sp))
            ]),
          ),
        ],
      ),
    ));
  }
}
