import 'package:drug_flow/core/app/app_cubit/app_cubit.dart';
import 'package:drug_flow/core/app/app_cubit/app_state.dart';
import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/screens.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/localization/lang_keys.dart';
import 'package:drug_flow/core/utils/helpers.dart';
import 'package:drug_flow/core/widgets/custom_button.dart';
import 'package:drug_flow/features/Auths/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingAppBar extends StatelessWidget {
  final bool showBackButton;

  const OnboardingAppBar({super.key, this.showBackButton = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.width / 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size(50, 30),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              alignment: Alignment.center,
            ),
            onPressed: () {
              context.read<OnboardingCubit>().controller.animateToPage(
                2,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            child: showBackButton
                ? IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back,
                      size: 25.sp,
                      color: color121217,
                    ),
                  )
                : TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(50.w, 30.h),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.center,
                    ),
                    onPressed: () {
                      context.read<OnboardingCubit>().controller.animateToPage(
                        2,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text(
                      context.translate(LangKeys.skip),
                      style: TextStyles.textStyleNormal13.copyWith(
                        color: color121217,
                      ),
                    ),
                  ),
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (_) => const LanguageBottomSheet(),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: context.width / 40,
                vertical: context.height / 85,
              ),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: colorD1d1dB, width: 1),
              ),
              child: BlocBuilder<AppCubit, AppState>(
                builder: (context, state) {
                  final cubit = context.read<AppCubit>();

                  return Text(
                    cubit.currentLangCode == 'ar' ? 'العربية' : 'English',
                    style: TextStyles.textStyleNormal13.copyWith(
                      color: color121217,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  late String selectedLanguage;

  @override
  void initState() {
    super.initState();
    selectedLanguage = context.read<AppCubit>().currentLangCode;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            const SizedBox(height: 24),

            Text(
              context.translate(LangKeys.languageTilte),
              style: TextStyles.textStyleBold16,
            ),

            const SizedBox(height: 24),
            RadioListTile<String>(
              value: "ar",
              groupValue: selectedLanguage,
              activeColor: primaryDark,
              title: const Text("العربية"),
              onChanged: (value) {
                setState(() {
                  selectedLanguage = value!;
                });
              },
            ),
            RadioListTile<String>(
              value: "en",
              groupValue: selectedLanguage,
              activeColor: primaryDark,
              title: const Text("English"),
              onChanged: (value) {
                setState(() {
                  selectedLanguage = value!;
                });
              },
            ),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: CustomButton(
                btnTitle: context.translate(LangKeys.changeToTheLanguage),
                type: '',
                onPressed: () {
                  final cubit = context.read<AppCubit>();

                  if (selectedLanguage == 'ar') {
                    cubit.toArabic();
                  } else {
                    cubit.toEnglish();
                  }

                  Navigator.pop(context);
                },
              ),
            ),

            SizedBox(height: 16.h),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: CustomButtonOutline(
                color: Colors.white,
                borderColor: Colors.blue,
                textColor: primaryDark,
                btnTitle: (context.translate(LangKeys.cancel)),
                onPressed: () {
                  Navigator.pop(context);
                },
                type: '',
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}



class OnboardingAppBarreversed extends StatelessWidget {
  final bool showBackButton;

  const OnboardingAppBarreversed({super.key, this.showBackButton = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.width / 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (_) => const LanguageBottomSheet(),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: context.width / 40,
                vertical: context.height / 85,
              ),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: colorD1d1dB, width: 1),
              ),
              child: BlocBuilder<AppCubit, AppState>(
                builder: (context, state) {
                  final cubit = context.read<AppCubit>();

                  return Text(
                    cubit.currentLangCode == 'ar' ? 'العربية' : 'English',
                    style: TextStyles.textStyleNormal13.copyWith(
                      color: color121217,
                    ),
                  );
                },
              ),
            ),
          ),TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size(50, 30),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              alignment: Alignment.center,
            ),
            onPressed: () {
              context.read<OnboardingCubit>().controller.animateToPage(
                2,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            child: showBackButton
                ? IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back,
                      size: 25.sp,
                      color: color121217,
                    ),
                  )
                : TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(50.w, 30.h),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.center,
                    ),
                    onPressed: () {
                      context.read<OnboardingCubit>().controller.animateToPage(
                        2,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text(
                      context.translate(LangKeys.skip),
                      style: TextStyles.textStyleNormal13.copyWith(
                        color: color121217,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
