import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/utils/helpers.dart';
import 'package:flutter/material.dart';

class IntlPhoneFormField extends StatefulWidget {
  final TextEditingController controller;
  final TextEditingController countryCodeController;
  final String title;
  final String hintTxt;
  final String type;
  final bool obscure;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final bool enabled;

  const IntlPhoneFormField({
    super.key,
    required this.controller,
    required this.countryCodeController,
    required this.title,
    required this.hintTxt,
    required this.type,
    required this.obscure,
    required this.textInputType,
    this.validator,
    this.enabled = true,
  });

  @override
  State<IntlPhoneFormField> createState() => _IntlPhoneFormFieldState();
}

class _IntlPhoneFormFieldState extends State<IntlPhoneFormField> {
  // ── Country list ──────────────────────────────────────────────────────────
  static const List<_Country> _countries = [
    _Country(flag: '🇪🇬', name: 'Egypt',        code: '+20'),
    _Country(flag: '🇸🇦', name: 'Saudi Arabia', code: '+966'),
    _Country(flag: '🇦🇪', name: 'UAE',          code: '+971'),
    _Country(flag: '🇯🇴', name: 'Jordan',       code: '+962'),
    _Country(flag: '🇰🇼', name: 'Kuwait',       code: '+965'),
    _Country(flag: '🇶🇦', name: 'Qatar',        code: '+974'),
    _Country(flag: '🇧🇭', name: 'Bahrain',      code: '+973'),
    _Country(flag: '🇴🇲', name: 'Oman',         code: '+968'),
    _Country(flag: '🇱🇧', name: 'Lebanon',      code: '+961'),
    _Country(flag: '🇸🇩', name: 'Sudan',        code: '+249'),
    _Country(flag: '🇱🇾', name: 'Libya',        code: '+218'),
    _Country(flag: '🇹🇳', name: 'Tunisia',      code: '+216'),
    _Country(flag: '🇩🇿', name: 'Algeria',      code: '+213'),
    _Country(flag: '🇲🇦', name: 'Morocco',      code: '+212'),
    _Country(flag: '🇾🇪', name: 'Yemen',        code: '+967'),
    _Country(flag: '🇮🇶', name: 'Iraq',         code: '+964'),
    _Country(flag: '🇸🇾', name: 'Syria',        code: '+963'),
  ];

  late _Country _selected;

  @override
  void initState() {
    super.initState();
    _selected = _countries.first; // default Egypt
    widget.countryCodeController.text = _selected.code;
  }

  void _showCountryPicker() {
    if (!widget.enabled) return;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => _CountryPickerSheet(
        countries: _countries,
        selected: _selected,
        onSelect: (country) {
          setState(() => _selected = country);
          widget.countryCodeController.text = country.code;
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // ── Label ──
        Text(
          widget.title,
          style: TextStyles.textStyleNormal12.copyWith(color: color121217),
          textScaler: TextScaler.linear(1),
        ),
        SizedBox(height: context.height / 120),

        // ── Input container ──
        Container(
          height: context.height / 16,
          decoration: BoxDecoration(
            color: widget.enabled ? colorF8FAFC : const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: colorE8e8e8, width: 1),
          ),
          child: Row(
            children: [
              // ── Country code picker button ──
              GestureDetector(
                onTap: _showCountryPicker,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(color: colorE8e8e8),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _selected.flag,
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        _selected.code,
                        style: TextStyles.textStyleNormal14.copyWith(
                          color: color121217,
                        ),
                        textScaler: TextScaler.linear(1),
                      ),
                      const SizedBox(width: 2),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: color6C6C89,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),

              // ── Vertical divider ──
              Container(width: 1, color: colorE8e8e8),

              // ── Phone number input ──
              Expanded(
                child: TextFormField(
                  controller: widget.controller,
                  keyboardType: widget.textInputType,
                  obscureText: widget.obscure,
                  enabled: widget.enabled,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: widget.validator,
                  textAlign: TextAlign.left,
                  style: TextStyles.textStyleNormal14.copyWith(
                    color: color121217,
                  ),
                  decoration: InputDecoration(
                    hintText: widget.hintTxt,
                    hintStyle: TextStyles.textStyleNormal16.copyWith(
                      color: color818984,
                    ),
                    border: InputBorder.none,
                    errorBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    errorStyle: TextStyles.textStyleNormal10.copyWith(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ── Country picker bottom sheet ───────────────────────────────────────────────

class _CountryPickerSheet extends StatefulWidget {
  final List<_Country> countries;
  final _Country selected;
  final ValueChanged<_Country> onSelect;

  const _CountryPickerSheet({
    required this.countries,
    required this.selected,
    required this.onSelect,
  });

  @override
  State<_CountryPickerSheet> createState() => _CountryPickerSheetState();
}

class _CountryPickerSheetState extends State<_CountryPickerSheet> {
  final TextEditingController _search = TextEditingController();
  List<_Country> _filtered = [];

  @override
  void initState() {
    super.initState();
    _filtered = widget.countries;
    _search.addListener(() {
      final q = _search.text.toLowerCase();
      setState(() {
        _filtered = widget.countries
            .where(
              (c) =>
                  c.name.toLowerCase().contains(q) || c.code.contains(q),
            )
            .toList();
      });
    });
  }

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        16,
        12,
        16,
        MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── Handle ──
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: color121217.withOpacity(.15),
              borderRadius: BorderRadius.circular(4),
            ),
          ),

          // ── Search ──
          Container(
            height: 44,
            decoration: BoxDecoration(
              color: colorF8FAFC,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: colorE8e8e8),
            ),
            child: TextField(
              controller: _search,
              decoration: InputDecoration(
                hintText: 'ابحث عن دولة...',
                hintStyle: TextStyles.textStyleNormal14.copyWith(
                  color: color6C6C89,
                ),
                prefixIcon: Icon(Icons.search, color: color6C6C89, size: 20),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
          const SizedBox(height: 8),

          // ── Country list ──
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: context.height * 0.45),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _filtered.length,
              itemBuilder: (_, i) {
                final country = _filtered[i];
                final isSelected = country.code == widget.selected.code;

                return InkWell(
                  onTap: () => widget.onSelect(country),
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? primaryDark.withOpacity(.06)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Text(
                          country.flag,
                          style: const TextStyle(fontSize: 22),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            country.name,
                            style: TextStyles.textStyleNormal14.copyWith(
                              color: color121217,
                            ),
                            textScaler: TextScaler.linear(1),
                          ),
                        ),
                        Text(
                          country.code,
                          style: TextStyles.textStyleNormal14.copyWith(
                            color: color6C6C89,
                          ),
                          textScaler: TextScaler.linear(1),
                        ),
                        if (isSelected) ...[
                          const SizedBox(width: 8),
                          Icon(Icons.check, color: primaryDark, size: 18),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ── Data class ────────────────────────────────────────────────────────────────

class _Country {
  final String flag;
  final String name;
  final String code;

  const _Country({
    required this.flag,
    required this.name,
    required this.code,
  });
}
