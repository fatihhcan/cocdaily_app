
import 'package:cocdaily_app/core/components/widgets/text_field/custom_text_form_field.dart';
import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/base/cubits/authentication_cubit/login_cubit/login_cubit.dart';
import '../../../../core/constants/app/text_constants.dart';


class EmailInputField extends StatelessWidget {
  const EmailInputField({Key? key, required this.state}) : super(key: key);
  final LoginState state;
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
      errorText: state.email.error?.name,

      onChanged: (email) => context.read<LoginCubit>().emailChanged(email),
    );
  }
}

class PasswordInputField extends StatelessWidget {
  const PasswordInputField({Key? key, required this.state}) : super(key: key);
  final LoginState state;
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
      errorText: state.password.error?.name,
      onChanged: (password) => context.read<LoginCubit>().passwordChanged(password),
    );
  }
}
