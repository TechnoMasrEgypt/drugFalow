// lib/features/Home_sction/home/ui/search_results_screen.dart

import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/spacing.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/injection_container/injection_container.dart';
import 'package:drug_flow/core/utils/helpers.dart';
import 'package:drug_flow/core/utils/network_images.dart';
import 'package:drug_flow/core/widgets/silver_grid_delegate_with_fixed_axis_count/silver_grid_delegate_with_fixed_axis_count.dart';
import 'package:drug_flow/features/Home_sction/filters/filter_cubit.dart';
import 'package:drug_flow/features/Home_sction/filters/filter_state.dart';
import 'package:drug_flow/features/Home_sction/home/data/search_response.dart';
import 'package:drug_flow/features/Home_sction/home/data/warehouse_details_response.dart';
import 'package:drug_flow/features/Home_sction/home/ui/ware_house_details_screen.dart';
import 'package:drug_flow/features/Home_sction/home/ui/products_filter_row.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/screens/products_details_screen.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/widgets/product_grid_item.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Navigated to from [MedicineSearchField] when the user picks a result.
///
/// Behaviour:
/// - If [results] contain products from multiple warehouses
///   (i.e. a medicine-name search from the home screen):
///     → show warehouse chips + all matching products.
///     → tapping a warehouse chip filters to that warehouse's products.
///     → tapping a product navigates to [WarehouseDetailsScreen].
///
/// - If [results] contain products from ONE warehouse
///   (i.e. a search inside a warehouse):
///     → skip the warehouse row, show products directly.
///     → tapping a product navigates to [ProductDetailsScreen].
class SearchResultsScreen extends StatefulWidget {
  /// The raw query the user typed.
  final String query;

  /// All product results returned by the search API.
  final List<SearchProductModel> results;

  /// If the search was triggered from inside a specific warehouse,
  /// pass its id here. When set, tapping a product opens [ProductDetailsScreen].
  final int? fromWarehouseId;

  const SearchResultsScreen({
    super.key,
    required this.query,
    required this.results,
    this.fromWarehouseId,
  });

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  bool _isGridView = false;

  /// The warehouse chip that is currently selected (null = show all).
  int? _selectedWarehouseId;

  /// Unique warehouses extracted from results.
  late final List<_WarehouseChip> _warehouses;

  @override
  void initState() {
    super.initState();
    _warehouses = _extractWarehouses(widget.results);

    // Pre-select the warehouse if we came from one.
    _selectedWarehouseId = widget.fromWarehouseId;
  }

  List<_WarehouseChip> _extractWarehouses(List<SearchProductModel> results) {
    final seen = <int>{};
    final list = <_WarehouseChip>[];
    for (final p in results) {
      if (p.warehouse != null && seen.add(p.warehouse!.id)) {
        list.add(
          _WarehouseChip(
            id: p.warehouse!.id,
            name: p.warehouse!.name,
            logo: p.warehouse!.logo,
          ),
        );
      }
    }
    return list;
  }

  List<SearchProductModel> get _filtered {
    if (_selectedWarehouseId == null) return widget.results;
    return widget.results
        .where((p) => p.warehouse?.id == _selectedWarehouseId)
        .toList();
  }

