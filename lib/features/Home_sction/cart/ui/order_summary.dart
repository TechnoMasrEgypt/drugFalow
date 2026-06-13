import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/features/Home_sction/cart/data/cart_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key, required this.cart});

  /// The whole cart object so we can read subTotal, orderFees, total.
  final CartDataModel cart;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('ملخص الطلب', style: TextStyles.textStyleBold16),

        SizedBox(height: 8.h),

        SummaryRow(title: 'سعر الإجمالي', value: '${cart.subTotal} ج.م'),

        SummaryRow(title: 'رسوم الطلب', value: '${cart.orderFees} ج.م'),

        SummaryRow(
          title: 'السعر النهائي',
          value: '${cart.total} ج.م',
          isBold: true,
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Reusable row (kept identical to original, no logic change)
// ─────────────────────────────────────────────────────────────────────────────
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
