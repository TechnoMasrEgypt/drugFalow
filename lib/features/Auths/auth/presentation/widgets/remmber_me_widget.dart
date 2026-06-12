import 'package:drug_flow/core/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../core/constants/styles.dart';

class RemmeberMeWidget extends StatefulWidget{
  @override
  State<RemmeberMeWidget> createState() => _RemmeberMeWidgetState();
}
class _RemmeberMeWidgetState extends State<RemmeberMeWidget>{
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
              side: BorderSide(color: primaryDark, width: 1),
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

          const SizedBox(width: 8),

// Make the text clickable independently
          GestureDetector(
            onTap: () {
             /* launchTermsUrl(context: context,
                  termsUrl: "https://form-web.technomasrsystems.com/pages/terms");*/
            },
            child: Text(
              tr("remember_me"),
              style: TextStyles.textStyleNormal12.copyWith(
                color: color121217),
              textScaler: TextScaler.linear(1),
            ),
          ),
        ],

    );
  }

}

