import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/images.dart';
import 'package:drug_flow/core/constants/spacing.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/utils/helpers.dart';
import 'package:drug_flow/core/utils/network_images.dart';
import 'package:drug_flow/core/widgets/custom_button.dart';
import 'package:drug_flow/features/Home_sction/home/data/warehouse_details_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product;
  const ProductDetailsScreen({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 12.h),

              /// App Bar
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: const Color(0xff303030),
                      size: 24.sp,
                    ),
                  ),
                ],
              ),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Product Image
                      Center(
                        child: AppImage(
                          image: product.image ?? '',
                          height: 303.h,
                          width: 303.w,
                          fit: BoxFit.contain,
                        ),
                      ),

                      SizedBox(height: 14.h),

                      /// Indicator
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 8.w,
                            height: 4.h,
                            decoration: BoxDecoration(
                              color: const Color(0xffD8D8D8),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Container(
                            width: 18.w,
                            height: 4.h,
                            decoration: BoxDecoration(
                              color: const Color(0xff9FD4E4),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Container(
                            width: 8.w,
                            height: 4.h,
                            decoration: BoxDecoration(
                              color: const Color(0xffD8D8D8),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 18.h),

                      /// Product Title
                      Text(
                        product.name ??
                            'بانادول اكسترا بانادولرين اضافي، مسكن\nفعال للألم والحمي | 24 قرص',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 22.sp,
                          height: 1.5,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff444444),
                        ),
                      ),

                      SizedBox(height: 18.h),

                      /// Category
                      Text(
                        'اسم القسم',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xffB4B4B4),
                        ),
                      ),

                      SizedBox(height: 8.h),

                      /// Tags
                      Row(
                        children: [
                          _TagChip(text: "Paracetamol"),
                          SizedBox(width: 8.w),
                          _TagChip(text: "Caffeine"),
                        ],
                      ),

                      SizedBox(height: 20.h),

                      /// Manufacturer
                      Row(
                        children: [
                          AppImage(
                            image: product.warehouse?.logo ?? '',
                            width: 30.w,
                            height: 30.h,
                          ),
                          horizontalSpace(5),
                          Expanded(
                            child: Text(
                              product.warehouse?.name ??
                                  'إيرلن فارم للرعاية وتوزيع الادوية',
                              style: TextStyle(
                                color: const Color(0xff999999),
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 18.h),

                      /// Price Section
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            product.price ?? "٥٨",
                            style: TextStyles.textStyleNormal24.copyWith(
                              color: color121217,
                              fontWeight: FontWeight.w600,
                              fontSize: 24.sp,
                            ),
                            textScaler: const TextScaler.linear(1),
                          ),

                          SizedBox(width: 10.w),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "جنيه مصري",
                                  style: TextStyles.textStyleNormal11.copyWith(
                                    color: color6C6C89,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.sp,
                                  ),
                                  textScaler: const TextScaler.linear(1),
                                ),
                                SizedBox(height: 2.h),
                                // Text(
                                //   "١٢٠ جنيه مصري",
                                //   style: TextStyles.textStyleNormal11.copyWith(
                                //     color: color6C6C89,
                                //     fontWeight: FontWeight.w400,
                                //     fontSize: 11.sp,
                                //     decoration: TextDecoration.lineThrough,
                                //     decorationColor: color6C6C89,
                                //   ),
                                //   textScaler: const TextScaler.linear(1),
                                // ),
                              ],
                            ),
                          ),

                          Container(
                            width: 66.w,
                            height: 21.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: colorFEF0F4,
                              border: Border.all(color: colorFBB1C4),
                            ),
                            child: Center(
                              child: Text(
                                "خصم ٥٢٪",
                                style: TextStyles.textStyleNormal11.copyWith(
                                  color: colorD50B3E,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11.sp,
                                ),
                                textScaler: const TextScaler.linear(1),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 24.h),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        width: double.infinity,
                        // margin: EdgeInsets.symmetric(horizontal: context.width / 15),
                        child: CustomButton(
                          btnTitle: 'شراء الان ',
                          onPressed: () {},
                        ),
                      ),
                      verticalSpace(8),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        width: double.infinity,
                        // margin: EdgeInsets.symmetric(horizontal: context.width / 15),
                        child: CustomButtonOutline(
                          color: Colors.white,
                          textColor: color121217,
                          borderColor: color121217,
                          btnTitle: 'اضف الي السلة',
                          onPressed: () {},
                        ),
                      ),

                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  final String text;

  const _TagChip({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: const Color(0xffF4F4F4),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 11.sp, color: const Color(0xff666666)),
      ),
    );
  }
}
