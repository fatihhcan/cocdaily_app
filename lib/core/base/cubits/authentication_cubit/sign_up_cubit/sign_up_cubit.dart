import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../utility/shared/shared_prefs.dart';
import '../../../validations/email.dart';
import '../../../validations/name.dart';
import '../../../validations/password.dart';
import '../../../validations/re_password.dart';

part 'sign_up_state.dart';
part 'sign_up_cubit.freezed.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(const SignUpState.initial());
  final TextEditingController nameController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status:
          Formz.validate([state.name, email, state.password, state.rePassword]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      status:
          Formz.validate([state.name, state.email, password, state.rePassword]),
    ));
  }

  void nameChanged(String value) {
    final name = Name.dirty(value);
    emit(state.copyWith(
      name: name,
      status:
          Formz.validate([name, state.email, state.password, state.rePassword]),
    ));
  }

  void signUpWithCredentials() async {
    try {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      await _auth.createUserWithEmailAndPassword(
          email: state.email.value, password: state.password.value).then((value) {
      FirebaseFirestore.instance
          .collection('UserData')
          .doc(value.user!.uid)
          .set({"email": value.user!.email, "name":nameController.text});
      firebaseSetUserUid(value.user!.uid);
    });
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
      await SharedPrefs.setUserName(nameController.text);
      await SharedPrefs.setUserEmail(state.email.value);
  
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
  firebaseSetUserUid(String uid) async {
  var db = FirebaseFirestore.instance;
  DocumentReference ref = db.collection('UserData').doc(uid);
  ref.set(
    {'uid': uid},
    SetOptions(
      merge: true,
    ),
  );
}

}
