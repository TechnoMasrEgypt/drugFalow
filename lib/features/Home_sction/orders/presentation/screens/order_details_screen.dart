import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/images.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/utils/network_images.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/entities/my_orders/my_orders.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/entities/order_details/orders_details.dart';
import 'package:drug_flow/features/Home_sction/orders/presentation/cubit/orders/orders_cubit.dart';
import 'package:drug_flow/features/Home_sction/orders/presentation/cubit/orders/orders_state.dart';
import 'package:drug_flow/features/Home_sction/orders/presentation/screens/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

// ─── Helpers ─────────────────────────────────────────────────────────────────

String getStatusLabel(String status) {
  switch (status) {
    case "pending":
      return "قيد الانتظار";
    case "processing":
      return "قيد المعالجة";
    case "completed":
      return "مكتمل";
    case "cancelled":
      return "ملغي";
    default:
      return status;
  }
}

Color getStatusColor(String status) {
  switch (status) {
    case "pending":
      return const Color(0xFFFFB830);
    case "processing":
      return const Color(0xFF5AABFF);
    case "completed":
      return const Color(0xFF34C759);
    case "cancelled":
      return const Color(0xFFFF3B6B);
    default:
      return Colors.grey;
  }
}

// ─── Screen ──────────────────────────────────────────────────────────────────

class OrderDetailScreen extends StatefulWidget {
  final OrderItem order;
  const OrderDetailScreen({super.key, required this.order});

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<OrdersCubit>().getOrderDetails(widget.order.id!);
      }
    });
  }

  bool get isPastOrder =>
      widget.order.status == "completed" || widget.order.status == "cancelled";

  Color get primaryColor =>
      isPastOrder ? const Color(0xFF2C7F99) : const Color(0xFFF53D6B);

  String get buttonText => isPastOrder ? 'تقييم الطلب' : 'إلغاء الطلب';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: _buildAppBar(context),
      body: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          final details = context.read<OrdersCubit>().orderDetailsResponse;

          if (details == null) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = details.data;
          final warehouse = data?.warehouse;
          final items = data?.items ?? [];

          if (items.isEmpty) {
            return const Center(child: Text('لا توجد منتجات'));
          }

          return ListView(
            children: [
              // ── Single white card (mirrors _PharmacyOrderCard) ──
              Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Pharmacy / order header ──
                    _PharmacyHeader(
                      name: warehouse?.name ?? '',
                      logoUrl: warehouse?.logo,
                    ),

                    // ── Items ──
                    ...items.map((item) => _OrderItemTile(item: item)),

                    // ── Divider ──
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: const Color(0xFFF0F0F0),
                      indent: 16.w,
                      endIndent: 16.w,
                    ),

                    // ── Order summary ──
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
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
                            value:
                                '${data?.totalPrice ?? widget.order.finalPrice ?? ''} جنيه',
                            valueColor: const Color(0xFF1A1A2E),
                          ),
                          SizedBox(height: 6.h),
                          _SummaryRow(
                            label: 'قيمة الخصم',
                            value: '- ${data?.discount ?? 0} جنيه',
                            valueColor: const Color(0xFF2ECC71),
                          ),
                          SizedBox(height: 6.h),
                          _SummaryRow(
                            label: 'السعر النهائي',
                            value:
                                '${data?.finalPrice ?? widget.order.finalPrice ?? ''} جنيه',
                            valueColor: const Color(0xFF1A1A2E),
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),

                    // ── Action button ──
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16.w,
                        right: 16.w,
                        bottom: 16.h,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: 48.h,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (isPastOrder) {
                              // تقييم الطلب

                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (_) {
                                  return const RateOrderBottomSheet();
                                },
                              );
                            } else {
                              // إلغاء الطلب

                              toastification.show(
                                context: context,
                                type: ToastificationType.info,
                                style: ToastificationStyle.flatColored,
                                title: Text('سيتم مراجعة طلب الالغاء '),

                                autoCloseDuration: const Duration(seconds: 3),
                                alignment: Alignment.bottomCenter,
                              );
                            }
                          },

                          // TODO: wire up rate / cancel via cubit
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          child: Text(
                            buttonText,
                            style: TextStyles.textStyleBold14.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
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
            // ── Status badge ──

            // ── Order number + back arrow ──
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
                  'طلب #${widget.order.orderCode}',
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
                border: Border.all(color: getStatusColor(widget.order.status)),
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Text(
                getStatusLabel(widget.order.status),
                style: TextStyles.textStyleNormal12.copyWith(
                  color: getStatusColor(widget.order.status),
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

// ─── Pharmacy Header ──────────────────────────────────────────────────────────

class _PharmacyHeader extends StatelessWidget {
  const _PharmacyHeader({required this.name, this.logoUrl});

  final String name;
  final String? logoUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          Container(
            width: 36.w,
            height: 36.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFEEF4FF),
            ),
            child: logoUrl != null && logoUrl!.isNotEmpty
                ? ClipOval(
                    child: AppImage(image: logoUrl!, width: 36.w, height: 36.w),
                  )
                : AppImage(image: ware1, width: 20.w, height: 20.h),
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
        ],
      ),
    );
  }
}

