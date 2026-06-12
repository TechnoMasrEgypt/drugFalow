import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants/colors.dart';
import '../utils/helpers.dart';
import 'image_handler.dart';
class NetWorkImageHandler extends StatelessWidget {
  final String image;
  final double width;
  final double height;
  BoxFit? fit;
   NetWorkImageHandler({super.key, required this.image,
    required this.width, required this.height,this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      alignment: Alignment.center,
      width: width,
      height: height,
      errorListener: (val){
        debugPrint('Image load error: $val');
      },
      errorWidget: (context,string,object)=>Container(
        alignment: Alignment.center,
          padding: EdgeInsets.all(context.width/25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border:Border.all(color: primaryDark.withOpacity(.2))
          ),
          child: Container(
            alignment: Alignment.center,
            child: Icon(Icons.image,color: primaryDark,size: 25,),
          )),
      placeholder: (context,s)=> SpinKitPulse(size: 50,color: primaryDark,),
      imageUrl: image??"",fit: fit,);
  }

}