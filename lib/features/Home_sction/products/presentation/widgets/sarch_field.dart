// lib/features/Home_sction/products/presentation/widgets/medicine_search_field.dart

import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/utils/helpers.dart';
import 'package:drug_flow/features/Home_sction/home/data/search_response.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/cubit/product_details/medicine_search_cubit.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/cubit/product_details/medicine_search_state.dart';
import 'package:drug_flow/features/Home_sction/products/presentation/widgets/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MedicineSearchField extends StatefulWidget {
  final int? warehouseId;
  const MedicineSearchField({super.key, this.warehouseId});

  @override
  State<MedicineSearchField> createState() => _MedicineSearchFieldState();
}

class _MedicineSearchFieldState extends State<MedicineSearchField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focus = FocusNode();
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
    _controller.addListener(() => setState(() {})); // rebuild for clear icon
  }

  void _onFocusChange() {
    if (!_focus.hasFocus) _removeOverlay();
  }

  void _showDropdown(List<SearchProductModel> results, bool isLoading) {
    _removeOverlay();
    _overlayEntry = _buildOverlayEntry(results, isLoading);
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _buildOverlayEntry(
    List<SearchProductModel> results,
    bool isLoading,
  ) {
    return OverlayEntry(
      builder: (_) => Positioned(
        width: context.width - 32.w,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, 48.h + 4.h),
          child: _SearchDropdown(
            results: results,
            isLoading: isLoading,
            onSelect: _onResultTapped,
          ),
        ),
      ),
    );
  }

  void _onResultTapped(SearchProductModel product) {
    final cubit = context.read<MedicineSearchCubit>();

    // ✅ Read BEFORE clear — clear() wipes lastResults
    final allResults = cubit.lastResults;
    final query = _controller.text;

    _controller.clear();
    _removeOverlay();
    _focus.unfocus();
    cubit.clear();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SearchResultsScreen(
          query: query.isNotEmpty ? query : product.name,
          results: allResults,
          fromWarehouseId: widget.warehouseId,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MedicineSearchCubit, MedicineSearchState>(
      listener: (context, state) {
        state.when(
          idle: () => _removeOverlay(),
          empty: () => _removeOverlay(),
          loading: () => _showDropdown([], true),
          success: (results) => _showDropdown(results, false),
          error: (_) => _removeOverlay(),
        );
      },
      child: CompositedTransformTarget(
        link: _layerLink,
        child: Container(
          height: 48.h,
          decoration: BoxDecoration(
            color: colorF7F7F8,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: TextField(
            controller: _controller,
            focusNode: _focus,
            textAlign: TextAlign.right,
            textAlignVertical: TextAlignVertical.center,
            onChanged: (q) =>
                context.read<MedicineSearchCubit>().onQueryChanged(q),
            decoration: InputDecoration(
              hintText: "ابحث عن دواء...",
              hintStyle: TextStyles.textStyleNormal14.copyWith(
                color: color121217.withOpacity(.4),
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 14.h,
              ),
              prefixIcon: _controller.text.isNotEmpty
                  ? IconButton(
                      icon: Icon(
                        Icons.close,
                        size: 18.w,
                        color: color121217.withOpacity(.5),
                      ),
                      onPressed: () {
                        _controller.clear();
                        context.read<MedicineSearchCubit>().clear();
                        _removeOverlay();
                      },
                    )
                  : null,
              suffixIcon: Icon(
                Icons.search,
                color: color121217.withOpacity(.4),
                size: 20.w,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _removeOverlay();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
    _controller.dispose();
    super.dispose();
  }
}

// ── Dropdown (pure UI) ─────────────────────────────────────────────────────────

class _SearchDropdown extends StatelessWidget {
  final List<SearchProductModel> results;
  final bool isLoading;
  final ValueChanged<SearchProductModel> onSelect;

  const _SearchDropdown({
    required this.results,
    required this.isLoading,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(12.r),
      color: white,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 240.h),
          child: isLoading
              ? Padding(
                  padding: EdgeInsets.all(16.h),
                  child: const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                )
              : results.isEmpty
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 16.h,
                        horizontal: 16.w,
                      ),
                      child: Text(
                        "لا توجد نتائج",
                        textAlign: TextAlign.center,
                        style: TextStyles.textStyleNormal14.copyWith(
                          color: color121217.withOpacity(.5),
                        ),
                        textScaler: TextScaler.linear(1),
                      ),
                    )
                  : ListView.separated(
                      padding: EdgeInsets.symmetric(vertical: 4.h),
                      shrinkWrap: true,
                      itemCount: results.length,
                      separatorBuilder: (_, __) => Divider(
                        height: 1,
                        color: color121217.withOpacity(.06),
                        indent: 16.w,
                        endIndent: 16.w,
                      ),
                      itemBuilder: (_, i) {
                        final item = results[i];
                        return InkWell(
                          onTap: () => onSelect(item),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 12.h,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.arrow_back_ios,
                                  size: 12.w,
                                  color: color121217.withOpacity(.3),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        item.name,
                                        textAlign: TextAlign.right,
                                        style: TextStyles.textStyleNormal14
                                            .copyWith(color: color121217),
                                        textScaler: TextScaler.linear(1),
                                      ),
                                      if (item.warehouse != null)
                                        Text(
                                          item.warehouse!.name,
                                          textAlign: TextAlign.right,
                                          style: TextStyles.textStyleNormal14
                                              .copyWith(
                                            color:
                                                color121217.withOpacity(.45),
                                            fontSize: 11,
                                          ),
                                          textScaler: TextScaler.linear(1),
                                        ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.medication_outlined,
                                  size: 16.w,
                                  color: primaryDark.withOpacity(.6),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
        ),
      ),
    );
  }
}