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

import '../../../../core/components/widgets/cards/auth_background_top.dart';
import '../service/login_service.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _email = TextEditingController();
    TextEditingController _password = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          backgroundTopWidgetBuild(),
          SizedBox(
            height: 50.h,
          ),
          appLogoBuild(),
          SizedBox(
            height: 60.h,
          ),
          emailTextFormFieldBuild(_email, context),
          SizedBox(
            height: 25.h,
          ),
          passwordTextFormFieldBuild(_password, context),
          SizedBox(
            height: 15.h,
          ),
          forgotPasswordButtonBuild(),
          loginButtonBuild(),
          const Spacer(),
          backgroundBottomWidgetBuild()
        ],
      ),
    );
  }

  AuthBackGroundBottom backgroundBottomWidgetBuild() => AuthBackGroundBottom(
        onPressed: () {},
        title: TextConstants.dontHaveAnAccount,
        titleButton: TextConstants.createAccount,
      );

  Padding loginButtonBuild() {
    return Padding(
      padding: EdgeInsets.only(left: 175.w),
      child: LoginButton(
        onPressed: (() {}),
        title: TextConstants.loginButton,
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
        title: TextConstants.loginTitle,
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
}
