import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:cocdaily_app/core/extensions/string_extension.dart';
import 'package:cocdaily_app/utils/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app/app_router_constants.dart';

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
                Row(
                  children: [
                    const Icon(Icons.policy),
                    SizedBox(
                      width: 5.w,
                    ),
                    TextButton(
                      child: Text(LocaleKeys.privacy_policy.locale,
                          style: context.textTheme.bodyText2),
                      onPressed: () {
                        Navigator.pushNamed(
                            context, RouterConstant.PRIVACY_POLICY_VIEW);
                      },
                    )
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.web_asset),
                    SizedBox(
                      width: 5.w,
                    ),
                    TextButton(
                      child: Text("Icons by svgrepo.com",
                          style: context.textTheme.bodyText2),
                      onPressed: () {
                        Navigator.pushNamed(
                            context, RouterConstant.SVG_COPYRIGHT_VIEW);
                      },
                    )
                  ],
                ),
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
}
