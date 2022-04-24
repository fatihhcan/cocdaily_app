import 'package:cocdaily_app/core/base/cubits/authentication_cubit/login_cubit/login_cubit.dart';
import 'package:cocdaily_app/core/base/cubits/authentication_cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:cocdaily_app/core/base/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:cocdaily_app/core/base/cubits/home_cubit/home_cubit.dart';
import 'package:cocdaily_app/core/base/cubits/product_cubit/product_cubit.dart';
import 'package:cocdaily_app/core/base/cubits/share_social_media_cubit/share_social_media_cubit.dart';
import 'package:cocdaily_app/core/constants/init/theme/light/app_theme_light.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/constants/router/app_router.dart';
import 'core/utility/shared/shared_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedPrefs.initialize();

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

   MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
        create: (_) => LoginCubit(context)), BlocProvider(
        create: (_) => SignUpCubit()),
        BlocProvider(
        create: (_) => ProductCubit()),
        BlocProvider(
        create: (_) => FavoriteCubit()),
        BlocProvider(
        create: (_) => HomeCubit()),
          BlocProvider(
        create: (_) => ShareSocialMediaCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: () => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppThemeLight.instance.theme,
            title: 'Cocdaily',
          onGenerateRoute: _appRouter.onGenerateRoute,
//ome: ProductDetailsRecipeView(),
        /*     home: BlocProvider(
              lazy:false,
              create: (_) => LoginCubit(),
              child: const ProductListView(),
            ) */
            ),
      ),
    );
  }
}
