// lib/features/Home_sction/home/ui/warehouse_details_screen.dart

import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/spacing.dart';
import 'package:drug_flow/core/utils/helpers.dart';
import 'package:drug_flow/features/Home_sction/filters/filter_cubit.dart';
import 'package:drug_flow/features/Home_sction/filters/filter_params.dart';
import 'package:drug_flow/features/Home_sction/filters/filter_state.dart';
import 'package:drug_flow/features/Home_sction/home/data/warehouse_details_response.dart';
import 'package:drug_flow/features/Home_sction/home/logic/home_cubit.dart';
import 'package:drug_flow/features/Home_sction/home/logic/home_state.dart';
import 'package:drug_flow/features/Home_sction/home/ui/WarehouseHeader.dart';
import 'package:drug_flow/features/Home_sction/home/ui/products_filter_row.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/widgets/product_grid_item.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/silver_grid_delegate_with_fixed_axis_count/silver_grid_delegate_with_fixed_axis_count.dart';

class WarehouseDetailsScreen extends StatefulWidget {
  final int warehouseId;

  /// When navigating from a medicine search result, pass the medicine id here.
  /// It will be merged into every filter call automatically.
  final int? preselectedMedicineId;

  const WarehouseDetailsScreen({
    super.key,
    required this.warehouseId,
    this.preselectedMedicineId,
  });

  @override
  State<WarehouseDetailsScreen> createState() => _WarehouseDetailsScreenState();
}

class _WarehouseDetailsScreenState extends State<WarehouseDetailsScreen> {
  bool _isGridView = false;

  @override
  void initState() {
    super.initState();
    // Initial load — inject preselected medicine if coming from search
    _load();
  }

  void _load([FilterParams? incoming]) {
    // Merge the preselected medicine id into whatever the user chose
    final base = incoming ?? const FilterParams.empty();
    final mergedMedicineIds = [
      ...base.medicineIds,
      if (widget.preselectedMedicineId != null &&
          !base.medicineIds.contains(widget.preselectedMedicineId))
        widget.preselectedMedicineId!,
    ];

    context.read<WarehouseCubit>().getWarehouseDetails(
          id: widget.warehouseId,
          params: FilterParams(
            medicineIds: mergedMedicineIds,
            ingredientIds: base.ingredientIds,
            sort: base.sort,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(backgroundColor: white, elevation: 0),
      body: BlocListener<FilterCubit, FilterState>(
        listenWhen: (_, s) => s is FiltersApplied,
        listener: (context, state) {
          state.maybeWhen(
            filtersApplied: (params) => _load(params),
            orElse: () {},
          );
        },
        child: BlocBuilder<WarehouseCubit, WarehouseState>(
          builder: (context, state) {
            return state.maybeWhen(
              detailsStateloading: () =>
                  const Center(child: CircularProgressIndicator.adaptive()),
              detailsStateerror: (error) =>
                  Center(child: Text(error.apiErrorModel.message ?? '')),
              detailsStatesuccess: (data) => Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.width / 25),
                    child: Column(
                      children: [
                    if (data?.data != null)              // ← data.data is WarehouseDetailsData
            WarehouseHeader(data: data!.data!),
                        verticalSpace(8),
                        ProductsFilterRow(
                          isGridView: _isGridView,
                          onViewChanged: (val) =>
                              setState(() => _isGridView = val),
                        ),
                        SizedBox(height: context.height / 40),
                      ],
                    ),
                  ),
                  Expanded(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder: (child, anim) => FadeTransition(
                        opacity: anim,
                        child: ScaleTransition(
                          scale: Tween<double>(begin: 0.96, end: 1.0)
                              .animate(anim),
                          child: child,
                        ),
                      ),
                      child: _isGridView
                          ? _buildGridView(context,  data?.items ?? [])
                          : _buildListView(context, data?.items ?? []),
                    ),
                  ),
                ],
              ),
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }

  Widget _buildGridView(BuildContext context, List<ProductModel> data) =>
      GridView.builder(
        key: const ValueKey('grid'),
        padding: EdgeInsets.symmetric(horizontal: context.width / 25),
        itemCount: data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
          height: context.height / 2,
          crossAxisSpacing: 5.w,
          mainAxisSpacing: 5.h,
          crossAxisCount: 2,
        ),
        itemBuilder: (_, i) => Padding(
          padding: EdgeInsets.only(right: 5.w),
          child: ProductGridItem(productModel: data[i]),
        ),
      );

  Widget _buildListView(BuildContext context, List<ProductModel> data) =>
      ListView.builder(
        key: const ValueKey('list'),
        padding: EdgeInsets.symmetric(horizontal: context.width / 25),
        itemCount: data.length,
        itemBuilder: (_, i) => InkWell(child: ProductItem(data: data[i])),
      );
}