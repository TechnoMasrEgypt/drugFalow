import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/colors.dart' as AppColors;
import 'package:drug_flow/core/constants/screens.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/features/Home_sction/orders/domain/entities/my_orders/my_orders.dart';
import 'package:drug_flow/features/Home_sction/orders/presentation/cubit/orders/orders_cubit.dart';
import 'package:drug_flow/features/Home_sction/orders/presentation/cubit/orders/orders_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

// ─── Enums ───────────────────────────────────────────────────────────────────

enum OrderStatus { completed, cancelled, inReview, inExecution }

OrderStatus mapStatus(String status) {
  switch (status) {
    case 'completed':
      return OrderStatus.completed;
    case 'cancelled':
      return OrderStatus.cancelled;
    case 'pending':
      return OrderStatus.inReview;
    case 'processing':
      return OrderStatus.inExecution;
    default:
      return OrderStatus.inReview;
  }
}

// ─── Main Screen ──────────────────────────────────────────────────────────────

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int _pastFilter = 0; // 0=all  1=مكتمل  2=ملغي
  int _upcomingFilter = 0; // 0=all  1=قيد المراجعة  2=قيد التنفيذ

  @override
  void initState() {
    super.initState();
    context.read<OrdersCubit>()
      ..getMyOrders()
      ..getOrderStatuses();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildTabBar(),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [_buildUpcomingTab(), _buildPastTab()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Header ──────────────────────────────────────────────────────────────────

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 20.sp,
              color: const Color(0xFF1A1A2E),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          SizedBox(width: 6.w),
          Text(
            'طلباتي',
            style: TextStyles.textStyleBold20.copyWith(
              color: const Color(0xFF1A1A2E),
            ),
          ),
        ],
      ),
    );
  }

  // ── TabBar ───────────────────────────────────────────────────────────────────

  Widget _buildTabBar() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFE5E5EA), width: 1)),
      ),
      child: TabBar(
        controller: _tabController,
        labelColor: AppColors.primaryDark,
        unselectedLabelColor: const Color(0xFF9CA3AF),
        labelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        indicatorColor: primaryDark,
        indicatorWeight: 2,
        indicatorSize: TabBarIndicatorSize.tab,
        tabs: const [
          Tab(text: 'الطلبات القادمة'),
          Tab(text: 'الطلبات السابقة'),
        ],
      ),
    );
  }

  // ── Past Orders Tab ──────────────────────────────────────────────────────────

  Widget _buildPastTab() {
    final chips = [
      _ChipData(label: 'تاريخ الطلب', icon: Icons.calendar_month_outlined),
      _ChipData(label: 'مكتمل'),
      _ChipData(label: 'ملغي'),
    ];

    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        final orders = context.read<OrdersCubit>().myOrders?.items ?? [];

        // Base filter: past only
        var filtered = orders
            .where((e) => e.status == "completed" || e.status == "cancelled")
            .toList();

        // Chip filter
        if (_pastFilter == 1) {
          filtered = filtered.where((e) => e.status == "completed").toList();
        } else if (_pastFilter == 2) {
          filtered = filtered.where((e) => e.status == "cancelled").toList();
        }

        return Column(
          children: [
            SizedBox(height: 14.h),
            _buildFilterRow(chips, _pastFilter, (i) {
              setState(() => _pastFilter = i);
            }),
            SizedBox(height: 14.h),
            Expanded(
              child: filtered.isEmpty
                  ? _buildEmptyState()
                  : ListView.separated(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 10.h,
                      ),
                      itemCount: filtered.length,
                      separatorBuilder: (_, __) => SizedBox(height: 12.h),
                      itemBuilder: (_, i) => OrderCard(order: filtered[i]),
                    ),
            ),
          ],
        );
      },
    );
  }

  // ── Upcoming Orders Tab ──────────────────────────────────────────────────────

  Widget _buildUpcomingTab() {
    final chips = [
      _ChipData(label: 'تاريخ الطلب', icon: Icons.calendar_month_outlined),
      _ChipData(label: 'قيد المراجعة'),
      _ChipData(label: 'قيد التنفيذ'),
    ];

    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        final orders = context.read<OrdersCubit>().myOrders?.items ?? [];

        // Base filter: upcoming only
        var filtered = orders
            .where((e) => e.status == "pending" || e.status == "processing")
            .toList();

        // Chip filter
        if (_upcomingFilter == 1) {
          filtered = filtered.where((e) => e.status == "pending").toList();
        } else if (_upcomingFilter == 2) {
          filtered = filtered.where((e) => e.status == "processing").toList();
        }

        return Column(
          children: [
            SizedBox(height: 14.h),
            _buildFilterRow(chips, _upcomingFilter, (i) {
              setState(() => _upcomingFilter = i);
            }),
            SizedBox(height: 14.h),
            Expanded(
              child: filtered.isEmpty
                  ? _buildEmptyState()
                  : ListView.separated(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 10.h,
                      ),
                      itemCount: filtered.length,
                      separatorBuilder: (_, __) => SizedBox(height: 12.h),
                      itemBuilder: (_, i) => OrderCard(order: filtered[i]),
                    ),
            ),
          ],
        );
      },
    );
  }

  // ── Filter Chip Row ──────────────────────────────────────────────────────────

  Widget _buildFilterRow(
    List<_ChipData> chips,
    int selected,
    ValueChanged<int> onSelect,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: List.generate(chips.length, (i) {
          final chip = chips[i];
          final isSelected = i == selected;
          return Padding(
            padding: EdgeInsets.only(left: i < chips.length - 1 ? 8.w : 0),
            child: GestureDetector(
              onTap: () => onSelect(i),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFF1A1A2E) : Colors.white,
                  borderRadius: BorderRadius.circular(5.r),
                  border: Border.all(
                    color: isSelected
                        ? const Color(0xFF1A1A2E)
                        : const Color(0xFFD1D1DB),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (chip.icon != null) ...[
                      Icon(
                        chip.icon,
                        size: 14.sp,
                        color: isSelected
                            ? Colors.white
                            : const Color(0xFF1A1A2E),
                      ),
                      SizedBox(width: 4.w),
                    ],
                    Text(
                      chip.label,
                      style: TextStyles.textStyleNormal12.copyWith(
                        color: isSelected
                            ? Colors.white
                            : const Color(0xFF1A1A2E),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  // ── Empty State ──────────────────────────────────────────────────────────────

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.receipt_long_outlined,
            size: 48.sp,
            color: const Color(0xFFD1D1DB),
          ),
          SizedBox(height: 12.h),
          Text(
            'لا توجد طلبات',
            style: TextStyles.textStyleNormal14.copyWith(
              color: const Color(0xFF9CA3AF),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Filter Chip Data ─────────────────────────────────────────────────────────

class _ChipData {
  final String label;
  final IconData? icon;
  const _ChipData({required this.label, this.icon});
}

// ─── Order Card ───────────────────────────────────────────────────────────────

class OrderCard extends StatelessWidget {
  final OrderItem order;
  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final statusEnum = mapStatus(order.status.toString());
    final config = _badgeConfig(statusEnum);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: const Color(0xFFE5E5EA), width: 0.5),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFDAD6D6).withOpacity(0.04),
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Status badge ──
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: config.bgColor,
                    borderRadius: BorderRadius.circular(5.r),
                    border: Border.all(color: config.borderColor),
                  ),
                  child: Text(
                    config.label,
                    style: TextStyles.textStyleNormal12.copyWith(
                      color: config.textColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ── Order number + date ──
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '#${order.orderCode}',
                  style: TextStyles.textStyleNormal12.copyWith(
                    color: const Color(0xFF9CA3AF),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (order.createdAt != null)
                  Text(
                    order.createdAt!,
                    style: TextStyles.textStyleNormal12.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
              ],
            ),
          ),

          SizedBox(height: 6.h),

          // ── Product count + price ──
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Row(
              children: [
                Text(
                  '${order.itemsCount ?? 0} منتج',
                  style: TextStyles.textStyleNormal14.copyWith(
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                Text(
                  '${order.finalPrice ?? ''} جنيه مصري',
                  style: TextStyles.textStyleBold14.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 12.h),

          // ── Details button ──
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: SizedBox(
              width: double.infinity,
              height: 40.h,
              child: OutlinedButton(
                onPressed: () {
                  context.push(orderDetailsSc, extra: order);
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFD1D1DB), width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  backgroundColor: Colors.white,
                ),
                child: Text(
                  'تفاصيل الطلب',
                  style: TextStyles.textStyleBold14.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 12.h),
        ],
      ),
    );
  }
}

// ─── Badge Config ─────────────────────────────────────────────────────────────

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

_BadgeConfig _badgeConfig(OrderStatus status) {
  switch (status) {
    case OrderStatus.completed:
      return _BadgeConfig(
        label: 'مكتمل',
        bgColor: const Color(0xFFE6F9F0),
        borderColor: const Color(0xFF34C759),
        textColor: const Color(0xFF1A7A40),
      );
    case OrderStatus.cancelled:
      return _BadgeConfig(
        label: 'ملغي',
        bgColor: const Color(0xFFFFF0F3),
        borderColor: const Color(0xFFFF3B6B),
        textColor: const Color(0xFFCC1A45),
      );
    case OrderStatus.inReview:
      return _BadgeConfig(
        label: 'قيد المراجعة',
        bgColor: const Color(0xFFEDF6FF),
        borderColor: const Color(0xFF5AABFF),
        textColor: primaryDark,
      );
    case OrderStatus.inExecution:
      return _BadgeConfig(
        label: 'قيد التنفيذ',
        bgColor: const Color(0xFFFFF8ED),
        borderColor: const Color(0xFFFFB830),
        textColor: const Color(0xFFB07800),
      );
  }
}
