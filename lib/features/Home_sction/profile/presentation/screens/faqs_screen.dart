import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/spacing.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/cubit/faqs/faqs_cubit.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/cubit/faqs/faqs_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FaqsScreen extends StatelessWidget {
  const FaqsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FaqsCubit, FaqsState>(

      builder: (context, state) 
      {
if(state is FaqsSuccess){
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 22.sp,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'الأسئلة الشائعة',
                        style: TextStyles.textStyleNormal16.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25.h),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                          height: 105.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.r),
                            border: Border.all(
                              color: AppColor.greyText,
                              width: 0.2,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 16.0.r,
                              right: 16.r,
                              top: 16.h,
                            ),
                            child: Column(
                              crossAxisAlignment: .start,
                              children: [
                                Text(state.faqs[index].question ?? "",
                                  // " هل يمكنني الطلب من أكثر من مخزن في نفس الوقت؟",
                                  style: TextStyles.textStyleNormal14.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                verticalSpace(4),
                                Text(state.faqs[index].answer ?? ""
                                  "الأسعار المعروضة هي أسعار المخزن الأساسية، وأي تفاصيل إضافية تُتفق عليها مباشرة مع المخزن.",
                                  style: TextStyles.textStyleNormal13.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromARGB(
                                      255,
                                      63,
                                      61,
                                      61,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 12.h);
                      },
                      itemCount: state.faqs.length,
                    ),
                  ),
                 
                ],
              ),
            ),
          ),
        );
}if(state is FaqsLoading){
  return Center(
    child: CircularProgressIndicator(),
  );
}
if(state is FaqsError){
  return Center(
    child: Text(state.message),
  );
}  return const SizedBox.shrink();

      },
    );
  }
}
