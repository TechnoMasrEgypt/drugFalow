// lib/features/Home_sction/products/presentation/screens/products_screen.dart

import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/spacing.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/utils/helpers.dart';
import 'package:drug_flow/features/Home_sction/filters/filter_cubit.dart';
import 'package:drug_flow/features/Home_sction/filters/filter_params.dart';
import 'package:drug_flow/features/Home_sction/filters/filter_state.dart';
import 'package:drug_flow/features/Home_sction/home/data/warehouse_details_response.dart';
import 'package:drug_flow/features/Home_sction/home/data/warehouse_response.dart';
import 'package:drug_flow/features/Home_sction/home/logic/home_cubit.dart';
import 'package:drug_flow/features/Home_sction/home/logic/home_state.dart';
import 'package:drug_flow/features/Home_sction/home/ui/products_filter_row.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/cubit/product_details/medicine_search_cubit.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/cubit/product_details/medicine_search_state.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/cubit/products/products_cubit.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/cubit/products/products_state.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/widgets/product_grid_item.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/widgets/product_item.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/widgets/search_field.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/widgets/ware_house_item_horizontal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/search_field_txt.dart';
import '../../../../../core/widgets/silver_grid_delegate_with_fixed_axis_count/silver_grid_delegate_with_fixed_axis_count.dart';
// lib/features/Home_sction/products/presentation/screens/products_screen.dart

import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/spacing.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/utils/helpers.dart';
import 'package:drug_flow/features/Home_sction/home/data/warehouse_details_response.dart';
import 'package:drug_flow/features/Home_sction/home/ui/products_filter_row.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/cubit/products/products_cubit.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/cubit/products/products_state.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/widgets/product_grid_item.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/widgets/product_item.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/widgets/ware_house_item_horizontal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/search_field_txt.dart';
import '../../../../../core/widgets/silver_grid_delegate_with_fixed_axis_count/silver_grid_delegate_with_fixed_axis_count.dart';

class ProductsScreen extends StatefulWidget {
  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _isGridView = true;

  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: BlocListener<FilterCubit, FilterState>(
          listenWhen: (_, s) => s is FiltersApplied,
          listener: (context, state) {
            state.maybeWhen(
              filtersApplied: (params) =>
                  context.read<ProductsCubit>().getProducts(params: params),
              orElse: () {},
            );
          },
          child: BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
              return state.maybeWhen(
                loading: () =>
                    const Center(child: CircularProgressIndicator.adaptive()),
                error: (error) => Center(child: Text(error)),
                success: (products) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(4),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "المنتجات",
                            style: TextStyles.textStyleBold20.copyWith(
                              color: color121217,
                            ),
                            textScaler: TextScaler.linear(1),
                          ),
                          verticalSpace(16),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: const MedicineSearchField(warehouseId: 1),
                          ),
                          verticalSpace(16),
                          BlocBuilder<WarehouseCubit, WarehouseState>(
                            builder: (context, state) {
                              return state.maybeWhen(
                                loading: () => const Center(
                                  child: CircularProgressIndicator.adaptive(),
                                ),
                                error: (error) =>
                                    Center(child: Text(error.toString())),
                                success: (warehouses) {
                                  final list = warehouses ?? [];
                                  final visible = list.take(5).toList();
                                  final overflow = list.skip(5).toList();

                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        ...visible.map(
                                          (wh) => GestureDetector(
                                            onTap: () => context
                                                .read<ProductsCubit>()
                                                .getProducts(
                                                  params: FilterParams(
                                                    medicineIds: [],
                                                    ingredientIds: [],
                                                    warehouseId: wh?.id,
                                                  ),
                                                ),
                                            child: WareHouseItemHorizontal(
                                              warehouse: WarehouseItem(
                                                name: wh?.name ?? '',
                                                logo: wh?.logo ?? '',
                                              ),
                                            ),
                                          ),
                                        ),
                                        if (overflow.isNotEmpty)
                                          GestureDetector(
                                            onTap: () => _showMoreWarehouses(
                                              context,
                                              overflow,
                                            ),
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                horizontal: 8.w,
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 12.w,
                                                vertical: 8.h,
                                              ),
                                              decoration: BoxDecoration(
                                                color: colorF7F7F8,
                                                borderRadius:
                                                    BorderRadius.circular(12.r),
                                                border: Border.all(
                                                  color: const Color(
                                                    0xffE5E5E5,
                                                  ),
                                                  width: 0.8,
                                                ),
                                              ),
                                              child: Text(
                                                'المزيد',
                                                style: TextStyles
                                                    .textStyleNormal12
                                                    .copyWith(
                                                      color: color121217,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                textScaler:
                                                    const TextScaler.linear(1),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  );
                                },
                                orElse: () => const SizedBox.shrink(),
                              );
                            },
                          ),
                          verticalSpace(16),
                          ProductsFilterRow(
                            isGridView: _isGridView,
                            onViewChanged: (val) =>
                                setState(() => _isGridView = val),
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(16),
                    Expanded(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder: (child, anim) => FadeTransition(
                          opacity: anim,
                          child: ScaleTransition(
                            scale: Tween<double>(
                              begin: 0.96,
                              end: 1.0,
                            ).animate(anim),
                            child: child,
                          ),
                        ),
                        child: _isGridView
                            ? _buildGridView(context, products)
                            : _buildListView(context, products),
                      ),
                    ),
                  ],
                ),
                orElse: () => const SizedBox.shrink(),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildGridView(BuildContext context, List<ProductModel> data) =>
      GridView.builder(
        key: const ValueKey('grid'),
        padding: EdgeInsets.symmetric(horizontal: context.width / 20),
        itemCount: data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
          height: context.height / 2,
          crossAxisSpacing: 8.w,
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
        padding: EdgeInsets.symmetric(horizontal: context.width / 20),
        itemCount: data.length,
        itemBuilder: (_, i) => ProductItem(data: data[i]),
      );
}

void _showMoreWarehouses(BuildContext context, List warehouses) {
  showModalBottomSheet(
    context: context,
    backgroundColor: white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (_) => Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: const Color(0xffE5E5E5),
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),
          verticalSpace(16),
          Text(
            'المستودعات',
            style: TextStyles.textStyleNormal16.copyWith(
              fontWeight: FontWeight.w600,
              color: color121217,
            ),
            textScaler: const TextScaler.linear(1),
          ),
          verticalSpace(12),
          Flexible(
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: warehouses.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8.w,
                    mainAxisSpacing: 8.h,
                    height: 100.h,
                  ),
              itemBuilder: (_, i) {
                final wh = warehouses[i];
                return GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    context.read<ProductsCubit>().getProducts(
                      params: FilterParams(
                        medicineIds: [],
                        ingredientIds: [],
                        warehouseId: wh?.id,
                      ),
                    );
                  },
                  child: WareHouseItemHorizontal(
                    warehouse: WarehouseItem(
                      name: wh?.name ?? '',
                      logo: wh?.logo ?? '',
                    ),
                  ),
                );
              },
            ),
          ),
          verticalSpace(16),
        ],
      ),
    ),
  );
}
