import 'package:drug_flow/core/app/app_cubit/app_cubit.dart';
import 'package:drug_flow/core/app/app_cubit/app_state.dart';
import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/images.dart';
import 'package:drug_flow/core/constants/screens.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/localization/lang_keys.dart';
import 'package:drug_flow/core/utils/helpers.dart';
import 'package:drug_flow/core/utils/network_images.dart';
import 'package:drug_flow/core/widgets/custom_button.dart';
import 'package:drug_flow/features/Auths/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:drug_flow/features/Home_sction/orders/presentation/screens/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoneBottomSheet extends StatefulWidget {
  const DoneBottomSheet({super.key});

  @override
  State<DoneBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<DoneBottomSheet> {
  late String selectedLanguage;

  @override
  void initState() {
    super.initState();
    selectedLanguage = context.read<AppCubit>().currentLangCode;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      width: double.infinity,
      height: 375.h,
      decoration: const BoxDecoration(
        color: white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            AppImage(image: done, height: 150.h, width: double.infinity),

            SizedBox(height: 24.h),
            Text(
              "تم تأكيد الطلب بنجاح",
              style: TextStyles.textStyleBold20.copyWith(color: Colors.black),
            ),
            SizedBox(height: 16.h),
            Text(
              "يمكنك متابعه طلبك من صفحة طلباتي",
              style: TextStyles.textStyleNormal13.copyWith(
                color: const Color(0xff999999),
              ),
            ),
            SizedBox(height: 15.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              width: double.infinity,
              // margin: EdgeInsets.symmetric(horizontal: context.width / 15),
              child: CustomButtonOutline(
                color: Colors.white,
                fontSize: 14.sp,
                textColor: color121217,
                borderColor: const Color.fromARGB(255, 213, 213, 221),
                btnTitle: 'طلباتي',
                onPressed: () {
                  context.push(ordersSc);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
