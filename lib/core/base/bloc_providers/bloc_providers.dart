import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/authentication_cubit/change_password/change_password_cubit.dart';
import '../cubits/authentication_cubit/forgot_password_cubit/forgot_password_cubit.dart';
import '../cubits/authentication_cubit/login_cubit/login_cubit.dart';
import '../cubits/authentication_cubit/sign_up_cubit/sign_up_cubit.dart';
import '../cubits/favorite_cubit/favorite_cubit.dart';
import '../cubits/home_cubit/home_cubit.dart';
import '../cubits/language_cubit/language_cubit.dart';
import '../cubits/product_cubit/product_cubit.dart';
import '../cubits/product_detail_cubit/product_detail_cubit.dart';
import '../cubits/share_social_media_cubit/share_social_media_cubit.dart';


class BlocProvidersList {
  List<BlocProvider> multiBlocProviders = [
    BlocProvider<LoginCubit>(create: (_) => LoginCubit()),
    BlocProvider<SignUpCubit>(create: (_) => SignUpCubit()),
    BlocProvider<ProductCubit>(create: (_) => ProductCubit()),
    BlocProvider<FavoriteCubit>(create: (_) => FavoriteCubit()),
    BlocProvider<HomeCubit>(create: (_) => HomeCubit()),
    BlocProvider<ShareSocialMediaCubit>(create: (_) => ShareSocialMediaCubit()),
    BlocProvider<ForgotPasswordCubit>(create: (_) => ForgotPasswordCubit()),
    BlocProvider<ChangePasswordCubit>(create: (_) => ChangePasswordCubit()),
    BlocProvider<LanguageCubit>(create: (_) => LanguageCubit()),
    BlocProvider<ProductDetailCubit>(create: (_) => ProductDetailCubit()),
  ];
}
