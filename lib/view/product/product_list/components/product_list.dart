import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocdaily_app/core/components/widgets/progress_indicator/custom_progress_indicator.dart';
import 'package:cocdaily_app/core/constants/app/app_router_constants.dart';
import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:cocdaily_app/view/product/product_list/components/cocktail_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/base/cubits/favorite_cubit/favorite_cubit.dart';
class ProductList extends StatelessWidget {
  final String? cardBackgroundName;
  final String? appBarTitle;
  final Stream<QuerySnapshot<Object?>>? stream;
  final void Function()? onPressedFavorite;
  final IconData? iconFavorite;

  const ProductList(
      {Key? key, this.cardBackgroundName, this.stream, this.appBarTitle, this.onPressedFavorite, this.iconFavorite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(),
    );
  }

  SafeArea buildBody() {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.only(left: 25.w),
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

  GridView buildGridView(BuildContext context,AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
    return GridView(
      children: snapshot.data!.docs
          .map((e) => CocktailCard(
              favoriteIcon: Icons.favorite,
              onPressedFavorite: (() async =>
                  await context.read<FavoriteCubit>().addFavorite(context,
                  e["name"],
                  e["urlPhoto"],
                  e["recipe"]
                  )),
              urlPhoto: e['urlPhoto'],
              name: e['name'],
              cardBackgroundName: cardBackgroundName!))
          .toList(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
    );
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
