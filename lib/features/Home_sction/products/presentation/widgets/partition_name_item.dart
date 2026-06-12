import 'package:drug_flow/core/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/styles.dart';

class PartitionNameItem extends StatelessWidget {
  final String title;

  PartitionNameItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22.h,
      width: 71.w,

      decoration: BoxDecoration(
        color: colorF7F7F8,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyles.textStyleNormal10.copyWith(
            color: AppColor.partitionNameItemcolor,
          ),
          textScaler: TextScaler.linear(1),
        ),
      ),
    );
  }
}
