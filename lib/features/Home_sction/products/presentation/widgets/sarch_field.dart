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

// ── Data holder so the overlay can rebuild without remove+insert ──────────────
class _DropdownData {
  final List<SearchProductModel> results;
  final bool isLoading;
  final bool visible;
  const _DropdownData({
    required this.results,
    required this.isLoading,
    required this.visible,
  });
}

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

  // ValueNotifier drives the overlay's content so we never need remove+insert
  // (which would cause a brief focus-loss and collapse the dropdown).
  final ValueNotifier<_DropdownData> _dropdownNotifier = ValueNotifier(
    const _DropdownData(results: [], isLoading: false, visible: false),
  );

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
    _controller.addListener(() => setState(() {})); // rebuild for clear icon
  }

  void _onFocusChange() {
    if (!_focus.hasFocus) {
      // Delay so that tapping a dropdown result still fires onTap before
      // the overlay disappears.
      Future.delayed(const Duration(milliseconds: 150), () {
        if (mounted && !_focus.hasFocus) {
          _dropdownNotifier.value = const _DropdownData(
            results: [],
            isLoading: false,
            visible: false,
          );
        }
      });
    }
  }

  /// Show or update the dropdown — reuses the single OverlayEntry instead of
  /// remove+insert, so focus is never disturbed.
  void _showDropdown(List<SearchProductModel> results, bool isLoading) {
    _dropdownNotifier.value = _DropdownData(
      results: results,
      isLoading: isLoading,
      visible: true,
    );

    if (_overlayEntry == null) {
      _overlayEntry = _buildOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
    }
    // The ValueListenableBuilder inside the entry handles the rest.
  }

  void _removeOverlay() {
    _dropdownNotifier.value = const _DropdownData(
      results: [],
      isLoading: false,
      visible: false,
    );
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _buildOverlayEntry() {
    return OverlayEntry(
      builder: (_) => Positioned(
        width: context.width - 32.w,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, 48.h + 4.h),
          child: ValueListenableBuilder<_DropdownData>(
            valueListenable: _dropdownNotifier,
            builder: (_, data, __) {
              if (!data.visible) return const SizedBox.shrink();
              return _SearchDropdown(
                results: data.results,
                isLoading: data.isLoading,
                onSelect: _onResultTapped,
              );
            },
          ),
        ),
      ),
    );
  }

  void _onResultTapped(SearchProductModel product) {
    final cubit = context.read<MedicineSearchCubit>();

    // Read BEFORE clear — clear() wipes lastResults
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
    _dropdownNotifier.dispose();
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