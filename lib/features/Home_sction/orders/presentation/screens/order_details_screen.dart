import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/images.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/utils/network_images.dart';
import 'package:drug_flow/features/Home_sction/orders/presentation/screens/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ─── Data Models ─────────────────────────────────────────────────────────────

class OrderDetailItem {
  final String name;
  final String price;
  final String? originalPrice;
  final int quantity;
  final String imagePath;

  const OrderDetailItem({
    required this.name,
    required this.price,
    this.originalPrice,
    required this.quantity,
    required this.imagePath,
  });
}

class PharmacyOrder {
  final String pharmacyName;
  final String pharmacyLogo;
  final List<OrderDetailItem> items;
  final String totalPrice;
  final String discount;
  final String finalPrice;
  final String cancelButtonLabel;

  const PharmacyOrder({
    required this.pharmacyName,
    required this.pharmacyLogo,
    required this.items,
    required this.totalPrice,
    required this.discount,
    required this.finalPrice,
    required this.cancelButtonLabel,
  });
}

// ─── Helper: status label & color ────────────────────────────────────────────

extension OrderStatusUI on OrderStatus {
  String get label {
    switch (this) {
      case OrderStatus.completed:
        return 'مكتمل';
      case OrderStatus.cancelled:
        return 'ملغي';
      case OrderStatus.inReview:
        return 'قيد المراجعة';
      case OrderStatus.inExecution:
        return 'قيد التنفيذ';
    }
  }

  Color get color {
    switch (this) {
      case OrderStatus.completed:
        return const Color(0xFF2ECC71);
      case OrderStatus.cancelled:
        return const Color(0xFFE74C3C);
      case OrderStatus.inReview:
        return const Color(0xFFF39C12);
      case OrderStatus.inExecution:
        return const Color(0xFFE91E8C);
    }
  }
}

// ─── Screen ──────────────────────────────────────────────────────────────────

class OrderDetailScreen extends StatelessWidget {
  /// The order summary card that was tapped (used for the AppBar).
  final OrderModel order;
  bool get isPastOrder => order.type == OrderType.past;
  Color get primaryColor =>
      isPastOrder ? const Color(0xFF4A90E2) : const Color(0xFFF53D6B);
  String getButtonText(String pharmacyName) {
    if (isPastOrder) {
      return 'تقييم الطلب من $pharmacyName';
    }

    return 'الغاء الطلب من $pharmacyName';
  }

  /// Pharmacy sub-orders shown inside this detail screen.
  /// Pass real data from your state/bloc; using sample data below as fallback.
  final List<PharmacyOrder>? pharmacyOrders;

  const OrderDetailScreen({
    super.key,
    required this.order,
    this.pharmacyOrders,
  });

