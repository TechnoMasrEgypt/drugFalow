// lib/features/Home_sction/products/presentation/screens/products_screen.dart

import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/spacing.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/utils/helpers.dart';
import 'package:drug_flow/features/Home_sction/filters/filter_cubit.dart';
import 'package:drug_flow/features/Home_sction/filters/filter_state.dart';
import 'package:drug_flow/features/Home_sction/home/data/warehouse_details_response.dart';
import 'package:drug_flow/features/Home_sction/home/ui/products_filter_row.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/cubit/product_details/medicine_search_cubit.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/cubit/products/products_cubit.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/cubit/products/products_state.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/widgets/product_grid_item.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/widgets/product_item.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/widgets/sarch_field.dart';
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
    return Scaffold(
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
                          child: const MedicineSearchField(warehouseId: 1,),
                        ),
                        verticalSpace(16),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              5,
                              (_) => WareHouseItemHorizontal(),
                            ),
                          ),
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
