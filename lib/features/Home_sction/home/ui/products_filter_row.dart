// ─────────────────────────────────────────────
// lib/features/Home_sction/home/ui/products_filter_row.dart
// ─────────────────────────────────────────────

import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/images.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/utils/helpers.dart';
import 'package:drug_flow/core/widgets/svg_handler.dart';
import 'package:drug_flow/features/Home_sction/filters/data.dart';
import 'package:drug_flow/features/Home_sction/filters/filter_cubit.dart';
import 'package:drug_flow/features/Home_sction/filters/filter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ─────────────────────────────────────────────
// Reusable Filter Row
// ─────────────────────────────────────────────

class ProductsFilterRow extends StatelessWidget {
  final bool isGridView;
  final ValueChanged<bool> onViewChanged;

  const ProductsFilterRow({
    super.key,
    required this.isGridView,
    required this.onViewChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        final cubit = context.read<FilterCubit>();
        final hasMedSel =
            cubit.medicines.any((m) => m.isSelected);
        final hasIngSel =
            cubit.ingredients.any((i) => i.isSelected);

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _ViewToggle(isGridView: isGridView, onViewChanged: onViewChanged),
              SizedBox(width: context.width / 40),
              _SortButton(
                context: context,
                sortOption: cubit.currentSort,
              ),
              SizedBox(width: context.width / 40),
              _FilterChip(
                context: context,
                title: "الدواء",
                width: 59.w,
                isActive: hasMedSel,
                onTap: () {
                  cubit.loadMedicines();
                  _showCheckboxFilterBottomSheet(
                    context,
                    title: "الدواء",
                    hint: "ابحث عن اسم الدواء",
                    type: _FilterType.medicine,
                  );
                },
              ),
              SizedBox(width: context.width / 40),
              _FilterChip(
                context: context,
                title: "المادة الفعالة",
                width: 105.w,
                isActive: hasIngSel,
                onTap: () {
                  cubit.loadIngredients();
                  _showCheckboxFilterBottomSheet(
                    context,
                    title: "المادة الفعالة",
                    hint: "ابحث عن المادة الفعالة",
                    type: _FilterType.activeSubstance,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

// ─────────────────────────────────────────────
// View Toggle (List ↔ Grid)
// ─────────────────────────────────────────────

class _ViewToggle extends StatelessWidget {
  final bool isGridView;
  final ValueChanged<bool> onViewChanged;

  const _ViewToggle({required this.isGridView, required this.onViewChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color121217.withOpacity(.1)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () => onViewChanged(false),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: context.width / 7,
                  decoration: BoxDecoration(
                    color: !isGridView ? colorF7F7F8 : white,
                  ),
                  alignment: Alignment.center,
                  child: customSvg(
                    name: menu,
                    width: 20.w,
                    height: 20.h,
                    fit: BoxFit.cover,
                    color: primaryDark,
                  ),
                ),
              ),
              VerticalDivider(
                color: color121217.withOpacity(.2),
                width: 0,
                thickness: 2,
              ),
              InkWell(
                onTap: () => onViewChanged(true),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: context.width / 7,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isGridView ? colorF7F7F8 : white,
                  ),
                  child: customSvg(
                    name: grid,
                    width: 20.w,
                    height: 20.h,
                    fit: BoxFit.cover,
                    color: primaryDark,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Sort Button
// ─────────────────────────────────────────────

class _SortButton extends StatelessWidget {
  final BuildContext context;
  final SortOption sortOption;
  const _SortButton({required this.context, required this.sortOption});

  @override
  Widget build(BuildContext ctx) {
    return GestureDetector(
      onTap: () => _showSortBottomSheet(context),
      child: Container(
        width: 102.w,
        height: 28.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color121217.withOpacity(.05)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customSvg(
              name: arrows,
              width: context.width / 50,
              height: 14.h,
              fit: BoxFit.cover,
            ),
            SizedBox(width: context.width / 50),
            Text(
              "ترتيب حسب",
              style: TextStyles.textStyleNormal14.copyWith(color: color121217),
              textScaler: TextScaler.linear(1),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Filter Chip
// ─────────────────────────────────────────────

enum _FilterType { medicine, activeSubstance }

class _FilterChip extends StatelessWidget {
  final BuildContext context;
  final String title;
  final double width;
  final bool isActive;
  final VoidCallback onTap;

  const _FilterChip({
    required this.context,
    required this.title,
    required this.width,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext ctx) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: width,
        height: 28.h,
        decoration: BoxDecoration(
          color: isActive ? primaryDark.withOpacity(.08) : Colors.transparent,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: isActive ? primaryDark : color121217.withOpacity(.1),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyles.textStyleNormal14.copyWith(
            color: isActive ? primaryDark : color121217,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
          ),
          textScaler: TextScaler.linear(1),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Bottom Sheet: Checkbox Filter (Medicine / Ingredient)
// ─────────────────────────────────────────────

void _showCheckboxFilterBottomSheet(
  BuildContext context, {
  required String title,
  required String hint,
  required _FilterType type,
}) {
  // Pass the cubit down into the sheet via BlocProvider.value
  final cubit = context.read<FilterCubit>();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) => BlocProvider.value(
      value: cubit,
      child: _CheckboxFilterSheet(
        title: title,
        hint: hint,
        type: type,
      ),
    ),
  );
}

class _CheckboxFilterSheet extends StatefulWidget {
  final String title;
  final String hint;
  final _FilterType type;

  const _CheckboxFilterSheet({
    required this.title,
    required this.hint,
    required this.type,
  });

  @override
  State<_CheckboxFilterSheet> createState() => _CheckboxFilterSheetState();
}

class _CheckboxFilterSheetState extends State<_CheckboxFilterSheet> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() => _query = _searchController.text.toLowerCase());
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<FilterItemModel> _filteredItems(List<FilterItemModel> all) {
    if (_query.isEmpty) return all;
    return all.where((i) => i.name.toLowerCase().contains(_query)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        final cubit = context.read<FilterCubit>();
        final allItems = widget.type == _FilterType.medicine
            ? cubit.medicines
            : cubit.ingredients;
        final items = _filteredItems(allItems);
        final isLoading = state is Loading;

        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.75,
          minChildSize: 0.4,
          maxChildSize: 0.9,
          builder: (_, scrollController) {
            return Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Column(
                children: [
                  // Handle
                  Container(
                    width: 40.w,
                    height: 4.h,
                    margin: EdgeInsets.only(bottom: 12.h),
                    decoration: BoxDecoration(
                      color: color121217.withOpacity(.15),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  // Title row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.arrow_forward_ios,
                            size: 16.w, color: color121217),
                      ),
                      Text(
                        widget.title,
                        style: TextStyles.textStyleBold20
                            .copyWith(color: color121217),
                        textScaler: TextScaler.linear(1),
                      ),
                      const SizedBox.shrink(),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  // Search field
                  Container(
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: colorF7F7F8,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: _searchController,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        hintText: widget.hint,
                        hintStyle: TextStyles.textStyleNormal14
                            .copyWith(color: color121217.withOpacity(.4)),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 10.h,
                        ),
                        suffixIcon: Icon(Icons.search,
                            color: color121217.withOpacity(.4), size: 18.w),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  // List / loader
                  Expanded(
                    child: isLoading
                        ? const Center(
                            child: CircularProgressIndicator.adaptive())
                        : items.isEmpty
                            ? Center(
                                child: Text(
                                  "لا توجد نتائج",
                                  style: TextStyles.textStyleNormal14
                                      .copyWith(color: color121217),
                                ),
                              )
                            : ListView.builder(
                                controller: scrollController,
                                itemCount: items.length,
                                itemBuilder: (_, i) {
                                  final item = items[i];
                                  return InkWell(
                                    onTap: () {
                                      if (widget.type ==
                                          _FilterType.medicine) {
                                        cubit.toggleMedicine(item.id);
                                      } else {
                                        cubit.toggleIngredient(item.id);
                                      }
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 10.h,
                                        horizontal: 4.w,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: color121217.withOpacity(.06),
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // Checkbox
                                          AnimatedContainer(
                                            duration: const Duration(
                                                milliseconds: 180),
                                            width: 20.w,
                                            height: 20.h,
                                            decoration: BoxDecoration(
                                              color: item.isSelected
                                                  ? primaryDark
                                                  : white,
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              border: Border.all(
                                                color: item.isSelected
                                                    ? primaryDark
                                                    : color121217
                                                        .withOpacity(.2),
                                              ),
                                            ),
                                            child: item.isSelected
                                                ? Icon(Icons.check,
                                                    size: 14.w, color: white)
                                                : null,
                                          ),
                                          // Label
                                          Text(
                                            item.name,
                                            style: TextStyles.textStyleNormal14
                                                .copyWith(color: color121217),
                                            textScaler: TextScaler.linear(1),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                  ),
                  SizedBox(height: 12.h),
                  // Apply button
                  SizedBox(
                    width: double.infinity,
                    height: 44.h,
                    child: ElevatedButton(
                      onPressed: () {
                        cubit.applyFilters();
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryDark,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        "تطبيق",
                        style: TextStyles.textStyleBold20
                            .copyWith(color: white),
                        textScaler: TextScaler.linear(1),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

// ─────────────────────────────────────────────
// Bottom Sheet: Sort By
// ─────────────────────────────────────────────

void _showSortBottomSheet(BuildContext context) {
  final cubit = context.read<FilterCubit>();
  showModalBottomSheet(
    context: context,
    backgroundColor: white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) => BlocProvider.value(
      value: cubit,
      child: const _SortBottomSheet(),
    ),
  );
}

class _SortBottomSheet extends StatefulWidget {
  const _SortBottomSheet();

  @override
  State<_SortBottomSheet> createState() => _SortBottomSheetState();
}

class _SortBottomSheetState extends State<_SortBottomSheet> {
  late SortOption _selected;

  @override
  void initState() {
    super.initState();
    _selected = context.read<FilterCubit>().currentSort;
  }

  @override
  Widget build(BuildContext context) {
    final options = SortOption.values;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle
          Container(
            width: 40.w,
            height: 4.h,
            margin: EdgeInsets.only(bottom: 16.h),
            decoration: BoxDecoration(
              color: color121217.withOpacity(.15),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          // Title
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "ترتيب حسب",
              style: TextStyles.textStyleBold20.copyWith(color: color121217),
              textScaler: TextScaler.linear(1),
            ),
          ),
          SizedBox(height: 12.h),
          // Radio options
          ...options.map((option) {
            final isSelected = _selected == option;
            return InkWell(
              onTap: () => setState(() => _selected = option),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      width: 20.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected
                              ? primaryDark
                              : color121217.withOpacity(.3),
                          width: isSelected ? 5 : 1.5,
                        ),
                      ),
                    ),
                    Text(
                      option.label,
                      style: TextStyles.textStyleNormal14.copyWith(
                        color: color121217,
                      ),
                      textScaler: TextScaler.linear(1),
                    ),
                  ],
                ),
              ),
            );
          }),
          SizedBox(height: 12.h),
          // Apply
          SizedBox(
            width: double.infinity,
            height: 44.h,
            child: ElevatedButton(
              onPressed: () {
                context.read<FilterCubit>().setSort(_selected);
                context.read<FilterCubit>().applyFilters();
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryDark,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: Text(
                "تطبيق",
                style: TextStyles.textStyleBold20.copyWith(color: white),
                textScaler: TextScaler.linear(1),
              ),
            ),
          ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}