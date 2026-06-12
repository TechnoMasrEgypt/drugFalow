import 'package:drug_flow/core/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/images.dart';
import '../../../../../core/constants/styles.dart';
import '../../../../../core/utils/helpers.dart';
import '../../../../../core/widgets/svg_handler.dart';

class LocationDropDownFormField extends StatefulWidget{
  final String hintText ;
  final String title;
  final String type;

  final int dropDownId;


  LocationDropDownFormField({super.key, required this.hintText,
    required this.title, required this.dropDownId, required this.type});

  @override
  State<LocationDropDownFormField> createState() => LocationDropDownFormFieldState();
}

class LocationDropDownFormFieldState extends State<LocationDropDownFormField> {
  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,

      children: [
        Text(widget.title,style: TextStyles.textStyleNormal14.copyWith(
            color: color121217,
        ),textScaler: TextScaler.linear(1),),
        SizedBox(height: context.height/80,),
        DropdownButtonFormField(
            initialValue: 1/*widget.type == "sub" ?
            widget.subCategoriesList!.first.id:
            widget.type == "order_by" ?
            widget.ordersList!.first.id :
            widget.dropDownId*/,
            style: TextStyles.textStyleNormal15.copyWith(
                color: color6C6C89,
            ),
            dropdownColor: white,
            alignment: Alignment.center,

            icon: Container(
              alignment: Alignment.center,
              width: context.width/10,
              child: customSvg(name: dropdown
                  ,    color: colorD1d1dB,width: context.width/90
                  ,height: context.height/80,fit: BoxFit.cover),
            ),
            borderRadius: BorderRadius.circular(8),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              fillColor: colorF8FAFC,
              hint: Container(
                padding: EdgeInsets.only(bottom:14),
                child: Text(widget.hintText,style: TextStyles.textStyleNormal16
                    .copyWith(    color: color6C6C89,),textScaler: TextScaler.linear(1)
                  ,softWrap: true,),
              ),

              filled: true,
              errorStyle: TextStyles.textStyleNormal10.copyWith(color: Colors.red,
                 ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: colorE8e8e8,width: 1)
              ),
              errorBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Colors.red)
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: colorE8e8e8,width: 1)
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: colorE8e8e8,width: 1)
              ),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: colorE8e8e8,width: 1)
              ),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: colorE8e8e8,width: 1)
              ),
            ),
            items: []/*widget.type == "sub" ?
            widget.subCategoriesList!.map((e)=>
                DropdownMenuItem(
                    value: e.id,
                    child: Text(e.name!,style: TextStyles.textStyleNormal13.copyWith(
                        color: color1F3D2B,
                        fontFamily: fontType
                    ),textScaler: TextScaler.linear(1),))).toList() :
            widget.type == "order_by" ?
            widget.ordersList!.map((e)=>
                DropdownMenuItem(
                    value: e.id,
                    child: Text(e.sortPrice!,style: TextStyles.textStyleNormal13.copyWith(
                        color: color1F3D2B,
                        fontFamily: fontType
                    ),textScaler: TextScaler.linear(1),))).toList() :
            widget.emiratesList!.map((e)=>
                DropdownMenuItem(
                    value: e.id,
                    child: Text(e.name!,style: TextStyles.textStyleNormal13.copyWith(
                        color: color1F3D2B,
                        fontFamily: fontType
                    ),textScaler: TextScaler.linear(1),))).toList()*/
            , onChanged: (val){
      /*    widget.type == "sub" ?
          context.read<CategoriesCubit>().updateSubIndex(ind: val) :
          widget.type == "order_by" ?
          context.read<CategoriesCubit>().updateOrderPriceBy(orderById: val) :
          context.read<CreateCustomerCubit>().updateDropDown(val: val!);*/
        }),
      ],
    );
  }
}