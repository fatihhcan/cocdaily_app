import 'package:bloc/bloc.dart';
import 'package:cocdaily_app/core/constants/app/app_router_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_oauth/firebase_auth_oauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../utility/shared/shared_prefs.dart';
import '../../../validations/email.dart';
import '../../../validations/password.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.context) : super(const LoginState.initial());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final BuildContext context;

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([email, state.password]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([state.email, password]),
    ));
  }

  void logInWithCredentials() async {
    try {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      await _auth.signInWithEmailAndPassword(
          email: state.email.value, password: state.password.value);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
      await SharedPrefs.setUserEmail(_auth.currentUser!.email!);
      print(_auth.currentUser!.email!);
    } on FirebaseAuthException catch (error) {
      emit(state.copyWith(
          exceptionError: error.message.toString(),
          status: FormzStatus.submissionFailure));
    } on PlatformException catch (error) {
      emit(state.copyWith(
          exceptionError: error.message.toString(),
          status: FormzStatus.submissionFailure));
    } catch (error) {
      emit(state.copyWith(
          exceptionError: "Unexpected error please try again later",
          status: FormzStatus.submissionFailure));
    }
  }

  Future<void> performLogin(
      {required String provider,
      required scopes,
      Map<String, String>? parameters}) async {
    await FirebaseAuthOAuth()
        .openSignInFlow(provider, scopes, parameters)
        .then((value) => value);
  }

  void resetPassword() async {
    try {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      await _auth.sendPasswordResetEmail(email: state.email.value);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on FirebaseAuthException catch (error) {
      emit(state.copyWith(
          exceptionError: error.message.toString(),
          status: FormzStatus.submissionFailure));
    } on PlatformException catch (error) {
      emit(state.copyWith(
          exceptionError: error.message.toString(),
          status: FormzStatus.submissionFailure));
    } catch (error) {
      emit(state.copyWith(
          exceptionError: "Unexpected error please try again later",
          status: FormzStatus.submissionFailure));
    }
  }

  void signOut() async {
    try {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      await _auth.signOut();
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on FirebaseAuthException catch (error) {
      emit(state.copyWith(
          exceptionError: error.message.toString(),
          status: FormzStatus.submissionFailure));
    } on PlatformException catch (error) {
      emit(state.copyWith(
          exceptionError: error.message.toString(),
          status: FormzStatus.submissionFailure));
    } catch (error) {
      emit(state.copyWith(
          exceptionError: "Unexpected error please try again later",
          status: FormzStatus.submissionFailure));
    }
  }
}
