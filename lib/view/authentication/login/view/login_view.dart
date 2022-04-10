import 'package:cocdaily_app/core/base/cubits/authentication_cubit/login_cubit/login_cubit.dart';
import 'package:cocdaily_app/core/components/widgets/buttons/forgot_password_button.dart';
import 'package:cocdaily_app/core/utility/shared/shared_prefs.dart';
import 'package:cocdaily_app/view/authentication/login/components/login_button.dart';
import 'package:cocdaily_app/core/components/widgets/cards/auth_background_bottom.dart';
import 'package:cocdaily_app/core/constants/app/text_constants.dart';
import 'package:cocdaily_app/core/constants/image/image_constants.dart';
import 'package:cocdaily_app/view/authentication/login/components/login_input_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import '../../../../core/components/widgets/cards/auth_background_top.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/widgets/snackbar/custom_snackbar.dart';
import '../../../../core/constants/app/app_router_constants.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(context),
      child: BlocConsumer<LoginCubit, LoginState>(
        listenWhen: (p, c) => p.status != c.status,
        listener: (context, state) {
          if (state.status.isSubmissionFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
                snackBarWhenFailure(snackBarFailureText: state.exceptionError));
          } else if (state.status.isSubmissionSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(snackBarWhenSuccess());
            Navigator.of(context).pushNamed(RouterConstant.HOME_VIEW);
            SharedPrefs.login();
          }
        },
        builder: (context, state) {
          return buildScaffold(context, state);
        },
      ),
    );
  }

  Scaffold buildScaffold(BuildContext context, LoginState state) => Scaffold(
      //key: viewModel.scaffoldState,
      resizeToAvoidBottomInset: false,
      body: buildBody(context, state));

  Column buildBody(BuildContext context, LoginState state) {
    return Column(
      children: [
        backgroundTopWidgetBuild(),
        SizedBox(
          height: 50.h,
        ),
        appLogoBuild(),
        SizedBox(
          height: 60.h,
        ),
        emailTextFormFieldBuild(context, state),
        SizedBox(
          height: 25.h,
        ),
        passwordTextFormFieldBuild(context, state),
        SizedBox(
          height: 15.h,
        ),
        forgotPasswordButtonBuild(),
        loginButtonBuild(context),
        const Spacer(),
        backgroundBottomWidgetBuild(context)
      ],
    );
  }

  AuthBackGroundBottom backgroundBottomWidgetBuild(BuildContext context) => AuthBackGroundBottom(
        onPressed: () =>Navigator.pushNamed(context, RouterConstant.REGISTER_VIEW),
        title: TextConstants.dontHaveAnAccount,
        titleButton: TextConstants.createAccount,
      );

  Padding loginButtonBuild(
    BuildContext context,
  ) {
    return Padding(
      padding: EdgeInsets.only(left: 175.w),
      child: const LoginButton(
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

  AuthBackGroundTop backgroundTopWidgetBuild() => const AuthBackGroundTop(
        title: TextConstants.loginTitle,
      );
  Image appLogoBuild() {
    return Image.asset(
      ImageConstants.instance.projectIcon,
      fit: BoxFit.cover,
    );
  }

  PasswordInputField passwordTextFormFieldBuild(
          BuildContext context, LoginState state) =>
      PasswordInputField(state: state);

  EmailInputField emailTextFormFieldBuild(
    BuildContext context,
    LoginState state,
  ) =>
      EmailInputField(state: state);
}
