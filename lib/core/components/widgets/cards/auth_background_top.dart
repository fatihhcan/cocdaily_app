import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/image/image_path.dart';

class AuthBackGroundTop extends StatelessWidget {
  final String title;
   AuthBackGroundTop({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          SVGImagePaths.instance!.rectangleTopSVG,
          fit: BoxFit.cover,
        ),
         Padding(
           padding: context.paddingLowOnly,
           child: Text(
            title,
            style: context.textTheme.headline1!.copyWith(color: context.customColors!.wildSand),
            textAlign: TextAlign.center,
        ),
         )
      ],
    );
  }
}
