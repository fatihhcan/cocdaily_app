import 'package:cocdaily_app/core/base/cubits/authentication_cubit/forgot_password_cubit/forgot_password_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordCubitState> {
  ForgotPasswordCubit() : super(ForgotPasswordCubitInitial());

  Future resetPassword(BuildContext context, String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

  }
}
