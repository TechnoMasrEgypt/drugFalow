import 'dart:math' as math;
import 'package:go_router/go_router.dart';
import 'package:drug_flow/core/widgets/svg_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';
import '../constants/colors.dart';
import '../constants/fonts.dart';
import '../constants/images.dart';
import '../constants/styles.dart';
import '../utils/helpers.dart';

AppBar customAppBar({BuildContext? context,String? title}){

  return AppBar(
    toolbarHeight: context!.height/12,
    backgroundColor: white,
    surfaceTintColor: white,

    centerTitle: true,
    actions: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: context.width/30),
        padding: EdgeInsets.symmetric(horizontal: context.width/27,
            vertical: context.height/81),
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: colorD1d1dB,width: 1.0)
        ),
        child: Text(title??"العربية",style: TextStyles.textStyleNormal13.copyWith(
            color: color121217
        ),textScaler: TextScaler.linear(1),),
      ),
    ],
    leading: InkWell(
      splashFactory: NoSplash.splashFactory,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: (){
        final router = GoRouter.of(context);

        if (router.canPop()) {
          router.pop();
        } else {
          router.go('/'); // or your fallback route (login/home)
        }
      },
      child: Container(
          alignment: Alignment.center,

          child: customSvg(name: back,fit: BoxFit.cover,width: context.width/39,
                height: context.height/39),
          )
    ),
  );
}