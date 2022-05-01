import 'package:cocdaily_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProfileRow extends StatelessWidget {
  final String fullName;
  final String email;
  const CustomProfileRow(
      {Key? key, required this.fullName, required this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildAccountIcon(),
        SizedBox(
          width: 10.w,
        ),
        buildProfileInfo(context)
      ],
    );
  }

  Column buildProfileInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildFullName(context),
        buildEmail(context),
      ],
    );
  }

  Text buildEmail(BuildContext context) {
    return Text(
      email,
      style: context.textTheme.bodyText2!
          .copyWith(color: Colors.white, fontWeight: FontWeight.w300),
    );
  }

  Text buildFullName(BuildContext context) {
    return Text(fullName,
        style: context.textTheme.headline3!.copyWith(color: Colors.white));
  }

  Icon buildAccountIcon() {
    return Icon(
      Icons.account_circle_outlined,
      size: 60.h,
    );
  }
}
