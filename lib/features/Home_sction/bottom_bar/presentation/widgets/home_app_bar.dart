import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/images.dart';
import 'package:drug_flow/core/constants/screens.dart';
import 'package:drug_flow/core/localization/lang_keys.dart';
import 'package:drug_flow/core/utils/helpers.dart';
import 'package:drug_flow/core/widgets/image_handler.dart';
import 'package:drug_flow/core/widgets/svg_handler.dart';
import 'package:drug_flow/features/Home_sction/notifications/presentation/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/styles.dart';
import 'package:go_router/go_router.dart';

AppBar homeAppBar({required BuildContext context}) {
  return AppBar(
    backgroundColor: white,
    surfaceTintColor: white,
    elevation: 0,
    automaticallyImplyLeading: false,
    titleSpacing: 0,

    title: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 35.w,
            height: 35.h,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffADE4FF),
            ),
            child: ImageHandler(img: profile, width: 35.w, height: 35.h),
          ),

          SizedBox(width: context.width / 70),

          Text(
            context.translate(LangKeys.drugFlow),
            style: TextStyles.textStyleBold20.copyWith(color: primaryDark),
          ),
        ],
      ),
    ),

    actions: [
      InkWell(
        onTap: () {
          context.push(notificationsSc);
        },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: context.width / 30),
          child: customSvg(
            name: notification,
            width: context.width / 29,
            height: context.height / 29,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ],
  );
}
