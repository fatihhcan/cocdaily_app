import 'package:cocdaily_app/core/constants/app/app_router_constants.dart';
import 'package:cocdaily_app/core/constants/app/text_constants.dart';
import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:cocdaily_app/view/settings/components/custom_profile_row.dart';
import 'package:cocdaily_app/view/settings/components/custom_settings_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/base/cubits/authentication_cubit/login_cubit/login_cubit.dart';
import '../../../core/utility/shared/shared_prefs.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.customColors!.manatee,
      appBar: buildAppBar(context),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 100.h,
          ),
          CustomProfileRow(
            fullName: SharedPrefs.getUserName,
            email: SharedPrefs.getUserEmail,
          ),
          SizedBox(
            height: 75.h,
          ),
          CustomSettingsButtons(
            onTap: () {},
            title: TextConstants.changePassword,
          ),
          SizedBox(
            height: 25.h,
          ),
          CustomSettingsButtons(
            onTap: () {},
            title: TextConstants.language,
          ),
          SizedBox(
            height: 25.h,
          ),
          CustomSettingsButtons(
            onTap: () {},
            title: TextConstants.aboutApp,
          ),
          SizedBox(
            height: 25.h,
          ),
          CustomSettingsButtons(
            onTap: () {
              context.read<LoginCubit>().signOut();
              SharedPrefs.clearCache();
             Navigator.pushNamedAndRemoveUntil(context, RouterConstant.LOGIN_VIEW,
        ModalRoute.withName('/loginView'));
            },
            title: TextConstants.logout,
          ),
        ],
      )),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: ()=>Navigator.pushNamedAndRemoveUntil(context, RouterConstant.HOME_VIEW,
        ModalRoute.withName('/homeView')) ,
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
          )),
      title: Text(
        TextConstants.settings,
        style: context.textTheme.headline1!
            .copyWith(color: Colors.white, fontSize: 25.sp),
      ),
    );
  }
}
