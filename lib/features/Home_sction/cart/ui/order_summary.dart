import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('ملخص الطلب', style: TextStyles.textStyleBold16),

        SizedBox(height: 8.h),

        const SummaryRow(title: "سعر الإجمالي", value: "١٢٠ جنيه مصري"),

        const SummaryRow(title: "رسوم الطلب", value: "٢٠ جنيه مصري"),

        const SummaryRow(title: "مبلغ الخصم", value: "-١٠ جنيه مصري"),

        const SummaryRow(
          title: "السعر النهائي",
          value: "١٣٠ جنيه مصري",
          isBold: true,
        ),
      ],
    );
  }
}

class SummaryRow extends StatelessWidget {
  const SummaryRow({
    super.key,
    required this.title,
    required this.value,
    this.isBold = false,
  });

  final String title;
  final String value;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        children: [
          Text(
            title,
            style: isBold
                ? TextStyles.textStyleBold12
                : TextStyles.textStyleNormal12,
          ),

          const Spacer(),

          Text(
            value,
            style: isBold
                ? TextStyles.textStyleBold12
                : TextStyles.textStyleNormal12,
          ),
        ],
      ),
    );
  }
}
