import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomTextFormField extends StatelessWidget {
  final String? labelText;
  final TextEditingController controller;
  final Icon? icon;
  

  const CustomTextFormField({Key? key, this.labelText, required this.controller, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          width: 288.w,
          height: 45.h,
          child: TextFormField(
           style: context.textTheme.overline,
            controller: controller,
            cursorColor: context.customColors!.doveGray,
            decoration: InputDecoration(
              iconColor: context.customColors!.doveGray,
              prefixIconColor: context.customColors!.doveGray,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                color: context.customColors!.doveGray,
              )),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              fillColor: context.customColors!.doveGray,
              labelText: labelText,
              labelStyle: context.textTheme.overline,
              prefixIcon: icon
            ),
          ),
        );
  }
}