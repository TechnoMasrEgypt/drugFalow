import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/images.dart';
import 'package:drug_flow/core/constants/screens.dart';
import 'package:drug_flow/core/constants/spacing.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/utils/helpers.dart';
import 'package:drug_flow/core/utils/network_images.dart';
import 'package:drug_flow/core/widgets/image_handler.dart';
import 'package:drug_flow/features/Home_sction/home/data/warehouse_details_response.dart';
import 'package:drug_flow/features/Home_sction/products/data/products_response.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/screens/products_details_screen.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/widgets/partition_name_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProductItem extends StatelessWidget {
  final ProductModel data;
  const ProductItem({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(productsListSc, extra: data);
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: context.width / 30,
          vertical: context.height / 50,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: AppImage(image: panadol, width: 95.w, height: 95.h),
            ),
            horizontalSpace(8),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    data.name ??
                        "بانادول اكسترا اوبتيزورب لتخفيف إضافي مسكن فعال للألم والحمي | 24 قرص",
                    style: TextStyles.textStyleNormal13.copyWith(
                      color: color121217,
                    ),
                    textScaler: TextScaler.linear(1),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "اسم القسم",
                    style: TextStyles.textStyleNormal11.copyWith(
                      color: color6C6C89,
                    ),
                    textScaler: TextScaler.linear(1),
                  ),
                  SizedBox(height: context.height / 90),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      PartitionNameItem(title: "Paracetamol"),
                      SizedBox(width: 5.w),
                      PartitionNameItem(title: "Caffeine"),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: colorF7F7F8),
                          color: colorF7F7F8,
                        ),
                        alignment: Alignment.center,
                        child: ClipOval(
                          child: AppImage(
                            image: data.warehouse?.logo ?? ware1,
                            width: 24.w,
                            height: 24.h,
                          ),
                        ),
                      ),
                      SizedBox(width: context.width / 50),
                      Text(
                        data.warehouse?.name ??
                            "الريان فارم لتجاره وتوزيع الادويه",
                        style: TextStyles.textStyleNormal10.copyWith(
                          color: color6C6C89,
                          fontWeight: FontWeight.w600,
                        ),
                        textScaler: TextScaler.linear(1),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        data.price ?? "٥٨",
                        style: TextStyles.textStyleNormal16.copyWith(
                          color: color121217,
                          fontWeight: FontWeight.w600,
                        ),
                        textScaler: TextScaler.linear(1),
                      ),
                      horizontalSpace(4),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "جنيه مصري",
                            style: TextStyles.textStyleNormal11.copyWith(
                              color: color6C6C89,
                              fontWeight: FontWeight.w400,
                            ),
                            textScaler: TextScaler.linear(1),
                          ),
                          SizedBox(width: context.width / 30),
                        ],
                      ),
                      Spacer(),

                      Container(
                        width: 66.w,
                        height: 21.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: colorFEF0F4,
                          border: Border.all(
                            color: const Color.fromARGB(255, 250, 171, 191),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "خصم ٥٢٪",
                            style: TextStyles.textStyleNormal11.copyWith(
                              color: colorD50B3E,
                              fontWeight: FontWeight.w600,
                            ),
                            textScaler: TextScaler.linear(1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
