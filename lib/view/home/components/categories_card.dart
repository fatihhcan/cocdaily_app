import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCategoriesCard extends StatelessWidget {
  final Color? color;
  final String? svgName;
  final String? categoriesTitle;
  final  EdgeInsetsGeometry? paddingTet;
  final void Function()? onTap;
  const CustomCategoriesCard({Key? key, this.color, this.svgName, this.categoriesTitle, this.paddingTet, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: color,
        elevation: 2,
         shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ),
        child: SvgPicture.asset(
          svgName!,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
