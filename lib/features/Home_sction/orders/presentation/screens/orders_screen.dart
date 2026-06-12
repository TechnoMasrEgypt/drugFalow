import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/screens.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/features/Home_sction/orders/presentation/screens/order_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

enum OrderStatus {
  completed, // مكتمل   — green
  cancelled, // ملغي    — pink/red
  inReview, // قيد المراجعة — light blue
  inExecution, // قيد التنفيذ  — orange/yellow
}

enum OrderType { upcoming, past }

class OrderModel {
  final String orderNumber;
  final String date;
  final int productCount;
  final double totalPrice;
  final OrderStatus status;
  final OrderType type;

  const OrderModel({
    required this.orderNumber,
    required this.date,
    required this.productCount,
    required this.totalPrice,
    required this.status,
    required this.type,
  });
}

// ─── Sample data ─────────────────────────────────────────────────────────────

const _pastOrders = [
  OrderModel(
    orderNumber: '#3245132',
    date: '٢٠ يونيو, ٢٠٢٦',
    productCount: 20,
    totalPrice: 0.40,
    status: OrderStatus.completed,
    type: OrderType.past,
  ),
  OrderModel(
    orderNumber: '#3245132',
    date: '٢٠ يونيو, ٢٠٢٦',
    productCount: 20,
    totalPrice: 0.40,
    status: OrderStatus.completed,
    type: OrderType.past,
  ),
  OrderModel(
    orderNumber: '#3245132',
    date: '٢٠ يونيو, ٢٠٢٦',
    productCount: 20,
    totalPrice: 0.40,
    status: OrderStatus.cancelled,
    type: OrderType.past,
  ),
];

const _upcomingOrders = [
  OrderModel(
    orderNumber: '#3245132',
    date: '٢٠ يونيو, ٢٠٢٦',
    productCount: 20,
    totalPrice: 0.40,
    status: OrderStatus.inExecution,
    type: OrderType.upcoming,
  ),
  OrderModel(
    orderNumber: '#3245132٦',
    date: '٢٠ يونيو, ٢٠٢٦',
    productCount: 20,
    totalPrice: 0.40,

    status: OrderStatus.inReview,
    type: OrderType.upcoming,
  ),
  OrderModel(
    orderNumber: '#EP٤OE٦٦',
    date: '٢٠ يونيو, ٢٠٢٦',
    productCount: 20,
    totalPrice: 0.40,
    status: OrderStatus.inReview,
    type: OrderType.upcoming,
  ),
];

