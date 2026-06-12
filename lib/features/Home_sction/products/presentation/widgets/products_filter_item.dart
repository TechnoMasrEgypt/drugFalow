import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsFilterItem extends StatelessWidget {
  final String title;
  double? width;
  ProductsFilterItem({required this.title, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 28.h,
      width: width ?? 105,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1.0, color: color121217.withOpacity(.1)),
      ),
      child: Text(
        title,
        style: TextStyles.textStyleNormal14.copyWith(color: color121217),
        textScaler: TextScaler.linear(1),
      ),
    );
  }
}
