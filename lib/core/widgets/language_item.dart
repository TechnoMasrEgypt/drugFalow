import 'package:drug_flow/core/widgets/svg_handler.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/fonts.dart';
import '../constants/images.dart';
import '../constants/styles.dart';
import '../utils/helpers.dart';

/*class LanguageItem extends StatelessWidget{
  Color? color;
  BuildContext? buildContext;



  LanguageItem({this.color = color1F3D2B});

  @override
  Widget build(BuildContext context) {
    var fontType = context.locale.languageCode == "ar"? assistant: notoSansArabic;
    return  InkWell(
    onTap: (){
     /* context.locale.languageCode == "ar"?
          context.setLocale(Locale("en")).then((e){
            di.helper.updateLocalHeader("en");
          }) :
          context.setLocale(Locale("ar")).then((e){
            di.helper.updateLocalHeader("ar");
          });*/


    },
    child: Container(
        margin: EdgeInsets.symmetric(horizontal: context.width/30),
        padding: EdgeInsets.all(context.width/70),
        decoration: BoxDecoration(
          border: Border.all(color: color!,width: 1),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            customSvg(name: languageIcon,width: context.width/30,height: context.height/30
                ,fit: BoxFit.cover,color: color!),
            SizedBox(width: context.width/40,),
            Text(context.locale.languageCode == "en"?
            "العربية" : "English",style: TextStyles.textStyleNormal16.copyWith(
                color: color!,fontWeight: FontWeight.w500,
              fontFamily: fontType
            ),textScaler: TextScaler.linear(1),)
          ],
        ),
      ),
);
  }
}*/