  // ── Sample data – replace with real bloc/repo data ──
  static const _samplePharmacyOrders = [
    PharmacyOrder(
      pharmacyName: 'الريان فارم لتجاره وتوزيع الادويه',
      pharmacyLogo: panadol,
      items: [
        OrderDetailItem(
          name:
              'باناديول اكسترا اويتيزورب لتخفيف إضافي\nمسكن فعال للألم والحمى | 24 قرص',
          price: '٥٨ جنيه مصري',
          originalPrice: '٤٠ جنيه مصري',
          quantity: 2,
          imagePath: panadol,
        ),
      ],
      totalPrice: '١٢٠ جنيه مصري',
      discount: '٢٠ جنيه مصري',
      finalPrice: '١٠٠ جنيه مصري',
      cancelButtonLabel: 'الغاء الطلب من الريان فارم',
    ),
    PharmacyOrder(
      pharmacyName: 'كينو فارم / القناوي لتجارة الأدوية',
      pharmacyLogo: panadol,
      items: [
        OrderDetailItem(
          name:
              'باناديول اكسترا اويتيزورب لتخفيف إضافي\nمسكن فعال للألم والحمى | 24 قرص',
          price: '٥٨ جنيه مصري',
          quantity: 2,
          imagePath: panadol,
        ),
        OrderDetailItem(
          name:
              'باناديول اكسترا اويتيزورب لتخفيف إضافي\nمسكن فعال للألم والحمى | 24 قرص',
          price: '٥٨ جنيه مصري',
          originalPrice: '٤٠ جنيه مصري',
          quantity: 2,
          imagePath: panadol,
        ),
      ],
      totalPrice: '١٢٠ جنيه مصري',
      discount: '٢٠ جنيه مصري',
      finalPrice: '١٠٠ جنيه مصري',
      cancelButtonLabel: 'الغاء الطلب من كينو فارم',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final displayOrders = pharmacyOrders ?? _samplePharmacyOrders;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: _buildAppBar(context),
      body: ListView.builder(
        // padding: EdgeInsets.symmetric(vertical: 12.h),
        itemCount: displayOrders.length,
        itemBuilder: (context, index) => _PharmacyOrderCard(
          order: displayOrders[index],
          isPastOrder: isPastOrder,
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // ── Status badge (left side visually in RTL) ──

            // ── Order number + back arrow (right side visually in RTL) ──
            Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(
                    Icons.arrow_back,
                    color: const Color(0xFF1A1A2E),
                    size: 20.sp,
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  'طلب ${order.orderNumber}',
                  style: TextStyles.textStyleBold16.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
              decoration: BoxDecoration(
                border: Border.all(color: order.status.color),
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Text(
                order.status.label,
                style: TextStyles.textStyleNormal12.copyWith(
                  color: order.status.color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Pharmacy Order Card ──────────────────────────────────────────────────────

class _PharmacyOrderCard extends StatelessWidget {
  const _PharmacyOrderCard({required this.order, required this.isPastOrder});
  final bool isPastOrder;
  final PharmacyOrder order;
  Color get primaryColor =>
      isPastOrder ? const Color(0xFF4A90E2) : const Color(0xFFF53D6B);
  String getButtonText(String pharmacyName) {
    if (isPastOrder) {
      return 'تقييم الطلب من $pharmacyName';
    }

    return 'الغاء الطلب من $pharmacyName';
  }

  static const _primaryPink = Color(0xFFF53D6B);
  static const _discountGreen = Color(0xFF2ECC71);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          // ── Pharmacy Header ──
          _PharmacyHeader(
            logoPath: order.pharmacyLogo,
            name: order.pharmacyName,
          ),

          // ── Items ──
          ...order.items.map((item) => _OrderItemTile(item: item)),

          // ── Order Summary ──
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ملخص الطلب',
                  style: TextStyles.textStyleBold16.copyWith(
                    color: const Color(0xFF1A1A2E),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10.h),
                _SummaryRow(
                  label: 'سعر الإجمالي',
                  value: order.totalPrice,
                  valueColor: const Color(0xFF1A1A2E),
                ),
                SizedBox(height: 6.h),
                _SummaryRow(
                  label: 'قيمة الخصم',
                  value: '- ${order.discount}',
                  valueColor: _discountGreen,
                ),
                SizedBox(height: 6.h),
                _SummaryRow(
                  fontWeight: .w600,
                  label: 'السعر النهائي',
                  value: order.finalPrice,
                  valueColor: const Color(0xFF1A1A2E),
                ),
              ],
            ),
          ),

          // ── Cancel Button ──
          Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
            child: SizedBox(
              width: double.infinity,
              height: 48.h,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: handle cancel via bloc/cubit
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isPastOrder
                      ? const Color(0xFF2C7F99)
                      : const Color(0xFFF53D6B),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: Text(
                  isPastOrder
                      ? "${getButtonText(order.pharmacyName)}"
                      : "${getButtonText(order.pharmacyName)}",
                  style: TextStyles.textStyleBold14.copyWith(
                    color: Colors.white,
                    fontWeight: .w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Pharmacy Header ──────────────────────────────────────────────────────────

class _PharmacyHeader extends StatelessWidget {
  const _PharmacyHeader({required this.name, required this.logoPath});

  final String name;
  final String logoPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          Container(
            width: 36.w,
            height: 36.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFEEF4FF),
            ),
            child: AppImage(image: ware1, width: 20.w, height: 20.h),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              name,
              textAlign: TextAlign.right,
              style: TextStyles.textStyleBold12.copyWith(
                color: const Color(0xFF1A1A2E),
              ),
            ),
          ),

          // Swap Icon with ClipOval + Image.asset when you have the asset
        ],
      ),
    );
  }
}

// ─── Order Item Tile ──────────────────────────────────────────────────────────

class _OrderItemTile extends StatelessWidget {
  const _OrderItemTile({required this.item});

  final OrderDetailItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Text info ──
          Container(
            width: 80.w,
            height: 80.w,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(10.r),
            ),
            // Replace with: Image.asset(item.imagePath, fit: BoxFit.contain)
            child: AppImage(image: ware1, width: 80.w, height: 80.h),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: TextStyles.textStyleNormal12.copyWith(
                    color: const Color(0xFF1A1A2E),
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    Text(
                      item.price,
                      style: TextStyles.textStyleBold12.copyWith(
                        color: const Color(0xFF1A1A2E),
                      ),
                    ),
                    Text(
                      "جنيه مصري",
                      style: TextStyles.textStyleNormal11.copyWith(
                        color: const Color(0xFF9E9E9E),
                      ),
                    ),
                    if (item.originalPrice != null) ...[
                      SizedBox(width: 6.w),
                      Text(
                        item.originalPrice!,
                        style: TextStyles.textStyleNormal12.copyWith(
                          color: const Color(0xFF9E9E9E),
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ],
                ),
                SizedBox(height: 8.h),
                // Quantity badge
                Container(
                  width: 36.w,
                  height: 28.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFE0E0E0)),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Text(
                    '${item.quantity}',
                    style: TextStyles.textStyleBold14.copyWith(
                      color: const Color(0xFF1A1A2E),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: 12.w),

          // ── Product image ──
        ],
      ),
    );
  }
}

// ─── Product Image Placeholder ────────────────────────────────────────────────

// ─── Summary Row ──────────────────────────────────────────────────────────────

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.label,
    required this.value,
    required this.valueColor,
    this.fontWeight,
    this.fontSize,
  });
  final String label;
  final String value;
  final Color valueColor;
  final FontWeight? fontWeight;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyles.textStyleNormal13.copyWith(
            color: const Color(0xFF757575),
            fontWeight: .w400,
          ),
        ),
        Text(
          value,
          style: TextStyles.textStyleNormal12.copyWith(
            color: valueColor,
            fontWeight: fontWeight ?? .w400,
          ),
        ),
      ],
    );
  }
}

