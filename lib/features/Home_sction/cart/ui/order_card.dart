import 'dart:ui';

import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/utils/helpers.dart';
import 'package:drug_flow/core/widgets/custom_button.dart';
import 'package:drug_flow/features/Home_sction/cart/ui/coupon_section.dart';
import 'package:drug_flow/features/Home_sction/cart/ui/order_summary.dart';
import 'package:drug_flow/features/Home_sction/cart/ui/product_item.dart';
import 'package:drug_flow/features/Home_sction/cart/ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderCard extends StatefulWidget {
  const OrderCard({
    super.key,
    required this.onConfirm,
    required this.onDelete,
    required this.onProductTap,
    this.isSaveForLater = false, // ← new
  });

  final VoidCallback onConfirm;
  final VoidCallback onDelete;
  final VoidCallback onProductTap;
  final bool isSaveForLater; // ← new

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 223, 220, 220)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          ProductItem(onTap: widget.onProductTap),
          const SizedBox(height: 12),
          const CouponSection(),
          const SizedBox(height: 12),
          const OrderSummary(),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // ── Hide "save for later" button when already in that tab ──
              if (!widget.isSaveForLater)
                Container(
                  width: 120,
                  child: CustomButton(
                    color: Colors.black,
                    btnTitle: 'حفظ لوقت اخر  ',
                    onPressed: () {},
                  ),
                ),

              Container(
                width: 90.w,
                child: CustomButton(
                  color: Colors.red,
                  btnTitle: 'الغاء لطلب',
                  onPressed: () {},
                ),
              ),
              Container(
                width: 90.w,
                child: CustomButton(
                  btnTitle: 'تأكيد الطلب ',
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (_) => DoneBottomSheet(),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
