import 'dart:io';

import 'package:cocdaily_app/core/constants/app/app_constants.dart';
import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:cocdaily_app/core/extensions/string_extension.dart';
import 'package:cocdaily_app/utils/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../core/constants/app/app_router_constants.dart';

class PrivacyPolicyView extends StatefulWidget {
  const PrivacyPolicyView({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyView> createState() => _PrivacyPolicyViewState();
}

class _PrivacyPolicyViewState extends State<PrivacyPolicyView> {
     @override
   void initState() {
     super.initState();
     // Enable virtual display.
     if (Platform.isAndroid) WebView.platform = AndroidWebView();
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: context.customColors!.manatee,
      appBar: buildAppBar(context),
      body: buildBody(),
    );
  }

  SafeArea buildBody() {
    return SafeArea(child: WebView(
                initialUrl: ApplicationConstants.privacyPolicyURL,                 
               )
               );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () => Navigator.pushNamedAndRemoveUntil(context,
              RouterConstant.SETTINGS_VIEW, ModalRoute.withName('/settingsView')),
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
          )),
      title: Text(
        LocaleKeys.privacy_policy.locale,
        style: context.textTheme.headline1!
            .copyWith(color: Colors.white, fontSize: 25.sp),
      ),
    );
  }
}