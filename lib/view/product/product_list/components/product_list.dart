import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocdaily_app/core/base/cubits/product_detail_cubit/product_detail_cubit.dart';
import 'package:cocdaily_app/core/components/widgets/progress_indicator/custom_progress_indicator.dart';
import 'package:cocdaily_app/core/constants/app/app_router_constants.dart';
import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:cocdaily_app/view/product/product_list/components/cocktail_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/base/cubits/favorite_cubit/favorite_cubit.dart';
import '../../../../core/base/cubits/language_cubit/language_cubit.dart';

class ProductList extends StatelessWidget {
  final String? cardBackgroundName;
  final Color? cardBackgroundColor;
  final String? appBarTitle;
  final Stream<QuerySnapshot<Object?>>? stream;
  final void Function()? onPressedFavorite;
  final void Function()? onPressedNextDetail;
  final IconData? iconFavorite;
  final bool isFavoritesView;

  const ProductList(
      {Key? key,
      this.cardBackgroundName,
      this.cardBackgroundColor,
      this.stream,
      this.appBarTitle,
      this.onPressedFavorite,
      this.iconFavorite,
      this.onPressedNextDetail,
      this.isFavoritesView = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: buildAppBar(context),
        body: buildBody(),
      ),
    );
  }

  SafeArea buildBody() {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.only(left: 25.w, top: 25.h),
      child: StreamBuilder(
          stream: stream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const CustomProgressIndicator();
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CustomProgressIndicator();
            }
            if (snapshot.hasData) {
              return buildGridView(context, snapshot);
            }
            return const CustomProgressIndicator();
          }),
    ));
  }

  GridView buildGridView(
      BuildContext context, AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
    return GridView(
      children: snapshot.data!.docs
          .map((e) => buildGridViewChildren(e))
          .toList(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
    );
  }

  StreamBuilder<QuerySnapshot<Map<String, dynamic>>> buildGridViewChildren(QueryDocumentSnapshot<Object?> e) {
    return StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("UserFavoritesCocktails")
                .doc(FirebaseAuth.instance.currentUser!.email)
                .collection("Cocktails")
                .where("name", isEqualTo: e['name'])
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return buildCocktailCard(context, e, snapshot);
            });
  }

  CocktailCard buildCocktailCard(BuildContext context,
      QueryDocumentSnapshot<Object?> e, AsyncSnapshot<dynamic> snapshot) {
    return CocktailCard(
        onPressedNextDetailDetector: () =>context.read<ProductDetailCubit>().nextDetailView(context, e, isFavoritesView, cardBackgroundColor, snapshot),
        onPressedNextDetail:  () =>context.read<ProductDetailCubit>().nextDetailView(context, e, isFavoritesView, cardBackgroundColor, snapshot),
        favoriteIcon: iconFavorite!,
        onPressedFavorite: (() {
          context
              .read<FavoriteCubit>()
              .productDetailFavorites(context, isFavoritesView, snapshot, e);
        }),
        urlPhoto: e['urlPhoto'],
        name: e['name'],
        cardBackgroundName: cardBackgroundName!);
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: context.customColors!.doveGray,
      title: Text(
        appBarTitle!,
        style: context.textTheme.headline4!.copyWith(color: Colors.white),
      ),
      leading: IconButton(
          onPressed: () =>
              Navigator.pushNamed(context, RouterConstant.HOME_VIEW),
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
          )),
    );
  }
}
