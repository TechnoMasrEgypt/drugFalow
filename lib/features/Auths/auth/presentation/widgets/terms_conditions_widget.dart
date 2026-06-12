import 'package:drug_flow/core/utils/helpers.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/styles.dart';

class TermsConditionsWidget extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
// The checkbox itself
        Checkbox(
          value: false,

          activeColor: primaryDark,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: colorD1d1dB, width: 1),
            borderRadius: BorderRadius.circular(4),
          ),
          onChanged: (bool? newValue) {
            /* if (widget.type == "customer") {
                context.read<CreateCustomerCubit>().isTermsChecked(value: newValue);
              } else {
                context.read<CreateCompanyAccountCubit>().isTermsChecked(value: newValue);
              }*/
          },
        ),

    SizedBox(width: context.width/70),
Row(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Text(
      'موافقة على',
      style: TextStyles.textStyleNormal12.copyWith(
          color: color121217),
      textScaler: TextScaler.linear(1),
    ),
    GestureDetector(

        onTap: (){},
      child: Text(' الشروط والاحكام',style: TextStyles.textStyleNormal12.copyWith(
          color: primaryDark,
          decorationColor: primaryDark,
          decoration: TextDecoration.underline),
        textScaler: TextScaler.linear(1),
      )
    ),
    Text(
      'و',
      style: TextStyles.textStyleNormal12.copyWith(
          color: color121217),
      textScaler: TextScaler.linear(1),
    ),
    GestureDetector(

        onTap: (){},
        child: Text(' سياسة الخصوصية',style: TextStyles.textStyleNormal12.copyWith(
            color: primaryDark,
            decorationColor: primaryDark,
            decoration: TextDecoration.underline),
          textScaler: TextScaler.linear(1),
        )
    ),


  ],
)

      ],

    );
  }
}