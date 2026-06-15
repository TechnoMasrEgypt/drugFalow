import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/spacing.dart';
import 'package:drug_flow/core/widgets/svg_handler.dart';
import 'package:flutter/material.dart';

import '../constants/styles.dart';
import '../utils/helpers.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    super.key,
    required this.controller,
    required this.obscure,
    this.visible,
    this.type,
    this.onTap,
    required this.hintTxt,
    this.validator,
    required this.svgIcon,
    required this.textInputType,
    required this.title,
    this.maxLines = 1,
    this.enabled = true,
  });
  final TextEditingController controller;
  final bool? obscure;
  final bool? visible;
  final String? type;
  final Function()? onTap;
  final String svgIcon;
  final String hintTxt;
  int? maxLines;
  final String? Function(String?)? validator;
  final TextInputType textInputType;
  final String title;
  bool? enabled;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.title,
          style: TextStyles.textStyleNormal14.copyWith(
            fontWeight: FontWeight.w600,
            color: color121217,
          ),
          textScaler: TextScaler.linear(1),
        ),
        verticalSpace(8),
        MediaQuery(
          data: MediaQueryData(textScaler: TextScaler.linear(1)),
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: widget.controller,
            obscureText: widget.obscure!,
            enabled: widget.enabled,
            validator: widget.validator,
            keyboardType: widget.textInputType,

            maxLines: widget.maxLines,
            style: TextStyles.textStyleNormal14.copyWith(color: color121217),
            decoration: InputDecoration(
              fillColor: const Color.fromARGB(255, 255, 255, 255),
              contentPadding: EdgeInsets.symmetric(vertical: 0),
              hint: Container(
                padding: EdgeInsets.only(top: 0),
                child: Text(
                  widget.hintTxt,
                  style: TextStyles.textStyleNormal14.copyWith(
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  textScaler: TextScaler.linear(1),
                  softWrap: true,
                  // selectionColor: Colors.white,
                ),
              ),

              prefixIcon: Container(
                width: widget.type == 'address' ? 0 : context.width / 34,
                alignment: Alignment.center,
                child: customSvg(
                  name: widget.svgIcon??'',
                  fit: BoxFit.cover,
                  width: context.width / 40,
                  height: context.height / 40,
                  color: color818984,
                ),
              ),

              suffixIcon: widget.type == "pass"
                  ? InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      onTap: widget.onTap!,
                      child: Container(
                        alignment: Alignment.center,
                        width: context.width / 20,
                        child: widget.visible == true
                            ? Icon(
                                Icons.visibility_off_outlined,
                                color: color818984,
                              )
                            : Icon(
                                Icons.visibility_outlined,
                                color: color818984,
                              ),
                      ),
                    )
                  : SizedBox(width: context.width / 30),
              filled: true,
              errorStyle: TextStyles.textStyleNormal10.copyWith(
                color: Colors.red,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(
                  color: const Color.fromARGB(255, 240, 240, 243),
                  width: 1,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Colors.red),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: colorD1d1dB, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: colorD1d1dB, width: 1),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: colorD1d1dB, width: 1),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: colorD1d1dB, width: 1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
