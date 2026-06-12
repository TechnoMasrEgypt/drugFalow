import 'dart:math';

import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/images.dart';
import 'package:drug_flow/core/utils/helpers.dart';
import 'package:drug_flow/core/widgets/image_handler.dart';
import 'package:drug_flow/core/widgets/svg_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'build_around_widget.dart';

class OnBoardingFirst extends StatelessWidget {
  final String img;

  OnBoardingFirst({required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 396.h,
      child: ImageHandler(
        img: img,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
