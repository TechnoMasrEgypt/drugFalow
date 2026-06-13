import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/utils/network_images.dart';
import 'package:drug_flow/core/widgets/custom_button.dart';
import 'package:drug_flow/features/Home_sction/cart/data/cart_response.dart';
import 'package:drug_flow/features/Home_sction/cart/ui/coupon_section.dart';
import 'package:drug_flow/features/Home_sction/cart/ui/order_summary.dart';
import 'package:drug_flow/features/Home_sction/cart/ui/product_item.dart';
import 'package:drug_flow/features/Home_sction/cart/ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    // required this.item, // ← the specific cart item (product, qty, price)
    required this.cart, // ← the parent cart (totals, warehouse)
    required this.isSaveForLater,
    required this.onConfirm,
    required this.onDelete,
    required this.onSaveForLater,
    required this.onProductTap,
  });

  final CartDataModel cart;
  final bool isSaveForLater;
  final VoidCallback onConfirm;
  final VoidCallback onDelete;
  final VoidCallback onSaveForLater;
  final VoidCallback onProductTap;

  @override
  Widget build(BuildContext context) {
    final items = cart.cartItems ?? [];

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffDFDCDC)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Warehouse header ───────────────────────────────────────────
          Center(child: _WarehouseHeader(warehouse: cart.warehouse)),

          const SizedBox(height: 10),

          // ── Product row ────────────────────────────────────────────────
          // ProductItem(item: item, onTap: onProductTap),
          ...items.map(
            (item) => Column(
              children: [
                ProductItem(
                  item: item,
                  onTap: onProductTap,
                  isdrafted: isSaveForLater,
                ),
                // Thin divider between items, not after the last one
                if (item != items.last)
                  Divider(
                    height: 16,
                    thickness: 1,
                    color: const Color(0xffDFDCDC),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // ── Coupon section (stateless, no change needed) ───────────────
          const CouponSection(),

          const SizedBox(height: 12),

          // ── Order summary with REAL totals ─────────────────────────────
          OrderSummary(cart: cart),

          const SizedBox(height: 12),

          // ── Action buttons ─────────────────────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // "Save for later" only shown in active (non-drafted) tab
              if (isSaveForLater)
                SizedBox(
                  width: 120.w,
                  child: CustomButton(
                    color: Colors.black,
                    btnTitle: 'حفظ لوقت اخر',
                    onPressed: onSaveForLater,
                  ),
                ),

              SizedBox(
                width: 90.w,
                child: CustomButton(
                  color: Colors.red,
                  btnTitle: 'الغاء الطلب',
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (_) => DeleteBottomSheet(onTap: onDelete),
                    );
                  },
                ),
              ),

              SizedBox(
                width: 90.w,
                child: CustomButton(
                  btnTitle: 'تأكيد الطلب',
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (_) => DoneBottomSheet(onTap: onConfirm),
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

// ─────────────────────────────────────────────────────────────────────────────
// Warehouse header — shows logo + name at the top of each card
// ─────────────────────────────────────────────────────────────────────────────
class _WarehouseHeader extends StatelessWidget {
  const _WarehouseHeader({required this.warehouse});

  final WarehouseModel warehouse;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      children: [
        // SVG / webp logo via network
        ClipRRect(
          borderRadius: BorderRadius.circular(6.r),
          child: AppImage(
            image: warehouse.logo,
            width: 42.w,
            height: 42.h,
            fit: BoxFit.contain,
          ),
        ),

        SizedBox(width: 8.w),

        Text(warehouse.name, style: TextStyles.textStyleBold15),
      ],
    );
  }
}
