import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/images.dart';
import 'package:drug_flow/core/utils/helpers.dart';
import 'package:drug_flow/core/widgets/image_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/styles.dart';

class WareHouseItemHorizontal extends StatelessWidget {
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
            child: ClipOval(
              child: ImageHandler(img: ware1, width: 60.r, height: 60.r),
            ),
          ),
          SizedBox(height: 5.w),
          Text(
            "الريان فارم",
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
