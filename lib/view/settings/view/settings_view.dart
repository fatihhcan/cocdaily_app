import 'package:cocdaily_app/core/constants/app/app_router_constants.dart';
import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:cocdaily_app/core/extensions/string_extension.dart';
import 'package:cocdaily_app/view/settings/components/custom_profile_row.dart';
import 'package:cocdaily_app/view/settings/components/custom_settings_buttons.dart';
import 'package:cocdaily_app/view/settings/components/language_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/base/cubits/authentication_cubit/login_cubit/login_cubit.dart';
import '../../../core/utility/shared/shared_prefs.dart';
import '../../../utils/locale_keys.g.dart';
import '../components/about_app_alert_dialog.dart';
import '../components/change_password_alert_dialog.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.customColors!.manatee,
      appBar: buildAppBar(context),
      body: buildBody(context),
    );
  }

  SafeArea buildBody(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: context.paddingLowHorizontal,
      child: ListView(
        children: [
          SizedBox(
            height: 100.h,
          ),
          userProfile(),
          SizedBox(
            height: 75.h,
          ),
          buildChangePasswordButton(context),
          SizedBox(
            height: 25.h,
          ),
          buildLanguageButton(context),
          SizedBox(
            height: 25.h,
          ),
          buildSettingsButton(context),
          SizedBox(
            height: 25.h,
          ),
          buildLogoutButton(context),
        ],
      ),
    ));
  }

  CustomSettingsButtons buildSettingsButton(BuildContext context) {
    return CustomSettingsButtons(
            onTap: () => AboutAppAlertDialog().showMyDialog(context),
            title: LocaleKeys.about_app.locale,
          );
  }

  CustomSettingsButtons buildLanguageButton(BuildContext context) {
    return CustomSettingsButtons(
            onTap: () => LanguageAlertDialog().showMyDialog(context),
            title: LocaleKeys.language.locale,
          );
  }

  CustomSettingsButtons buildLogoutButton(BuildContext context) {
    return CustomSettingsButtons(
      onTap: () {
        context.read<LoginCubit>().signOut();
        SharedPrefs.clearCache();
        Navigator.pushNamedAndRemoveUntil(context, RouterConstant.LOGIN_VIEW,
            ModalRoute.withName('/loginView'));
      },
      title: LocaleKeys.logout.locale,
    );
  }

  CustomSettingsButtons buildChangePasswordButton(BuildContext context) {
    return CustomSettingsButtons(
      onTap: () => ChangePasswordAlertDialog().showMyDialog(context),
      title: LocaleKeys.change_password.locale,
    );
  }

  CustomProfileRow userProfile() {
    return CustomProfileRow(
      fullName: SharedPrefs.getUserName,
      email: SharedPrefs.getUserEmail,
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () => Navigator.pushNamedAndRemoveUntil(context,
              RouterConstant.HOME_VIEW, ModalRoute.withName('/homeView')),
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
          )),
      title: Text(
        LocaleKeys.settings.locale,
        style: context.textTheme.headline1!
            .copyWith(color: Colors.white, fontSize: 25.sp),
      ),
    );
  }
}
