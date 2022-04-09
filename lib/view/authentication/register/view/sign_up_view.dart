import 'package:cocdaily_app/core/components/widgets/buttons/forgot_password_button.dart';
import 'package:cocdaily_app/core/components/widgets/cards/auth_background_bottom.dart';
import 'package:cocdaily_app/core/constants/app/text_constants.dart';
import 'package:cocdaily_app/core/constants/image/image_constants.dart';
import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import '../../../../core/base/cubits/authentication_cubit/sign_up_cubit/sign_up_cubit.dart';
import '../../../../core/components/widgets/cards/auth_background_top.dart';
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
        Text(TextConstants.welcomeTo,
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
        backgroundBottomWidgetBuild()
      ],
    );
  }

  AuthBackGroundBottom backgroundBottomWidgetBuild() => AuthBackGroundBottom(
        onPressed: () {},
        title: TextConstants.alreadyHaveAnAccount,
        titleButton: TextConstants.loginButton,
      );

  Padding registerButtonBuild(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 175.w),
      child: SignUpButton(
        onPressed: (() {
          context.read<SignUpCubit>().signUpWithCredentials();
        }),
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

  AuthBackGroundTop backgroundTopWidgetBuild() => const AuthBackGroundTop(
        title: TextConstants.registerTitle,
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
      NameInputField(state: state,);
}
