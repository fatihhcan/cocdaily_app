import 'dart:math';

import 'package:cocdaily_app/core/components/widgets/buttons/forgot_password_button.dart';
import 'package:cocdaily_app/core/components/widgets/buttons/login_button.dart';
import 'package:cocdaily_app/core/components/widgets/cards/auth_background_bottom.dart';
import 'package:cocdaily_app/core/components/widgets/text_field/custom_text_form_field.dart';
import 'package:cocdaily_app/core/constants/app/text_constants.dart';
import 'package:cocdaily_app/core/constants/image/image_constants.dart';
import 'package:cocdaily_app/core/constants/image/image_path.dart';
import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/components/widgets/buttons/register_button.dart';
import '../../../../core/components/widgets/cards/auth_background_top.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _email = TextEditingController();
    TextEditingController _password = TextEditingController();
    TextEditingController _fullName = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          backgroundTopWidgetBuild(),
          SizedBox(
            height: 25.h,
          ),
          Text(TextConstants.welcomeTo,style: context.textTheme.headline1!.copyWith(fontWeight: FontWeight.w500)),
          appLogoBuild(),
          SizedBox(
            height: 60.h,
          ),
          fullNameTextFormFieldBuild(_fullName, context),
          SizedBox(
            height: 25.h,
          ),
          emailTextFormFieldBuild(_email, context),
          SizedBox(
            height: 25.h,
          ),
          passwordTextFormFieldBuild(_password, context),
          SizedBox(
            height: 15.h,
          ),
          registerButtonBuild(),
          const Spacer(),
          backgroundBottomWidgetBuild()
        ],
      ),
    );
  }

  AuthBackGroundBottom backgroundBottomWidgetBuild() => AuthBackGroundBottom(
        onPressed: () {},
        title: TextConstants.alreadyHaveAnAccount,
        titleButton: TextConstants.loginButton,
      );

  Padding registerButtonBuild() {
    return Padding(
      padding: EdgeInsets.only(left: 175.w),
      child: RegisterButton(
        onPressed: (() {}),
        title: TextConstants.registerButton,
      ),
    );
  }

  ForgotPasswordButton forgotPasswordButtonBuild() {
    return ForgotPasswordButton(
      onPressed: (() {}),
      title: TextConstants.forgotPassword,
    );
  }

  AuthBackGroundTop backgroundTopWidgetBuild() => AuthBackGroundTop(
        title: TextConstants.registerTitle,
      );
  Image appLogoBuild() {
    return Image.asset(
      ImageConstants.instance.projectIcon,
      fit: BoxFit.cover,
    );
  }

  CustomTextFormField passwordTextFormFieldBuild(
          TextEditingController _password, BuildContext context) =>
      CustomTextFormField(
        controller: _password,
        labelText: TextConstants.password,
        icon: Icon(
          Icons.key,
          color: context.customColors!.doveGray,
          size: 20.h,
        ),
      );

  CustomTextFormField emailTextFormFieldBuild(
          TextEditingController _email, BuildContext context) =>
      CustomTextFormField(
        controller: _email,
        labelText: TextConstants.email,
        icon: Icon(
          Icons.email,
          color: context.customColors!.doveGray,
          size: 20.h,
        ),
      );
  
  CustomTextFormField fullNameTextFormFieldBuild(
          TextEditingController _fullName, BuildContext context) =>
      CustomTextFormField(
        controller: _fullName,
        labelText: TextConstants.fullName,
        icon: Icon(
          Icons.person,
          color: context.customColors!.doveGray,
          size: 20.h,
        ),
      );
}
