import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

SvgPicture customSvg({
  String? name,
  BoxFit? fit,
  double? width,
  double? height,
  Color? color,
}) {
  return SvgPicture.asset(
    name!,
    fit: fit ?? BoxFit.contain,
    width: width,
    height: height,
    alignment: Alignment.center,
    color: color,
  );
}