_BadgeConfig _badgeConfig(OrderStatus status) {
  switch (status) {
    case OrderStatus.completed:
      return _BadgeConfig(
        label: 'مكتمل',
        bgColor: const Color(0xFFE6F9F0).withOpacity(0.5),
        borderColor: const Color(0xFF34C759).withOpacity(0.5),
        textColor: const Color(0xFF1A7A40).withOpacity(0.5),
      );
    case OrderStatus.cancelled:
      return _BadgeConfig(
        label: 'ملغي',
        bgColor: const Color(0xFFFFF0F3).withOpacity(0.5),
        borderColor: const Color(0xFFFF3B6B).withOpacity(0.5),
        textColor: const Color(0xFFCC1A45).withOpacity(0.5),
      );
    case OrderStatus.inReview:
      return _BadgeConfig(
        label: 'قيد المراجعة',
        bgColor: const Color(0xFFEDF6FF).withOpacity(0.5),
        borderColor: const Color(0xFF5AABFF).withOpacity(0.5),
        textColor: const Color(0xFF1878CC).withOpacity(0.5),
      );
    case OrderStatus.inExecution:
      return _BadgeConfig(
        label: 'قيد التنفيذ',
        bgColor: const Color(0xFFFFF8ED).withOpacity(0.5),
        borderColor: const Color(0xFFFFB830).withOpacity(0.5),
        textColor: const Color(0xFFB07800).withOpacity(0.5),
      );
  }
}

class _BadgeConfig {
  final String label;
  final Color bgColor;
  final Color borderColor;
  final Color textColor;

  const _BadgeConfig({
    required this.label,
    required this.bgColor,
    required this.borderColor,
    required this.textColor,
  });
}
