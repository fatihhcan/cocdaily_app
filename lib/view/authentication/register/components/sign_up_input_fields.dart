import 'package:cocdaily_app/core/components/widgets/text_field/custom_text_form_field.dart';
import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/base/cubits/authentication_cubit/sign_up_cubit/sign_up_cubit.dart';
import '../../../../../core/constants/app/text_constants.dart';
import '../../../../core/utility/shared/shared_prefs.dart';

class NameInputField extends StatelessWidget {
  const NameInputField({Key? key, required this.state, this.controller})
      : super(key: key);
  final SignUpState state;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {

    return CustomTextFormField(
      controller: controller,
      labelText: TextConstants.fullName,
      icon: Icon(
        Icons.person,
        color: context.customColors!.doveGray,
        size: 20.h,
      ),
      hint: TextConstants.fullName,
      keyboardType: TextInputType.name,
      onChanged: (name) => context.read<SignUpCubit>().nameChanged(name),
    );
  }
}

class SignUpPageEmailInputField extends StatelessWidget {
  const SignUpPageEmailInputField({Key? key, required this.state})
      : super(key: key);
  final SignUpState state;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      labelText: TextConstants.email,
      icon: Icon(
        Icons.email,
        color: context.customColors!.doveGray,
        size: 20.h,
      ),
      hint: TextConstants.email,
      keyboardType: TextInputType.emailAddress,
      onChanged: (email) => context.read<SignUpCubit>().emailChanged(email),
    );
  }
}

class SignUpPagePasswordInputField extends StatelessWidget {
  const SignUpPagePasswordInputField({Key? key, required this.state})
      : super(key: key);
  final SignUpState state;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      labelText: TextConstants.password,
      icon: Icon(
        Icons.key,
        color: context.customColors!.doveGray,
        size: 20.h,
      ),
      hint: TextConstants.password,
      isPasswordField: true,
      keyboardType: TextInputType.text,
      onChanged: (password) =>
          context.read<SignUpCubit>().passwordChanged(password),
    );
  }
}

class RePasswordInputField extends StatelessWidget {
  const RePasswordInputField({Key? key, required this.state}) : super(key: key);
  final SignUpState state;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hint: 'Re-Password',
      isPasswordField: true,
      keyboardType: TextInputType.text,
      onChanged: (rePassword) =>
          context.read<SignUpCubit>().rePasswordChanged(rePassword),
    );
  }
}
