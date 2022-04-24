import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share/share.dart';


class ShareSocialMediaCubit extends Cubit<String> {
  ShareSocialMediaCubit() : super("0");

   share(BuildContext context,String name,String recipe) {
    String message = "$name: \n $recipe";
    RenderBox? box = context.findRenderObject() as RenderBox;

    Share.share(message, subject: "Description", sharePositionOrigin: box.localToGlobal(Offset.zero)& box.size);
    
  }
}
