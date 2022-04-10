import 'package:cocdaily_app/core/constants/image/image_path.dart';
import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../core/base/cubits/splash_cubit/splash_cubit.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashCubit>(
        create: (context) => SplashCubit()..splashInit(context),
        child: BlocBuilder<SplashCubit, SplashCubitState>(
          builder: (context, state) {
            return Scaffold(
                backgroundColor: context.customColors!.bossanova,
                body: Center(
                  child: Lottie.asset(SVGImagePaths.instance!.splashJSON),
                ));
          },
        ));
  }
}
