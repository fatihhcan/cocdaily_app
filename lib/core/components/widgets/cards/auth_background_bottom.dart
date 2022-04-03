import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/image/image_path.dart';

class AuthBackGroundBottom extends StatelessWidget {
  final String? title;
  final String? titleButton;
  final Function()? onPressed;
  const AuthBackGroundBottom({Key? key, required this.title, this.titleButton, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          SVGImagePaths.instance!.rectangleBottomSVG,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: EdgeInsets.only(left: 120.w, top: 110.h),
          child: Column(
            children: [
              Text(
                title!,
                style: context.textTheme.headline4!
                    .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w400),
              ),
              TextButton(
                onPressed: onPressed,
                child: Text(titleButton!,
                    style: context.textTheme.headline4!.copyWith(
                        fontSize: 16.sp, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        )
      ],
    );
  }
}
