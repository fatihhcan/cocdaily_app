import 'package:cocdaily_app/core/constants/init/theme/light/app_theme_light.dart';
import 'package:cocdaily_app/view/authentication/login/view/login_view.dart';
import 'package:cocdaily_app/view/authentication/register/view/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
           designSize: const Size(428,926),
      builder:() => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemeLight.instance.theme,
        title: 'Material App',
        home: RegisterView()
      ),
    );
  }
}