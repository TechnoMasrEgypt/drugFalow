import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/images.dart';
import 'package:drug_flow/core/constants/spacing.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/utils/network_images.dart';
import 'package:drug_flow/features/Home_sction/cart/ui/order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool _isCurrentRequest = true; // true = current request, false = save later

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.all(16.r),
        children: [
          // ── Header ──
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("سلة المشتريات", style: TextStyles.textStyleBold20),
              SizedBox(height: 4.h),
              
            ],
          ),
          SizedBox(height: 12.h),

          // ── Toggle tabs ──
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Save for later
              GestureDetector(
                onTap: () => setState(() => _isCurrentRequest = false),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: EdgeInsets.only(top: 5.h),
                  width: 160.w,
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: _isCurrentRequest ? Colors.white : AppColor.textPrimary,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.bookmark_outline_rounded,
                        color: _isCurrentRequest ? AppColor.textPrimary : Colors.white,
                      ),
                      verticalSpace(5),
                      Text(
                        "save for later",
                        style: TextStyles.textStyleNormal16.copyWith(
                          color: _isCurrentRequest ? AppColor.textPrimary : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Current request
              GestureDetector(
                onTap: () => setState(() => _isCurrentRequest = true),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: EdgeInsets.only(top: 5.h),
                  width: 160.w,
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: _isCurrentRequest ? AppColor.textPrimary : Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_balance_wallet_rounded,
                        color: _isCurrentRequest ? Colors.white : AppColor.textPrimary,
                      ),
                      verticalSpace(2),
                      Text(
                        "current request",
                        style: TextStyles.textStyleNormal16.copyWith(
                          color: _isCurrentRequest ? Colors.white : AppColor.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // ── Body ──
          OrderCard(
            isSaveForLater: !_isCurrentRequest,
            onConfirm: () {},
            onDelete: () {},
            onProductTap: () {},
          ),
          const SizedBox(height: 16),
          OrderCard(
            isSaveForLater: !_isCurrentRequest,
            onConfirm: () {},
            onDelete: () {},
            onProductTap: () {},
          ),
        ],
      ),
    );
  }
}