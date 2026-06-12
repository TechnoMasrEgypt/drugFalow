import 'dart:ui' as ui;
import 'package:drug_flow/core/constants/images.dart';
import 'package:drug_flow/core/constants/screens.dart';
import 'package:drug_flow/core/localization/lang_keys.dart';
import 'package:drug_flow/core/utils/helpers.dart';
import 'package:drug_flow/core/widgets/custom_button.dart';
import 'package:drug_flow/features/Auths/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:drug_flow/features/Auths/onboarding/presentation/widgets/on_boarding_first.dart';
import 'package:drug_flow/features/Auths/onboarding/presentation/widgets/onboarding_app_bar.dart';
import 'package:drug_flow/features/Auths/onboarding/presentation/widgets/onboarding_description_widget.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:drug_flow/core/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../domain/entities/onboarding_data.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<String> images = [onboarding, onboarding2, onboarding3];
  @override
  Widget build(BuildContext context) {
    List<OnboardingData> onBoardingList = [
      OnboardingData(
        title: context.translate(LangKeys.onboardingTitle1),
        description: context.translate(LangKeys.onboardingDescription1),
      ),
      OnboardingData(
        title: context.translate(LangKeys.onboardingTitle2),
        description: context.translate(LangKeys.onboardingDescription2),
      ),
      OnboardingData(
        title: context.translate(LangKeys.onboardingTitle3),
        description: context.translate(LangKeys.onboardingDescription3),
      ),
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: Column(
          children: [
            SizedBox(height: context.height / 40),
            OnboardingAppBar(),
            SizedBox(height: context.height / 60),
            Expanded(
              child: BlocBuilder<OnboardingCubit, OnboardingState>(
                builder: (context, state) {
                  return SafeArea(
                    top: true,
                    bottom: false,
                    child: PageView(
                      controller: context.read<OnboardingCubit>().controller,
                      padEnds: false,

                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (int? pageInd) {
                        context.read<OnboardingCubit>().onPageIndex(
                          ind: pageInd,
                        );
                      },
                      allowImplicitScrolling: true,
                      children: images.map((i) {
                        return OnBoardingFirst(img: i);
                      }).toList(),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: context.height / 30),
            BlocBuilder<OnboardingCubit, OnboardingState>(
              builder: (context, state) {
                return OnboardingDescriptionWidget(
                  title:
                      onBoardingList[context.read<OnboardingCubit>().pageInd!]
                          .title,
                  description:
                      onBoardingList[context.read<OnboardingCubit>().pageInd!]
                          .description,
                );
              },
            ),
            SizedBox(height: 12.h),

            SmoothPageIndicator(
              textDirection: ui.TextDirection.ltr,
              effect: ExpandingDotsEffect(
                spacing: 8,
                radius: 20,
                dotWidth: context.width / 60,
                dotHeight: context.width / 60,
                activeDotColor: color97C3D0,
                dotColor: colorCCE5EC,
              ),
              controller: context.read<OnboardingCubit>().controller,
              count: 3,
            ),
            SizedBox(height: 42.h),
            BlocBuilder<OnboardingCubit, OnboardingState>(
              builder: (context, state) {
                final isLastPage = context.read<OnboardingCubit>().pageInd == 2;

                if (!isLastPage) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: SizedBox(
                          width: double.infinity,
                          height: 48.h,
                          child: CustomButton(
                            btnTitle: context.translate(LangKeys.next),
                            onPressed: () {
                              context
                                  .read<OnboardingCubit>()
                                  .controller
                                  .nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut,
                                  );
                            },
                            type: '',
                          ),
                        ),
                      ),
                    ],
                  );
                }

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 48.h,
                        child: CustomButtonOutline(
                          color: Colors.white,
                          borderColor: Colors.blue,
                          textColor: primaryDark,
                          btnTitle: context.translate(LangKeys.login),
                          onPressed: () {
                            context.push(loginSc);
                          },
                          type: '',
                        ),
                      ),

                      SizedBox(height: 12.h),

                      SizedBox(
                        width: double.infinity,
                        height: 48.h,
                        child: CustomButton(
                          btnTitle: context.translate(LangKeys.createAccount),
                          onPressed: () {
                            context.push(registerSc);
                            print(" registerSc $registerSc");
                          },
                          type: '',
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: context.height / 30),
          ],
        ),
      ),
    );
  }
}
