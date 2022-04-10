import 'package:cocdaily_app/core/constants/app/app_router_constants.dart';
import 'package:cocdaily_app/core/utility/shared/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashCubitState> {
  SplashCubit() : super(SplashCubitInitial());

  splashInit(BuildContext context) async {
    try {
      emit(SplashCubitLoading());
      await navigatorToScreen(context);
    } catch (e) {}
  }

  navigatorToScreen(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      if (SharedPrefs.getIsLogined) {
        Navigator.pushNamed(context, RouterConstant.HOME_VIEW);
      } else {
        Navigator.pushNamed(context, RouterConstant.LOGIN_VIEW);
      }
    });
  }
}
