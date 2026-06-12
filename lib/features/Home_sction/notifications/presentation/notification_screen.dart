import 'package:drug_flow/core/constants/images.dart';
import 'package:drug_flow/core/constants/spacing.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/utils/helpers.dart';
import 'package:drug_flow/core/utils/network_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.r),
          child: Column(
            children: [
              verticalSpace(50),
              Row(
                children: [
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: Icon(Icons.arrow_back_outlined),
                  ),
                  horizontalSpace(8),
                  Text(
                    "الاشعارات ",
                    style: TextStyles.textStyleNormal16.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  AppImage(image: setting, width: 32.w, height: 32.h),
                ],
              ),
              verticalSpace(8),
              ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: AppImage(
                      image: Icon_Button,
                      width: 32.w,
                      height: 32.h,
                    ),
                    title: Text(
                      " شركه جديدة انضمت لنا , الريان فارم",
                      style: TextStyles.textStyleNormal13,
                    ),
                    subtitle: Text(
                      " تقدر دلوقتي تشوف المنتجات الي تناسب صيدليتك",
                      style: TextStyles.textStyleNormal11,
                    ),
                  );
                },
                separatorBuilder: (context, index) => verticalSpace(8),
                itemCount: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
