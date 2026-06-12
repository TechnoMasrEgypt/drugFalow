import "package:drug_flow/core/constants/images.dart";
import "package:drug_flow/core/constants/images.dart";
import "package:drug_flow/core/constants/styles.dart";
import "package:drug_flow/core/localization/lang_keys.dart";
import "package:drug_flow/core/utils/helpers.dart";
import "package:drug_flow/core/widgets/svg_handler.dart";
import "package:flutter/cupertino.dart";
import "package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart";

import "../../../../../core/constants/colors.dart";

List<PersistentBottomNavBarItem> navBarsItems({BuildContext? context}) => [
  PersistentBottomNavBarItem(
    icon: customSvg(
      name: homeFill,
      width: context!.width / 25,
      height: context.height / 25,
      fit: BoxFit.cover,
    ),
    inactiveIcon: customSvg(
      name: home,
      width: context!.width / 25,
      height: context.height / 25,
      fit: BoxFit.cover,
    ),
    title: context.translate(LangKeys.home),
    textStyle: TextStyles.textStyleNormal13,
    activeColorPrimary: primaryDark,
    inactiveColorPrimary: colorEBEBEF,
    activeColorSecondary: white, // 🔥 THIS controls text in style10
  ),
  PersistentBottomNavBarItem(
    icon: customSvg(
      name: unionFill,
      width: context!.width / 25,
      height: context.height / 25,
      fit: BoxFit.cover,
    ),
    inactiveIcon: customSvg(
      name: union,
      width: context!.width / 25,
      height: context.height / 25,
      fit: BoxFit.cover,
    ),
    title: context.translate(LangKeys.products),
    textStyle: TextStyles.textStyleNormal13,

    activeColorPrimary: primaryDark,
    inactiveColorPrimary: colorEBEBEF,
    activeColorSecondary: white,
  ),

  PersistentBottomNavBarItem(
    icon: customSvg(
      name: bagFill,
      width: context!.width / 25,
      height: context.height / 25,
      fit: BoxFit.cover,
    ),
    inactiveIcon: customSvg(
      name: bag,
      width: context!.width / 25,
      height: context.height / 25,
      fit: BoxFit.cover,
    ),
    title: context.translate(LangKeys.orders),
    textStyle: TextStyles.textStyleNormal13,

    activeColorPrimary: primaryDark, // ✅ active text color
    inactiveColorPrimary: color6C6C89,
    activeColorSecondary: white,
  ),

  PersistentBottomNavBarItem(
    icon: customSvg(
      name: userFill,
      width: context!.width / 25,
      height: context.height / 25,
      fit: BoxFit.cover,
    ),
    inactiveIcon: customSvg(
      name: user,
      width: context!.width / 25,
      height: context.height / 25,
      fit: BoxFit.cover,
    ),
    title: context.translate(LangKeys.profile),
    textStyle: TextStyles.textStyleNormal13,

    activeColorPrimary: primaryDark,
    inactiveColorPrimary: colorEBEBEF,
    activeColorSecondary: white,
  ),
];
