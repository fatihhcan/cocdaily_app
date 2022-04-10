import 'package:cocdaily_app/core/constants/init/theme/light/app_theme_light.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
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
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: () => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppThemeLight.instance.theme,
          title: 'Cocdaily',
          onGenerateRoute: _appRouter.onGenerateRoute,
      /*     home: BlocProvider(
            lazy:false,
            create: (_) => LoginCubit(),
            child: const ProductListView(),
          ) */
          ),
    );
  }
}
