import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/images.dart';
import 'package:drug_flow/core/constants/screens.dart';
import 'package:drug_flow/core/constants/spacing.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/utils/network_images.dart';
import 'package:drug_flow/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: .center,
          // crossAxisAlignment: .start,
          children: [
            AppImage(image: ware2, height: 52.h, width: 60.w),
            horizontalSpace(8),
            Text(
              "الريان فارم للتجارة ",
              style: TextStyles.textStyleNormal20.copyWith(color: color6C6C89),
            ),
          ],
        ),
        verticalSpace(10),
        InkWell(
          onTap: onTap,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.asset(
                  panadol,
                  width: 100.w,
                  height: 110.h,
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(width: 8.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "بانادول اكسترا بانادولرين اضافي، مسكن فعال للألم والحمي | 24 قرص",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.textStyleBold11.copyWith(
                        color: const Color(0xff303030),
                      ),
                    ),

                    SizedBox(height: 8.h),

                    Row(
                      children: [
                        Text(
                          "٥٨",
                          style: TextStyles.textStyleBold12.copyWith(
                            color: const Color(0xff303030),
                          ),
                        ),

                        horizontalSpace(4),

                        Text(
                          "جنيه مصري",
                          style: TextStyles.textStyleNormal10.copyWith(
                            color: const Color(0xff999999),
                          ),
                        ),

                        horizontalSpace(4),

                        Text(
                          "١٢٠ جنيه مصري",
                          style: TextStyles.textStyleNormal10.copyWith(
                            color: const Color(0xff999999),
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),

                        horizontalSpace(6),
                        Spacer(),
                        Container(
                          width: 60.w,
                          height: 40.h,
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 2.h,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffFEF0F4)),
                            color: const Color(0xffFEF0F4),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Center(
                            child: Text(
                              "خصم ٥٢٪",
                              style: TextStyles.textStyleBold10.copyWith(
                                color: const Color(0xffD50B3E),
                                fontSize: 9.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 10.h),

                    Center(
                      child: Row(
                        children: [
                          Container(
                            width: 100.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xffE5E5E5),
                              ),
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Icon(Icons.remove, size: 12.sp),
                                  ),
                                ),

                                Container(
                                  width: 1,
                                  color: const Color(0xffE5E5E5),
                                ),

                                Expanded(
                                  child: Center(
                                    child: Text(
                                      "2",
                                      style: TextStyles.textStyleNormal11,
                                    ),
                                  ),
                                ),

                                Container(
                                  width: 1,
                                  color: const Color(0xffE5E5E5),
                                ),

                                Expanded(
                                  child: Center(
                                    child: Icon(Icons.add, size: 12.sp),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const Spacer(),

                          Container(
                            // padding: EdgeInsets.symmetric(horizontal: 16.w),
                            width: 60.w,
                            // margin: EdgeInsets.symmetric(horizontal: context.width / 15),
                            child: CustomButton(
                              btnTitle: 'نقل',
                              onPressed: () {
                                _showSortBottomSheet(context);
                                // context.push(ordersSc);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

void _showSortBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) => const _SortBottomSheet(),
  );
}

class _SortBottomSheet extends StatefulWidget {
  const _SortBottomSheet();

  @override
  State<_SortBottomSheet> createState() => _SortBottomSheetState();
}

class _SortBottomSheetState extends State<_SortBottomSheet> {
  int _selected = 1; // default: price high → low

  final List<String> _options = [
    "إيفا فارما",
    "أمون للأدوية",
    "راميدا",
    "سيديكو",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle
          Container(
            width: 40.w,
            height: 4.h,
            margin: EdgeInsets.only(bottom: 16.h),
            decoration: BoxDecoration(
              color: color121217.withOpacity(.15),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          // Title
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "اختر الشركة",
              style: TextStyles.textStyleBold20.copyWith(color: color121217),
              textScaler: TextScaler.linear(1),
            ),
          ),
          SizedBox(height: 12.h),
          // Radio options
          ..._options.asMap().entries.map((entry) {
            final i = entry.key;
            final label = entry.value;
            return InkWell(
              onTap: () => setState(() => _selected = i),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Radio circle
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      width: 20.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: _selected == i
                              ? primaryDark
                              : color121217.withOpacity(.3),
                          width: _selected == i ? 5 : 1.5,
                        ),
                      ),
                    ),
                    // Label
                    Text(
                      label,
                      style: TextStyles.textStyleNormal14.copyWith(
                        color: color121217,
                      ),
                      textScaler: TextScaler.linear(1),
                    ),
                  ],
                ),
              ),
            );
          }),
          SizedBox(height: 12.h),
          // Apply button
          SizedBox(
            width: double.infinity,
            height: 44.h,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryDark,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: Text(
                "تطبيق",
                style: TextStyles.textStyleBold20.copyWith(color: white),
                textScaler: TextScaler.linear(1),
              ),
            ),
          ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}
