import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/features/Home_sction/profile/data/coupon_response.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/cubit/coupons/coupons_cubit.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/cubit/coupons/coupons_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CouponsScreen extends StatelessWidget {
  const CouponsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CouponsCubit, CouponsState>(
      builder: (context, state) {
        final coupons =
            state is CouponsSuccess ? state.coupons??[] : [];

        return Scaffold(
          backgroundColor: const Color(0xffF8F8F8),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            title: Text(
              'كوبونات الخصم',
              style: TextStyles.textStyleBold16.copyWith(
                color: Color(0xff222222),

                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: false,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back, color: Colors.black),
            ),
          ),
          body: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: coupons.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              return CouponCard(
                coupon: coupons[index],
                onCopy: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('تم نسخ ${coupons[index].code}')),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}

class CouponCard extends StatelessWidget {
  const CouponCard({super.key, required this.coupon, required this.onCopy});

  final CouponModel coupon;
  final VoidCallback onCopy;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xffEEEEEE)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coupon.name,
                  textAlign: TextAlign.right,
                  style: TextStyles.textStyleBold13.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff222222),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  coupon.endDate,
                  textAlign: TextAlign.right,
                  style: TextStyles.textStyleBold11.copyWith(
                    fontWeight: FontWeight.w400,

                    fontSize: 12,
                    color: Color(0xffA0A0A0),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          ElevatedButton.icon(
            onPressed: onCopy,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff2F86A3),
              elevation: 0,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            icon: Icon(Icons.copy, size: 16.sp, color: Colors.white),
            label: Text(
              'نسخ الكود',
              style: TextStyles.textStyleBold13.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
