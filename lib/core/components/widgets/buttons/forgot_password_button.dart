import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class ForgotPasswordButton extends StatelessWidget {
  final Function()? onPressed;
  final String? title;
  const ForgotPasswordButton({Key? key, this.onPressed, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shadowColor: MaterialStateProperty.all<Color>(context.customColors!.doveGray),
      ),
        onPressed: onPressed,
        child: Text(
          title!,
          style: context.textTheme.bodyText2!.copyWith(
              color: context.customColors!.doveGray,
              fontWeight: FontWeight.w100),
        ));
  }
}
