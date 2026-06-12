import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/exts.dart';
import 'package:drug_flow/core/constants/images.dart';
import 'package:drug_flow/core/constants/screens.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/utils/helpers.dart';
import 'package:drug_flow/core/utils/network_images.dart';
import 'package:drug_flow/core/widgets/image_handler.dart';
import 'package:drug_flow/core/widgets/svg_handler.dart';
import 'package:drug_flow/features/Home_sction/home/data/warehouse_response.dart';
import 'package:drug_flow/features/Home_sction/home/logic/home_cubit.dart';
import 'package:drug_flow/features/Home_sction/home/ui/ware_house_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class WareHousesItem extends StatelessWidget {
  final WarehouseItem data;
  WareHousesItem({required this.data});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(data);
        context.push(warehouseDetailsScreenSc, extra: data);
      },
      child: Container(
        width: 109.w,
        height: 133.h,
        padding: EdgeInsets.symmetric(
          horizontal: context.width / 50,
          vertical: context.height / 90,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color111111.withOpacity(.1)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 93.w,
              height: 93.h,
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: color111111.withOpacity(.1)),
              ),
              child: AppImage(
                image: data.logo ?? "",
                width: context.width / 6,
                height: context.width / 6,
              ),
            ),
            SizedBox(height: context.height / 70),
            Text(
              data.name ?? "الريان فارم",
              style: TextStyles.textStyleNormal13.copyWith(
                color: color6C6C89,
                fontWeight: FontWeight.w500,
              ),
              textScaler: TextScaler.linear(1),
            ),
          ],
        ),
      ),
    );
  }
}
