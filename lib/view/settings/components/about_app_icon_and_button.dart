import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutAppIconAndButton extends StatelessWidget {
  final String? textButtonTitle;
  final String? routeName;
  final IconData? icon;
  const AboutAppIconAndButton({Key? key, this.textButtonTitle, this.routeName, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon!),
        SizedBox(
          width: 5.w,
        ),
        TextButton(
          child: Text(textButtonTitle!, style: context.textTheme.bodyText2),
          onPressed: () {
            Navigator.pushNamed(context, routeName!);
          },
        )
      ],
    );
  }
}
