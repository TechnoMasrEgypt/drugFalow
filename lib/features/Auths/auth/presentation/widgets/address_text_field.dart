import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/styles.dart';
import '../../../../../core/utils/helpers.dart';
import '../../../../../core/widgets/svg_handler.dart';

class AddressTextField extends StatefulWidget {
  AddressTextField({super.key, required this.controller,required this.obscure,
    this.visible, this.type, this.onTap, required this.hintTxt, this.validator,
    required this.svgIcon, required this.textInputType, required this.title
    , this.maxLines = 1,this.enabled = true});
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
  State<AddressTextField> createState() => _AddressTextFieldState();

}

class _AddressTextFieldState extends State<AddressTextField> {
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(widget.title,style: TextStyles.textStyleNormal14.copyWith(
            fontWeight: FontWeight.w600,
            color: color121217
        ),textScaler: TextScaler.linear(1),),
        SizedBox(height: context.height/140,),
        MediaQuery(data: MediaQueryData(textScaler: TextScaler.linear(1)),
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: widget.controller,
            obscureText: widget.obscure!,
            enabled: widget.enabled,
            validator: widget.validator,
            keyboardType: widget.textInputType,

            maxLines: widget.maxLines,
            style: TextStyles.textStyleNormal14.copyWith(color: color121217,),
            decoration: InputDecoration(
              fillColor: colorF8FAFC,
              contentPadding: EdgeInsets.symmetric(vertical: 0),
              hint: Container(
                padding: EdgeInsets.only(top: 0),
                child: Text(widget.hintTxt,style: TextStyles.textStyleNormal14
                    .copyWith(color: color818984,),textScaler: TextScaler.linear(1)
                  ,softWrap: true,),
              ),


              suffixIcon: widget.type == "pass" ?

              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: widget.onTap!,
                child: Container(
                    alignment: Alignment.center,
                    width: context.width/20,
                    child: widget.visible == true ?
                    Icon(Icons.visibility_off_outlined,color: color818984,):
                    Icon(Icons.visibility_outlined,color: color818984,)
                ),
              ) :
              SizedBox(width: context.width/30,),
              filled: true,
              errorStyle: TextStyles.textStyleNormal10.copyWith(color: Colors.red,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: colorD1d1dB,width: 1)
              ),
              errorBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Colors.red)
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: colorD1d1dB,width: 1)
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: colorD1d1dB,width: 1)
              ),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: colorD1d1dB,width: 1)
              ),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: colorD1d1dB,width: 1)
              ),

            ),
          ),
        ),
      ],
    );
  }
}