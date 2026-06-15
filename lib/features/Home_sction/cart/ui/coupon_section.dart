import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/features/Home_sction/cart/ui/bloc/cart_cubit.dart';
import 'package:drug_flow/features/Home_sction/cart/ui/bloc/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CouponSection extends StatelessWidget {
  const CouponSection({super.key, required this.cartId});
  final int cartId;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final isLoading = state is CouponLoading;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("كود الخصم", style: TextStyles.textStyleBold13),
            SizedBox(height: 8.h),

            SizedBox(
              height: 42.h,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: "ادخل كود الخصم",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(4.w),
                    child: SizedBox(
                      width: 70.w,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            77,
                            150,
                            172,
                          ).withValues(alpha: 0.5),
                          textStyle: TextStyles.textStyleNormal10.copyWith(
                            color: Colors.white,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        onPressed: isLoading
                            ? null
                            : () {
                                context.read<CartCubit>().applyCoupon(
                                  code: controller.text,
                                  cartId: cartId,
                                );
                              },
                        child: isLoading
                            ? const CircularProgressIndicator()
                            : Text("تطبيق"),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            if (state is CouponSuccess)
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: Text(
                  "تم تطبيق الخصم: -${state.response.data.coupon.discountAmount}",
                  style: const TextStyle(color: Colors.green),
                ),
              ),
          ],
        );
      },
    );
  }
}
