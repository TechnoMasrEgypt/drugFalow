import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/utils/helpers.dart';
import 'package:drug_flow/features/Auths/register/data/governorate_model.dart';
import 'package:drug_flow/features/Auths/register/logic/governorate/governorate_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ── Governorate Dropdown ──────────────────────────────────────────────────────

class GovernorateDropDown extends StatelessWidget {
  const GovernorateDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GovernorateCubit, GovernorateState>(
      builder: (context, state) {
        final cubit = context.read<GovernorateCubit>();

        final governorates = state.maybeWhen(
          loaded: (govs, _, __) => govs,
          orElse: () => <GovernorateModel>[],
        );

        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        return _LocationDropDown<GovernorateModel>(
          title: 'المحافظة',
          hintText: 'اختر المحافظة',
          disabledHint: 'اختر المحافظة',
          items: governorates,
          value: cubit.selectedGovernorate,
          isLoading: isLoading,
          itemLabel: (g) => g.name.trim(),
          onChanged: (g) {
            if (g != null) cubit.onGovernorateSelected(g);
          },
        );
      },
    );
  }
}

// ── City Dropdown ─────────────────────────────────────────────────────────────

class CityDropDown extends StatelessWidget {
  const CityDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GovernorateCubit, GovernorateState>(
      builder: (context, state) {
        final cubit = context.read<GovernorateCubit>();

        final cities = state.maybeWhen(
          loaded: (_, cities, __) => cities,
          orElse: () => <CityModel>[],
        );

        final enabled = cities.isNotEmpty;

        return _LocationDropDown<CityModel>(
          title: 'المدينة',
          hintText: 'اختر المدينة',
          disabledHint: 'اختر المحافظة أولاً', // ← correct message
          items: cities,
          value: cubit.selectedCity,
          isLoading: false,
          enabled: enabled,
          itemLabel: (c) => c.name.trim(),
          onChanged: (c) {
            if (c != null) cubit.onCitySelected(c);
          },
        );
      },
    );
  }
}

// ── Area Dropdown ─────────────────────────────────────────────────────────────

class AreaDropDown extends StatelessWidget {
  const AreaDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GovernorateCubit, GovernorateState>(
      builder: (context, state) {
        final cubit = context.read<GovernorateCubit>();

        final areas = state.maybeWhen(
          loaded: (_, __, areas) => areas,
          orElse: () => <AreaModel>[],
        );

        final enabled = areas.isNotEmpty;

        return _LocationDropDown<AreaModel>(
          title: 'المنطقة',
          hintText: 'اختر المنطقة',
          disabledHint: 'اختر المدينة أولاً', // ← correct message
          items: areas,
          value: cubit.selectedArea,
          isLoading: false,
          enabled: enabled,
          itemLabel: (a) => a.name.trim(),
          onChanged: (a) {
            if (a != null) cubit.onAreaSelected(a);
          },
        );
      },
    );
  }
}

// ── Generic reusable dropdown ─────────────────────────────────────────────────

class _LocationDropDown<T> extends StatelessWidget {
  final String title;
  final String hintText;
  final String disabledHint; // ← new: shown when disabled
  final List<T> items;
  final T? value;
  final bool isLoading;
  final bool enabled;
  final String Function(T) itemLabel;
  final ValueChanged<T?> onChanged;

  const _LocationDropDown({
    required this.title,
    required this.hintText,
    required this.disabledHint,
    required this.items,
    required this.value,
    required this.isLoading,
    required this.itemLabel,
    required this.onChanged,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Label ──
        Text(
          title,
          style: TextStyles.textStyleNormal14.copyWith(
            fontWeight: FontWeight.w600,
            color: color121217,
          ),
          textScaler: TextScaler.linear(1),
        ),
        SizedBox(height: context.height / 90),

        // ── Dropdown ──
        Container(
          height: context.height / 16,
          decoration: BoxDecoration(
            color: enabled ? Colors.white : const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: colorD1d1dB),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: isLoading
              ? const Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                )
              : DropdownButtonHideUnderline(
                  child: DropdownButton<T>(
                    value: value,
                    isExpanded: true,
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Color(0xFF6C6C89),
                    ),
                    hint: Text(
                      // ← use correct hint based on enabled state
                      enabled ? hintText : disabledHint,
                      style: TextStyles.textStyleNormal14.copyWith(
                        color: color6C6C89,
                      ),
                      textScaler: TextScaler.linear(1),
                    ),
                    onChanged: enabled ? onChanged : null,
                    items: items.map((item) {
                      return DropdownMenuItem<T>(
                        value: item,
                        child: Text(
                          itemLabel(item),
                          style: TextStyles.textStyleNormal14.copyWith(
                            color: color121217,
                          ),
                          textScaler: TextScaler.linear(1),
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    }).toList(),
                  ),
                ),
        ),
      ],
    );
  }
}
