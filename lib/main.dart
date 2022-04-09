import 'package:cocdaily_app/core/base/cubits/authentication_cubit/login_cubit/login_cubit.dart';
import 'package:cocdaily_app/core/constants/init/theme/light/app_theme_light.dart';
import 'package:cocdaily_app/view/authentication/login/view/login_view.dart';
import 'package:cocdaily_app/view/home/view/home_view.dart';
import 'package:cocdaily_app/view/product/product_list/view/product_list_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: () => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppThemeLight.instance.theme,
          title: 'Cocdaily',
          home: BlocProvider(
            lazy:false,
            create: (_) => LoginCubit(),
            child: const ProductListView(),
          )),
    );
  }
}
