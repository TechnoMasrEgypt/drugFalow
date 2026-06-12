import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/fonts.dart';
import '../constants/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import '../utils/helpers.dart';

class CustomButton extends StatelessWidget {
  final String btnTitle;
  final Function()? onPressed;
  bool? isLoading;
  String? font;
  String? type;
  String? svgIcon;
  String? iconName;
  Color? color;
  Color? borderColor;
  double? width;
  CustomButton({
    super.key,
    required this.btnTitle,
    required this.onPressed,
    this.isLoading = false,
    this.type = "",
    this.svgIcon = "",
    this.iconName = "",
    this.color = primaryDark,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      elevation: 0,
      color: color,

      height: context.height / 16,

      padding: EdgeInsets.only(
        left: 0,
        bottom: context.height / 80,
        top: context.height / 80,
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: borderColor ?? Colors.transparent),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: isLoading == true
          ? CircularProgressIndicator(color: white, strokeWidth: 2.0)
          : Text(
              btnTitle,
              style: TextStyles.textStyleNormal14.copyWith(
                fontWeight: FontWeight.w500,
                color: white,
              ),
              textScaler: TextScaler.linear(1),
            ),
    );
  }
}

class CustomButtonOutline extends StatelessWidget {
  final String btnTitle;
  final Function()? onPressed;
  bool? isLoading;
  String? font;
  String? type;
  String? svgIcon;
  String? iconName;
  Color? color;
  Color? textColor;
  Color? borderColor;
  double? fontSize;
  CustomButtonOutline({
    super.key,
    required this.btnTitle,
    required this.onPressed,
    this.isLoading = false,
    this.type = "",
    this.svgIcon = "",
    this.iconName = "",
    this.color = primaryDark,
    this.textColor = white,
    this.borderColor,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      elevation: 0,
      color: color,
      height: context.height / 16,

      padding: EdgeInsets.only(
        left: 0,
        bottom: context.height / 80,
        top: context.height / 80,
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: borderColor ?? Colors.transparent),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: isLoading == true
          ? CircularProgressIndicator(color: primaryDark, strokeWidth: 2.0)
          : Text(
              btnTitle,
              style: TextStyles.textStyleNormal14.copyWith(
                fontWeight: FontWeight.w500,
                color: textColor ?? Colors.blue,
                fontSize: fontSize,
              ),
              textScaler: TextScaler.linear(1),
            ),
    );
  }
}