// ─── Main Screen ─────────────────────────────────────────────────────────────

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Active filter chips per tab
  // Past tab: 0=تاريخ الطلب  1=مكتمل  2=ملغي
  // Upcoming tab: 0=تاريخ الطلب  1=قيد المراجعة  2=قيد التنفيذ
  int _pastFilter = 0;
  int _upcomingFilter = 0;

  @override
  void initState() {
    super.initState();
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

  // ── Header ─────────────────────────────────────────────────────────────────

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 20.sp,
              color: const Color(0xFF1A1A2E),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
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

  // ── TabBar ──────────────────────────────────────────────────────────────────

  Widget _buildTabBar() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFE5E5EA), width: 1)),
      ),
      child: TabBar(
        controller: _tabController,
        labelColor: color77C7FF,
        unselectedLabelColor: const Color(0xFF9CA3AF),
        labelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        indicatorColor: color77C7FF,
        indicatorWeight: 2,
        indicatorSize: TabBarIndicatorSize.tab,
        tabs: const [
          Tab(text: 'الطلبات القادمة'),
          Tab(text: 'الطلبات السابقة'),
        ],
      ),
    );
  }

  // ── Past Orders Tab ─────────────────────────────────────────────────────────

  Widget _buildPastTab() {
    // Filter chips: تاريخ الطلب | مكتمل | ملغي
    final chips = [
      _ChipData(label: 'تاريخ الطلب', icon: Icons.calendar_month_outlined),
      _ChipData(label: 'مكتمل'),
      _ChipData(label: 'ملغي'),
    ];

    final filtered = _pastFilter == 0
        ? _pastOrders
        : _pastOrders.where((o) {
            if (_pastFilter == 1) return o.status == OrderStatus.completed;
            if (_pastFilter == 2) return o.status == OrderStatus.cancelled;
            return true;
          }).toList();

    return Column(
      children: [
        SizedBox(height: 14.h),
        _buildFilterRow(chips, _pastFilter, (i) {
          setState(() => _pastFilter = i);
        }),
        SizedBox(height: 14.h),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            itemCount: filtered.length,
            separatorBuilder: (_, __) => SizedBox(height: 12.h),
            itemBuilder: (_, i) => _OrderCard(order: filtered[i]),
          ),
        ),
      ],
    );
  }

  // ── Upcoming Orders Tab ─────────────────────────────────────────────────────

  Widget _buildUpcomingTab() {
    // Filter chips: تاريخ الطلب | قيد المراجعة | قيد التنفيذ
    final chips = [
      _ChipData(label: 'تاريخ الطلب', icon: Icons.calendar_month_outlined),
      _ChipData(label: 'قيد المراجعة'),
      _ChipData(label: 'قيد التنفيذ'),
    ];

    final filtered = _upcomingFilter == 0
        ? _upcomingOrders
        : _upcomingOrders.where((o) {
            if (_upcomingFilter == 1) return o.status == OrderStatus.inReview;
            if (_upcomingFilter == 2)
              return o.status == OrderStatus.inExecution;
            return true;
          }).toList();

    return Column(
      children: [
        SizedBox(height: 14.h),
        _buildFilterRow(chips, _upcomingFilter, (i) {
          setState(() => _upcomingFilter = i);
        }),
        SizedBox(height: 14.h),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            itemCount: filtered.length,
            separatorBuilder: (_, __) => SizedBox(height: 12.h),
            itemBuilder: (_, i) => _OrderCard(order: filtered[i]),
          ),
        ),
      ],
    );
  }

  // ── Filter chip row ─────────────────────────────────────────────────────────

  Widget _buildFilterRow(
    List<_ChipData> chips,
    int selected,
    ValueChanged<int> onSelect,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
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
                    width: 1,
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
}

// ─── Filter Chip Data ─────────────────────────────────────────────────────────

class _ChipData {
  final String label;
  final IconData? icon;
  const _ChipData({required this.label, this.icon});
}

// ─── Order Card ───────────────────────────────────────────────────────────────

class _OrderCard extends StatelessWidget {
  final OrderModel order;
  const _OrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: const Color(0xFFE5E5EA), width: 0.5),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 218, 214, 214).withOpacity(0.04),
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Status badge row ──
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [_StatusBadge(status: order.status)],
            ),
          ),

          // ── Order info row ──
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Date — left side in RTL = trailing
                Text(
                  order.orderNumber,
                  style: TextStyles.textStyleNormal12.copyWith(
                    color: AppColor.greyText.withOpacity(0.5),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  order.date,
                  style: TextStyles.textStyleNormal12.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                // Order number — right side in RTL = leading
              ],
            ),
          ),

          SizedBox(height: 6.h),

          // ── Product count + price row ──
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Row(
              children: [
                Text(
                  '${order.productCount} منتج',
                  style: TextStyles.textStyleNormal14.copyWith(
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                Text(
                  '${order.totalPrice.toStringAsFixed(2)} جنيه مصري',
                  style: TextStyles.textStyleBold14.copyWith(
                    color: Colors.black,
                    fontWeight: .w600,
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
                    fontWeight: .w600,
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

// ─── Status Badge ─────────────────────────────────────────────────────────────

class _StatusBadge extends StatelessWidget {
  final OrderStatus status;
  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final config = _badgeConfig(status);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: config.bgColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(5.r),
        border: Border.all(
          color: config.borderColor.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Text(
        config.label,
        style: TextStyles.textStyleNormal12.copyWith(
          color: config.textColor.withOpacity(0.5),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
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
