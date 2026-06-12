import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CouponSection extends StatelessWidget {
  const CouponSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("كود الخصم", style: TextStyles.textStyleBold13),

        SizedBox(height: 8.h),

        SizedBox(
          height: 42.h,
          child: TextField(
            decoration: InputDecoration(
              hintText: "ادخل كود الخصم",
              hintStyle: TextStyles.textStyleNormal11.copyWith(
                color: Colors.grey,
              ),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(color: Color(0xffE5E5E5)),
              ),

              suffixIcon: Padding(
                padding: EdgeInsets.all(4.w),
                child: SizedBox(
                  width: 70.w,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color.fromARGB(255, 173, 232, 243),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                    ),
                    child: Text(
                      "تطبيق",
                      style: TextStyles.textStyleNormal11.copyWith(
                        color: const Color.fromARGB(255, 233, 248, 253),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
