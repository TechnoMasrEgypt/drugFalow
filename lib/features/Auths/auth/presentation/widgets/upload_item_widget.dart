import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/utils/helpers.dart';
import 'package:drug_flow/core/widgets/svg_handler.dart';
import 'package:flutter/cupertino.dart';

class UploadItemWidget extends StatelessWidget{
  final String img;
  final String title;
  final String description;
final VoidCallback onTap;
final ImageProvider<Object>? imageProvider;
  UploadItemWidget({required this.img,required this.title,
    required this.description,required this.onTap,this.imageProvider});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
  width: context.width / 5.0,
  height: context.height / 10,
  alignment: Alignment.center,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    border: Border.all(color: colorD1d1dB),
  ),
  child: imageProvider != null
      ? ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image(
            image: imageProvider!,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        )
      : customSvg(
          name: img,
          width: context.width / 15,
          height: context.height / 15,
          fit: BoxFit.cover,
        ),
),
          SizedBox(width: context.width/30,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title,style: TextStyles.textStyleNormal14.copyWith(
                  fontWeight: FontWeight.w600
                ),textScaler: TextScaler.linear(1),),
                SizedBox(height: context.height/90,),
                Text(description,style: TextStyles.textStyleNormal11.copyWith(
                  color: color6C6C89,
                    fontWeight: FontWeight.w600
                ),textScaler: TextScaler.linear(1),),
              ],
            ),
          )
        ],
      ),
    );
  }
}