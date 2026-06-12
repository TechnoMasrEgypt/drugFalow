import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/utils/helpers.dart';
import 'package:flutter/cupertino.dart';

class OnboardingDescriptionWidget extends StatelessWidget{
  final String title;
  final String description;


  OnboardingDescriptionWidget({required this.title,required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title,style: TextStyles.textStyleBold20.copyWith(
          color: color121217
        ),textScaler: TextScaler.linear(1),),
        SizedBox(height: context.height/100,),
        Text(description,style: TextStyles.textStyleNormal13.copyWith(
          color:color8A8AA3
        ),textScaler: TextScaler.linear(1),textAlign: TextAlign.center,)
      ],
    );
  }
}