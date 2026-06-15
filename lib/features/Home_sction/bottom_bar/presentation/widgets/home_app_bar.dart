import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/images.dart';
import 'package:drug_flow/core/constants/screens.dart';
import 'package:drug_flow/core/localization/lang_keys.dart';
import 'package:drug_flow/core/utils/helpers.dart';
import 'package:drug_flow/core/utils/network_images.dart';
import 'package:drug_flow/core/widgets/image_handler.dart';
import 'package:drug_flow/core/widgets/svg_handler.dart';
import 'package:drug_flow/features/Home_sction/notifications/presentation/notification_screen.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/cubit/profile/profile_cubit.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/cubit/profile/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../../core/constants/styles.dart';
import 'package:go_router/go_router.dart';

AppBar homeAppBar({
  required BuildContext context,
  required PersistentTabController controller,
}) {
  return AppBar(
    backgroundColor: white,
    surfaceTintColor: white,
    elevation: 0,
    automaticallyImplyLeading: false,
    titleSpacing: 0,

    title: BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final cubit = context.read<ProfileCubit>();
        return Padding(
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
                child: GestureDetector(
                  onTap: () {
                    controller.jumpToTab(3);
                  },
                  child: AppImage(
                    image: cubit.profile?.image ?? ware2,
                    width: 35.w,
                    height: 35.h,
                  ),
                ),
              ),

              SizedBox(width: context.width / 70),

              Text(
                context.translate(LangKeys.drugFlow),
                style: TextStyles.textStyleBold20.copyWith(color: primaryDark),
              ),
            ],
          ),
        );
      },
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
