import 'package:cocdaily_app/core/base/cubits/authentication_cubit/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:cocdaily_app/core/extensions/string_extension.dart';
import 'package:cocdaily_app/utils/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/components/widgets/text_field/custom_text_form_field.dart';
import '../../../product/product_list/components/favorites_snack_bar.dart';

class ForgotPasswordAlertDialog {
  TextEditingController controller = TextEditingController();
  Future<void> showMyDialog(BuildContext context) async {
    return showDialog<void>(
      
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            LocaleKeys.password_reset.locale,
            style: context.textTheme.headline3!.copyWith(
              color: Colors.white,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                CustomTextFormField(
                  controller: controller,
                  labelText: LocaleKeys.email.locale,
                  icon: Icon(
                    Icons.email,
                    color: context.customColors!.doveGray,
                    size: 20.h,
                  ),
                  hint: LocaleKeys.email.locale,
                  keyboardType: TextInputType.emailAddress,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text(
                LocaleKeys.password_reset.locale,
                style: context.textTheme.bodyText2,
              ),
              onPressed: () {
                context
                    .read<ForgotPasswordCubit>()
                    .resetPassword(context, controller.text);
                FavoritesSnackBar().showSnackFavorites(
                    context, LocaleKeys.password_reset_email_sent.locale,);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
