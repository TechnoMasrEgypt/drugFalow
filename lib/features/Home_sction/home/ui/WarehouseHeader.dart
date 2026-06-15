import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/images.dart';
import 'package:drug_flow/core/constants/spacing.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/localization/lang_keys.dart';
import 'package:drug_flow/core/utils/helpers.dart';
import 'package:drug_flow/core/utils/network_images.dart';
import 'package:drug_flow/features/Home_sction/home/data/warehouse_details_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WarehouseHeader extends StatelessWidget {
  final WarehouseDetailsData data;

  const WarehouseHeader({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: AppColor.shadowColor, width: .1),
          ),
          child: AppImage(
            image: data.logo ?? ware2,
            width: 60.w,
            height: 80.h,
            fit: BoxFit.contain,
          ),
        ),
        horizontalSpace(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data.name ?? "", style: TextStyles.textStyleNormal13),

            Text(
              data.governorates?.map((e) => e.name).join(" - ") ?? "",
              style: TextStyles.textStyleNormal11.copyWith(
                color: AppColor.detailsText,
              ),
            ),
            Row(
              children: [
                Text(
                  'ايام العمل ',
                  style: TextStyles.textStyleNormal11.copyWith(
                    color: AppColor.detailsText,
                  ),
                ),
                horizontalSpace(4),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(
                      255,
                      226,
                      233,
                      235,
                    ).withOpacity(0.5),
                    border: Border.all(color: AppColor.shadowColor, width: 0.4),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  width: 161.w,
                  height: 22.h,
                  child: Center(
                    child: Text(
                      "${data.workingDays!.first} - ${data.workingDays!.last}",
                      style: TextStyles.textStyleNormal10.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // horizontalSpace(50),
            verticalSpace(10),
            Row(
              children: [
                Text(
                  'تسليم الطلبات ',
                  style: TextStyles.textStyleNormal11.copyWith(
                    color: AppColor.detailsText,
                  ),
                ),
                horizontalSpace(4),
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.detailsback2,
                    border: Border.all(
                      color: const Color.fromARGB(255, 223, 243, 253),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  width: 99.w,
                  height: 22.h,
                  child: Center(
                    child: Text(
                      "    ${data.deliveryTimes!}- ${data.workingDays!.last}",
                      style: TextStyles.textStyleNormal10.copyWith(
                        color: AppColor.detailsTback2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            verticalSpace(7.5),
            Row(
              children: [
                Text(
                  "${context.translate(LangKeys.minimumOrder)} ",
                  style: TextStyles.textStyleNormal11.copyWith(
                    color: AppColor.detailsText,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.detailsback3.withOpacity(0.5),
                    border: Border.all(
                      color: const Color.fromARGB(255, 252, 226, 218),
                      width: .8,
                    ),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  width: 56.w,
                  height: 22.h,
                  child: Center(
                    child: Text(
                      "    ${data.minimumPurchase} ",
                      style: TextStyles.textStyleNormal10.copyWith(
                        color: AppColor.detailsTback3,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
