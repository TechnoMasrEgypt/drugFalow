import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/images.dart';
import 'package:drug_flow/core/utils/helpers.dart';
import 'package:drug_flow/core/utils/network_images.dart';
import 'package:drug_flow/core/widgets/image_handler.dart';
import 'package:drug_flow/features/Home_sction/home/data/warehouse_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/styles.dart';

class WareHouseItemHorizontal extends StatelessWidget {
  late final WarehouseItem warehouse;
  WareHouseItemHorizontal({required this.warehouse});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.width / 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: color111111.withOpacity(.1)),
            ),
            child: AppImage(
              image: warehouse.logo ?? ware1,
              width: 50.r,
              height: 50.r,
            ),
          ),
          SizedBox(height: 5.w),
          Text(
            warehouse.name ?? "الريان فارم",
            style: TextStyles.textStyleNormal13.copyWith(
              color: color6C6C89,
              fontWeight: FontWeight.w500,
            ),
            textScaler: TextScaler.linear(1),
          ),
        ],
      ),
    );
  }
}
