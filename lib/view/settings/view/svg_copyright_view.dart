import 'dart:io';

import 'package:cocdaily_app/core/constants/app/app_constants.dart';
import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:cocdaily_app/core/extensions/string_extension.dart';
import 'package:cocdaily_app/utils/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../core/constants/app/app_router_constants.dart';

class SvgCopyrightView extends StatefulWidget {
  const SvgCopyrightView({Key? key}) : super(key: key);

  @override
  State<SvgCopyrightView> createState() => _SvgCopyrightViewState();
}

class _SvgCopyrightViewState extends State<SvgCopyrightView> {
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
    return const SafeArea(
        child: WebView(
      initialUrl: ApplicationConstants.svgRepoCopyrightURL,
    ));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context,
              RouterConstant.SETTINGS_VIEW,
              ModalRoute.withName('/settingsView')),
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
          )),
      title: Text(
        LocaleKeys.svg_copyright.locale,
        style: context.textTheme.headline1!
            .copyWith(color: Colors.white, fontSize: 25.sp),
      ),
    );
  }
}
