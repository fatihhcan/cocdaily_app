import 'package:cocdaily_app/core/base/bloc_providers/bloc_providers.dart';
import 'package:cocdaily_app/core/constants/init/theme/light/app_theme_light.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/constants/app/locale_constant.dart';
import 'core/constants/router/app_router.dart';
import 'core/utility/shared/shared_prefs.dart';

Future<void> main() async {
  await buildInit();
  runApp(
    EasyLocalization(
      path: LocaleConstant.LANG_PATH,
      supportedLocales: LocaleConstant.SUPPORTED_LOCALES,
      child: MyApp(),
    ),
  );
}

Future<void> buildInit() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedPrefs.initialize();
  await EasyLocalization.ensureInitialized();
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocProvidersList().multiBlocProviders,
      child: ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: () => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppThemeLight.instance.theme,
          title: 'Cocdaily',
          onGenerateRoute: _appRouter.onGenerateRoute,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          locale: context.locale,
        ),
      ),
    );
  }
}
