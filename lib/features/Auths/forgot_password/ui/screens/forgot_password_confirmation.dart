import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/exts.dart';
import 'package:drug_flow/core/constants/images.dart';
import 'package:drug_flow/core/constants/screens.dart';
import 'package:drug_flow/core/constants/spacing.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/localization/lang_keys.dart';
import 'package:drug_flow/core/utils/helpers.dart';
import 'package:drug_flow/core/utils/network_images.dart';
import 'package:drug_flow/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordConfirmation extends StatelessWidget {
  const ForgotPasswordConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            verticalSpace(32),
            Text(
              'تم تغيير كلمه المرور بنجاح',
              style: TextStyles.textStyleBold24.copyWith(fontWeight: .w700),
            ),
            verticalSpace(12),
            Text(
              'يمكنك تسجيل الدخول بكلمة مرور جديدة ',
              style: TextStyles.textStyleNormal12.copyWith(
                fontWeight: .w400,
                color: color79,
              ),
            ),
            verticalSpace(85),
            AppImage(image: ware1, width: double.infinity, height: 330.h),
            verticalSpace(142),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              width: double.infinity,
              // margin: EdgeInsets.symmetric(horizontal: context.width / 15),
              child: CustomButton(
                btnTitle: context.translate(LangKeys.login),
                onPressed: () => context.pushName(loginSc),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
