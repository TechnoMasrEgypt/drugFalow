import 'package:drug_flow/core/localization/lang_keys.dart';
import 'package:drug_flow/core/widgets/svg_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/images.dart';
import '../constants/styles.dart';
import '../utils/helpers.dart';

class SearchFieldTxt extends StatefulWidget{
  final TextEditingController searchController;


  SearchFieldTxt({required this.searchController});

  @override
  State<SearchFieldTxt> createState() => _SearchFieldTxt();
}

class _SearchFieldTxt  extends State<SearchFieldTxt>{
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(12),
      child: MediaQuery(

        data: MediaQueryData(textScaler: TextScaler.linear(1)),
        child: TextField(
          controller: widget.searchController,
          onChanged: (val){},
          style: TextStyles.textStyleNormal15.copyWith(
            color: color121217,
          ),
          decoration: InputDecoration(
            hintText: context.translate(LangKeys.searchPlaceholder)
,
            hintStyle: TextStyles.textStyleNormal15.copyWith(
              color: color6C6C89,
            ),
            prefixIcon: Container(
              width: context.width/28,
              alignment: Alignment.center,
              child: customSvg(name: search,width: context.width/30,
                  height: context.height/30,fit: BoxFit.cover),
            ),

            // ❌ clear icon (only behavior added)
            suffixIcon: widget.searchController.text.isNotEmpty
                ? IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                widget.searchController.clear();
                // _onSearch("");
                FocusScope.of(context).unfocus();
              },
            )
                : null,

            border: OutlineInputBorder(
              borderSide: BorderSide(color: color121217.withOpacity(.05)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}