  void _onProductTap(SearchProductModel product) {
    // Coming from inside a warehouse → go straight to product details.
    if (widget.fromWarehouseId != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ProductDetailsScreen(
            product: ProductModel(
              id: product.id,
              name: product.name,
              image: product.image,
              price: product.price,
              warehouse: product.warehouse != null
                  ? ProductWarehouseModel(
                      id: product.warehouse!.id,
                      name: product.warehouse!.name,
                      logo: product.warehouse!.logo,
                    )
                  : null,
            ),
          ),
        ),
      );
      return;
    }

    // Coming from home / no warehouse context → go to warehouse details
    // pre-filtered to this product.
    final warehouseId = product.warehouse?.id;
    if (warehouseId == null) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => WarehouseDetailsScreen(
          warehouseId: warehouseId,
          preselectedMedicineId: product.id,
        ),
      ),
    );
  }

  void _onWarehouseChipTap(_WarehouseChip chip) {
    // If already selected → deselect (show all).
    setState(() {
      _selectedWarehouseId = _selectedWarehouseId == chip.id ? null : chip.id;
    });
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filtered;

    return BlocProvider(
      create: (context) => sl<FilterCubit>(),
      child: Scaffold(
        backgroundColor: white,
        body: BlocBuilder<FilterCubit, FilterState>(
          builder: (context, state) {
            return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── App bar ────────────────────────────────────────
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: const Color(0xff303030),
                            size: 18.sp,
                          ),
                        ),
                        // SizedBox(width: 5.w),
                        Text(
                          'نتائج البحث',
                          style: TextStyles.textStyleNormal16.copyWith(
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff303030),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ── Search query chip ─────────────────────────────
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 16.w),
                  //   child: Align(
                  //     alignment: AlignmentDirectional.centerStart,
                  //     child: Container(
                  //       padding: EdgeInsets.symmetric(
                  //         horizontal: 14.w,
                  //         vertical: 6.h,
                  //       ),
                  //       decoration: BoxDecoration(
                  //         color: const Color(0xffF0F8FB),
                  //         borderRadius: BorderRadius.circular(20.r),
                  //         border: Border.all(
                  //           color: const Color(0xff9FD4E4),
                  //           width: 0.8,
                  //         ),
                  //       ),
                  //       child: Text(
                  //         widget.query,
                  //         style: TextStyles.textStyleNormal13.copyWith(
                  //           color: const Color(0xff2A7A9B),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // verticalSpace(12),

                  // ── Warehouse chips (only when multiple warehouses) ─
                  if (_warehouses.length > 0) ...[
                    SizedBox(
                      height: 80.h,
                      child: ListView.separated(
                        addAutomaticKeepAlives: true,
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        reverse: false, // RTL order
                        itemCount: _warehouses.length,
                        separatorBuilder: (_, __) => SizedBox(width: 10.w),
                        itemBuilder: (_, i) {
                          final chip = _warehouses[i];
                          final selected = _selectedWarehouseId == chip.id;
                          return GestureDetector(
                            onTap: () => _onWarehouseChipTap(chip),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              width: 68.w,
                              alignment: .centerStart,
                              decoration: BoxDecoration(
                                color: selected
                                    ? const Color(0xffE8F5FB)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(14.r),
                                border: Border.all(
                                  color: selected
                                      ? const Color(0xff9FD4E4)
                                      : const Color(0xffE5E5E5),
                                  width: selected ? 1.2 : 0.8,
                                ),
                              ),
                              child: Column(
                                mainAxisSize:
                                    MainAxisSize.min, // ← don't stretch

                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.r),
                                    child: AppImage(
                                      image: chip.logo ?? '',
                                      width: 36.w,
                                      height: 36.h,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    chip.name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: TextStyles.textStyleNormal10
                                        .copyWith(
                                          color: selected
                                              ? const Color(0xff2A7A9B)
                                              : const Color(0xff555555),
                                          fontWeight: selected
                                              ? FontWeight.w600
                                              : FontWeight.w400,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    verticalSpace(8),
                  ],

                  // ── Filter row ────────────────────────────────────
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: ProductsFilterRow(
                      isGridView: _isGridView,
                      onViewChanged: (val) => setState(() => _isGridView = val),
                    ),
                  ),

                  verticalSpace(8),

                  // ── Products list / grid ──────────────────────────
                  Expanded(
                    child: filtered.isEmpty
                        ? Center(
                            child: Text(
                              'لا توجد نتائج',
                              style: TextStyles.textStyleNormal14.copyWith(
                                color: const Color(0xffAAAAAA),
                              ),
                            ),
                          )
                        : AnimatedSwitcher(
                            duration: const Duration(milliseconds: 250),
                            child: _isGridView
                                ? _buildGrid(filtered)
                                : _buildList(filtered),
                          ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildList(List<SearchProductModel> items) => ListView.builder(
    key: const ValueKey('list'),
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
    itemCount: items.length,
    itemBuilder: (_, i) {
      final p = items[i];
      return InkWell(
        onTap: () => _onProductTap(p),
        child: ProductItem(
          data: ProductModel(
            id: p.id,
            name: p.name,
            image: p.image,
            price: p.price,
            activeIngredients: p.activeIngredients
                ?.map(
                  (ing) => ActiveIngredientModel(id: ing.id, name: ing.name),
                )
                .toList(), // ← add this
            // activeIngredients: p.activeIngredients,
            warehouse: p.warehouse != null
                ? ProductWarehouseModel(
                    id: p.warehouse!.id,
                    name: p.warehouse!.name,
                    logo: p.warehouse!.logo,
                  )
                : null,
          ),
        ),
      );
    },
  );

  Widget _buildGrid(List<SearchProductModel> items) => GridView.builder(
    key: const ValueKey('grid'),
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
    itemCount: items.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
      crossAxisCount: 2,
      crossAxisSpacing: 8.w,
      mainAxisSpacing: 8.h,
      height: context.height / 2.2,
    ),
    itemBuilder: (_, i) {
      final p = items[i];
      return GestureDetector(
        onTap: () => _onProductTap(p),
        child: ProductGridItem(
          productModel: ProductModel(
            id: p.id,
            name: p.name,
            image: p.image,
            price: p.price,
            activeIngredients: p.activeIngredients
                ?.map(
                  (ing) => ActiveIngredientModel(id: ing.id, name: ing.name),
                )
                .toList(), // ← add this

            warehouse: p.warehouse != null
                ? ProductWarehouseModel(
                    id: p.warehouse!.id,
                    name: p.warehouse!.name,
                    logo: p.warehouse!.logo,
                  )
                : null,
          ),
        ),
      );
    },
  );
}

// ── Internal model for warehouse chip ─────────────────────────────────────────

class _WarehouseChip {
  final int id;
  final String name;
  final String? logo;

  const _WarehouseChip({required this.id, required this.name, this.logo});
}
