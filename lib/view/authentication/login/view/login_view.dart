import 'package:cocdaily_app/core/base/cubits/authentication_cubit/login_cubit/login_cubit.dart';
import 'package:cocdaily_app/core/components/widgets/buttons/forgot_password_button.dart';
import 'package:cocdaily_app/core/components/widgets/cards/auth_background_bottom.dart';
import 'package:cocdaily_app/core/constants/image/image_constants.dart';
import 'package:cocdaily_app/core/extensions/string_extension.dart';
import 'package:cocdaily_app/core/utility/shared/shared_prefs.dart';
import 'package:cocdaily_app/view/authentication/login/components/forgot_password_alert_dialog.dart';
import 'package:cocdaily_app/view/authentication/login/components/login_button.dart';
import 'package:cocdaily_app/view/authentication/login/components/login_input_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';

import '../../../../core/components/widgets/cards/auth_background_top.dart';
import '../../../../core/components/widgets/snackbar/custom_snackbar.dart';
import '../../../../core/constants/app/app_router_constants.dart';
import '../../../../utils/locale_keys.g.dart';

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
          return WillPopScope(
            onWillPop: () async => false,
            child: buildScaffold(context, state));
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
        forgotPasswordButtonBuild(context),
        loginButtonBuild(context),
        const Spacer(),
        backgroundBottomWidgetBuild(context)
      ],
    );
  }

  AuthBackGroundBottom backgroundBottomWidgetBuild(BuildContext context) =>
      AuthBackGroundBottom(
        onPressed: () =>
            Navigator.pushNamed(context, RouterConstant.REGISTER_VIEW),
        title: LocaleKeys.dont_have_an_account.locale,
        titleButton: LocaleKeys.create_account.locale,
      );

  Padding loginButtonBuild(
    BuildContext context,
  ) {
    return Padding(
      padding: EdgeInsets.only(left: 175.w),
      child:  LoginButton(
        title: LocaleKeys.login_button.locale,
      ),
    );
  }

  ForgotPasswordButton forgotPasswordButtonBuild(BuildContext context) {
    return ForgotPasswordButton(
      onPressed: (() {
        ForgotPasswordAlertDialog().showMyDialog(context);
      }),
      title: LocaleKeys.forgot_password.locale,
    );
  }

  AuthBackGroundTop backgroundTopWidgetBuild() => AuthBackGroundTop(
        title: LocaleKeys.login_title.locale,
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
