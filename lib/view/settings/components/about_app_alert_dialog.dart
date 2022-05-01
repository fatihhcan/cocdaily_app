import 'package:cocdaily_app/core/constants/app/app_constants.dart';
import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:cocdaily_app/core/extensions/string_extension.dart';
import 'package:cocdaily_app/utils/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app/app_router_constants.dart';
import 'about_app_icon_and_button.dart';

class AboutAppAlertDialog {
  TextEditingController controller = TextEditingController();
  Future<void> showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            LocaleKeys.about_app.locale,
            style: context.textTheme.headline3!.copyWith(
              color: Colors.white,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                buildPrivacyPolicy(),
                buildSvgRepoCopyright(),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text(
                LocaleKeys.ok.locale,
                style: context.textTheme.bodyText2,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  AboutAppIconAndButton buildSvgRepoCopyright() {
    return AboutAppIconAndButton(
                textButtonTitle: ApplicationConstants.svgRepoCopyright,
                routeName: RouterConstant.SVG_COPYRIGHT_VIEW,
                icon: Icons.web_asset,
              );
  }

  AboutAppIconAndButton buildPrivacyPolicy() {
    return AboutAppIconAndButton(
                textButtonTitle: LocaleKeys.privacy_policy.locale,
                routeName: RouterConstant.PRIVACY_POLICY_VIEW,
                icon: Icons.policy,
              );
  }
}
