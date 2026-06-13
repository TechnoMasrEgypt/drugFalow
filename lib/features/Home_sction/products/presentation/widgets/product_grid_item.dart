import 'package:drug_flow/core/constants/screens.dart';
import 'package:drug_flow/core/constants/spacing.dart';
import 'package:drug_flow/core/utils/helpers.dart';
import 'package:drug_flow/features/Home_sction/home/data/warehouse_details_response.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/screens/products_details_screen.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/widgets/partition_name_item.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/widgets/product_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/images.dart';
import '../../../../../core/constants/styles.dart';
import '../../../../../core/widgets/image_handler.dart';
import 'package:go_router/go_router.dart';

class ProductGridItem extends StatelessWidget {
  ProductModel? productModel;
  ProductGridItem({super.key, this.productModel});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(productsListSc, extra: productModel);
      },
      child: Container(
        width: context.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Align(
                  alignment: .centerStart,
                  child: ImageHandler(
                    img: panadol,
                    width: context.width / 3.5,
                    height: context.height / 5,
                  ),
                ),
              ),
            ),
            SizedBox(height: context.height / 80),
            Text(
              productModel?.name ??
                  "بانادول اكسترا اوبتيزورب لتخفيف إضافي مسكن فعال للألم والحمي | 24 قرص",
              style: TextStyles.textStyleNormal13.copyWith(color: color121217),
              textScaler: TextScaler.linear(1),
              textAlign: TextAlign.start,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: context.height / 50),
            Text(
              "اسم القسم",
              style: TextStyles.textStyleNormal11.copyWith(color: color6C6C89),
              textScaler: TextScaler.linear(1),
            ),
            SizedBox(height: context.height / 90),
            Wrap(
              spacing: 4.w,
              runSpacing: 2.h,
              children: productModel!.activeIngredients!
                  .map(
                    (ing) => Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: colorF7F7F8,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        ing.name ?? "",
                        style: TextStyles.textStyleNormal10.copyWith(
                          color: AppColor.partitionNameItemcolor,
                        ),
                        textScaler: TextScaler.linear(1),
                      ),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: context.height / 180),
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
                    child: ImageHandler(
                      img: ware1,
                      width: context.width / 15,
                      height: context.width / 11,
                    ),
                  ),
                ),
                horizontalSpace(1),
                Text(
                  productModel?.warehouse?.name ??
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
                  productModel?.price ?? "٥٨",
                  style: TextStyles.textStyleNormal16.copyWith(
                    color: color121217,
                    fontWeight: FontWeight.w400,
                  ),
                  textScaler: TextScaler.linear(1),
                ),
                horizontalSpace(4),
                Text(
                  "ج.م",
                  style: TextStyles.textStyleNormal11.copyWith(
                    color: color6C6C89,
                    fontWeight: FontWeight.w600,
                  ),
                  textScaler: TextScaler.linear(1),
                ),
                SizedBox(width: context.width / 30),
                Spacer(),
                Container(
                  width: 76.w,
                  height: 25.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: colorFEF0F4,
                    border: Border.all(color: colorFBB1C4),
                  ),
                  child: Center(
                    child: Text(
                      productModel?.discountPercentage == null
                          ? "خصم 0٪"
                          : "${productModel?.discountPercentage}% خصم",
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
            verticalSpace(5),
          ],
        ),
      ),
    );
  }
}
