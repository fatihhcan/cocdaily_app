import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterButton extends StatelessWidget {
  final Function()? onPressed;
  final String? title;
  const RegisterButton({Key? key, this.onPressed, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Column(
        children: [
          Text(
                title!,
                style: context.textTheme.headline3!.copyWith(fontWeight: FontWeight.w400,fontSize: 24.sp),
              ),
              SizedBox(height: 2.h,),
              SizedBox(width: 111.w, child: Divider(thickness: 1,height: 1,color: context.customColors!.doveGray,))
        ],
      ),
    );
  }
}
