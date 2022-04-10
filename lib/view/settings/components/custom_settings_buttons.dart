import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomSettingsButtons extends StatelessWidget {
  final void Function()? onTap;
  final String? title;
  const CustomSettingsButtons({Key? key, this.onTap, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: context.paddingLowVertical,
      width: 300.w,
      height: 68.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21.0),
        color: Colors.white,
        border: Border.all(
          width: 1,
          color: Colors.white,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            offset: const Offset(0, 3.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Text(title!, textAlign: TextAlign.center, style: context.textTheme.headline3!.copyWith(fontSize: 25.sp),),
      ),
    );
  }
}