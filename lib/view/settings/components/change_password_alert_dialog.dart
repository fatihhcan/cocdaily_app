import 'package:cocdaily_app/core/base/cubits/authentication_cubit/change_password/change_password_cubit.dart';
import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:cocdaily_app/core/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/components/widgets/text_field/custom_text_form_field.dart';
import '../../../core/constants/app/app_router_constants.dart';
import '../../../utils/locale_keys.g.dart';
import '../../product/product_list/components/favorites_snack_bar.dart';

class ChangePasswordAlertDialog {
  TextEditingController controller = TextEditingController();
  Future<void> showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            buildChangePasswordTitle.locale,
            style: context.textTheme.headline3!.copyWith(
              color: Colors.white,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                buildNewPassword(context),
                SizedBox(
                  height: 15.h,
                ),
                buildInfo(context),
              ],
            ),
          ),
          actions: [
            buildChangePasswordButton(context),
          ],
        );
      },
    );
  }

  String get buildChangePasswordTitle => LocaleKeys.change_password;

  TextButton buildChangePasswordButton(BuildContext context) {
    return TextButton(
      child: Text(
        LocaleKeys.change_password.locale,
        style: context.textTheme.bodyText2,
      ),
      onPressed: () {
        if (controller.text.isNotEmpty && controller.text.length >= 6) {
          context
              .read<ChangePasswordCubit>()
              .changePassword(context, controller.text);
          FavoritesSnackBar().showSnackFavorites(
            context,
            LocaleKeys.password_has_been_changed.locale,
          );
          Navigator.pushNamed(context, RouterConstant.LOGIN_VIEW);
        }
      },
    );
  }

  Text buildInfo(BuildContext context) => Text(
        LocaleKeys.change_password_info.locale,
        style: context.textTheme.bodyText2,
      );

  CustomTextFormField buildNewPassword(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      labelText: LocaleKeys.new_password.locale,
      icon: Icon(
        Icons.key,
        color: context.customColors!.doveGray,
        size: 20.h,
      ),
      hint: LocaleKeys.new_password.locale,
      keyboardType: TextInputType.emailAddress,
    );
  }
}
