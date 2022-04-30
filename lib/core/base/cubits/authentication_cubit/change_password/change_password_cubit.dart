import 'package:cocdaily_app/core/extensions/string_extension.dart';
import 'package:cocdaily_app/utils/locale_keys.g.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../view/product/product_list/components/favorites_snack_bar.dart';
import 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordCubitState> {
  ChangePasswordCubit() : super(ChangePasswordCubitInitial());
  final newPasswordController = TextEditingController();
  final currentUser = FirebaseAuth.instance.currentUser;

  Future changePassword(BuildContext context, String newPassword) async {
   try {
      await currentUser!.updatePassword(newPassword);
    FirebaseAuth.instance.signOut();
   
      FavoritesSnackBar().showSnackFavorites(
                    context,LocaleKeys.password_has_been_changed.locale);
   } catch (e) {
   }
  }
}
