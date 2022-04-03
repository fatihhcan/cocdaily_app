import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomTextFormField extends StatelessWidget {
  final String? labelText;
 // final TextEditingController controller;
  final Icon? icon;
  final ValueChanged<String> onChanged;
  final TextInputType? keyboardType;
  final String? errorText;
  final bool isPasswordField;
  final bool isRequiredField;
  final String hint;
  

  const CustomTextFormField({Key? key, this.labelText,  this.icon, required this.onChanged, this.keyboardType, this.errorText,  this.isPasswordField=false,  this.isRequiredField=false, this.hint=''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          width: 288.w,
          height: 45.h,
          child: TextFormField(
           style: context.textTheme.overline,
         //   controller: controller,
            cursorColor: context.customColors!.doveGray,
            onChanged: onChanged,
            keyboardType: keyboardType,
            obscureText: isPasswordField,
            decoration: InputDecoration(
            hintText: isRequiredField ? '$hint*' : hint,

            //errorText: errorText,
            
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