import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailRecipeCard extends StatelessWidget {
  final Color? cardBackgroundColor;
  final Widget? child;
  const DetailRecipeCard({Key? key, this.cardBackgroundColor, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 429.0.w,
      height: 422.0.h,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(56.0),
        ),
        color: cardBackgroundColor,
        border: Border.all(
          width: 1.0,
          color: cardBackgroundColor!,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            offset: const Offset(0, 3.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: child,
    );
  }
}
