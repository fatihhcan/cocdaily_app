import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSubTitle extends StatelessWidget {
  final String? title;
  const CustomSubTitle({Key? key, this.title}) : super(key: key,);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 230.w),
          child: Text(
            title!,
            style: context.textTheme.headline3!.copyWith(fontSize: 25.sp),
          ),
        ),
        SizedBox(height: 5.h),
        Padding(
          padding: EdgeInsets.only(right: 230.w),
          child: Divider(
            thickness: 2,
            height: 1,
            color: context.customColors!.doveGray,
          ),
        ),
      ],
    );
  }
}