// ─── Order Item Tile ──────────────────────────────────────────────────────────

class _OrderItemTile extends StatelessWidget {
  const _OrderItemTile({required this.item});

  final OrderItemDetails item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Product image ──
          Container(
            width: 80.w,
            height: 80.w,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: AppImage(
              image: item.productImage ?? ware1,
              width: 80.w,
              height: 80.h,
            ),
          ),
          SizedBox(width: 12.w),

          // ── Text info ──
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.productName ?? '',
                  style: TextStyles.textStyleNormal12.copyWith(
                    color: const Color(0xFF1A1A2E),
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    Text(
                      '${item.price ?? ''} ',
                      style: TextStyles.textStyleBold12.copyWith(
                        color: const Color(0xFF1A1A2E),
                      ),
                    ),
                    Text(
                      'جنيه مصري',
                      style: TextStyles.textStyleNormal11.copyWith(
                        color: const Color(0xFF9E9E9E),
                      ),
                    ),
                    // Show original price with strikethrough only if it differs
                    if (item.price != null && item.price != item.price) ...[
                      SizedBox(width: 6.w),
                      Text(
                        '${item.price}',
                        style: TextStyles.textStyleNormal12.copyWith(
                          color: const Color(0xFF9E9E9E),
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ],
                ),
                SizedBox(height: 8.h),

                // ── Quantity badge ──
                Container(
                  width: 36.w,
                  height: 28.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFE0E0E0)),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Text(
                    '${item.quantity ?? 1}',
                    style: TextStyles.textStyleBold14.copyWith(
                      color: const Color(0xFF1A1A2E),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Summary Row ─────────────────────────────────────────────────────────────

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.label,
    required this.value,
    required this.valueColor,
    this.fontWeight,
  });

  final String label;
  final String value;
  final Color valueColor;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyles.textStyleNormal13.copyWith(
            color: const Color(0xFF757575),
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          value,
          style: TextStyles.textStyleNormal12.copyWith(
            color: valueColor,
            fontWeight: fontWeight ?? FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class RateOrderBottomSheet extends StatefulWidget {
  const RateOrderBottomSheet({super.key});

  @override
  State<RateOrderBottomSheet> createState() => _RateOrderBottomSheetState();
}

class _RateOrderBottomSheetState extends State<RateOrderBottomSheet> {
  int rating = 0;
  final TextEditingController reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),

          SizedBox(height: 24.h),

          Text('ما هو تقييمك لطلبك؟', style: TextStyles.textStyleBold16),

          SizedBox(height: 8.h),

          Text(
            'ساعدنا بتحسين تجربة الطلب الخاصة بك',
            style: TextStyles.textStyleNormal12.copyWith(color: Colors.grey),
          ),

          SizedBox(height: 20.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    rating = index + 1;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Icon(
                    Icons.star,
                    size: 34.sp,
                    color: index < rating
                        ? const Color(0xffF6C343)
                        : const Color(0xffE5E5E5),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 20.h),

          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'اخبرنا المزيد (اختياري)',
              style: TextStyles.textStyleNormal12,
            ),
          ),

          SizedBox(height: 8.h),

          TextField(
            controller: reviewController,
            maxLines: 4,
            decoration: InputDecoration(
              hintText: 'أخبرنا برأيك',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),

          SizedBox(height: 20.h),

          SizedBox(
            width: double.infinity,
            height: 48.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2C7F99),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);

                showModalBottomSheet(
                  context: context,
                  isDismissible: false,
                  enableDrag: false,
                  backgroundColor: Colors.transparent,
                  builder: (_) => const RatingSuccessBottomSheet(),
                );
              },
              child: Text(
                'إرسال التقييم',
                style: TextStyles.textStyleBold16.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RatingSuccessBottomSheet extends StatelessWidget {
  const RatingSuccessBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),

          SizedBox(height: 30.h),

          Container(
            width: 110.w,
            height: 110.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xffD8EDF4),
            ),
            child: Center(
              child: Container(
                width: 70.w,
                height: 70.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff2C7F99),
                ),
                child: Icon(Icons.check, color: Colors.white, size: 38.sp),
              ),
            ),
          ),

          SizedBox(height: 24.h),

          Text('شكراً لتقييمك', style: TextStyles.textStyleBold16),

          SizedBox(height: 8.h),

          Text(
            'يساعدنا رأيك في التحسين',
            style: TextStyles.textStyleNormal12.copyWith(color: Colors.grey),
          ),

          SizedBox(height: 24.h),

          SizedBox(
            width: double.infinity,
            height: 48.h,
            child: OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('إغلاق'),
            ),
          ),
        ],
      ),
    );
  }
}
