import 'package:cocdaily_app/core/components/widgets/buttons/forgot_password_button.dart';
import 'package:cocdaily_app/core/components/widgets/cards/auth_background_bottom.dart';
import 'package:cocdaily_app/core/constants/image/image_constants.dart';
import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:cocdaily_app/core/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import '../../../../core/base/cubits/authentication_cubit/sign_up_cubit/sign_up_cubit.dart';
import '../../../../core/components/widgets/cards/auth_background_top.dart';
import '../../../../core/constants/app/app_router_constants.dart';
import '../../../../core/utility/shared/shared_prefs.dart';
import '../../../../utils/locale_keys.g.dart';
import '../components/sign_up_button.dart';
import '../components/sign_up_input_fields.dart';


class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          var snackBar = SnackBar(
              content: Text(state.exceptionError), backgroundColor: Colors.red);
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else if (state.status.isSubmissionSuccess) {
          var snackBar = const SnackBar(
              content: Text("Success!"), backgroundColor: Colors.green);
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.of(context).pushNamed(RouterConstant.HOME_VIEW);
          SharedPrefs.login();
        }
      },
      builder: (context, state) {
        return buildScaffold(context,state);
      },
    );
  }

  Scaffold buildScaffold(BuildContext context,SignUpState state) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: buildBody(context,state),
    );
  }

  Column buildBody(BuildContext context,SignUpState state) {
    return Column(
      children: [
        backgroundTopWidgetBuild(),
        SizedBox(
          height: 25.h,
        ),
        Text(LocaleKeys.welcome_to.locale,
            style: context.textTheme.headline1!
                .copyWith(fontWeight: FontWeight.w500)),
        appLogoBuild(),
        SizedBox(
          height: 60.h,
        ),
        fullNameTextFormFieldBuild(state, context),
        SizedBox(
          height: 25.h,
        ),
        emailTextFormFieldBuild(state, context),
        SizedBox(
          height: 25.h,
        ),
        passwordTextFormFieldBuild(state, context),
        SizedBox(
          height: 15.h,
        ),
        registerButtonBuild(context),
        const Spacer(),
        backgroundBottomWidgetBuild(context)
      ],
    );
  }

  AuthBackGroundBottom backgroundBottomWidgetBuild(BuildContext context) => AuthBackGroundBottom(
        onPressed: () => Navigator.pushNamed(context, RouterConstant.LOGIN_VIEW),
        title: LocaleKeys.already_have_an_account.locale,
        titleButton: LocaleKeys.login_button.locale,
      );

  Padding registerButtonBuild(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 175.w),
      child: SignUpButton(
        onPressed: (() {
          context.read<SignUpCubit>().signUpWithCredentials();
        }),
        title: LocaleKeys.register_button.locale,
      ),
    );
  }

  ForgotPasswordButton forgotPasswordButtonBuild() {
    return ForgotPasswordButton(
      onPressed: (() {}),
      title: LocaleKeys.forgot_password.locale,
    );
  }

  AuthBackGroundTop backgroundTopWidgetBuild() =>  AuthBackGroundTop(
        title: LocaleKeys.register_title.locale,
      );
  Image appLogoBuild() {
    return Image.asset(
      ImageConstants.instance.projectIcon,
      fit: BoxFit.cover,
    );
  }

  SignUpPagePasswordInputField passwordTextFormFieldBuild(
        SignUpState state, BuildContext context) =>
     SignUpPagePasswordInputField(state: state);

  SignUpPageEmailInputField emailTextFormFieldBuild(
         SignUpState state, BuildContext context) =>
      SignUpPageEmailInputField(

       state: state,
      );

  NameInputField fullNameTextFormFieldBuild(
          SignUpState state , BuildContext context) =>
      NameInputField(state: state,controller: context.read<SignUpCubit>().nameController,);
}
