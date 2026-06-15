import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/screens.dart';
import 'package:drug_flow/core/constants/spacing.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/localization/lang_keys.dart';
import 'package:drug_flow/core/utils/helpers.dart';
import 'package:drug_flow/core/widgets/custom_button.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/forgot_password/forgot_password_params.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/reset_password/reset_password_params.dart';
import 'package:drug_flow/features/Auths/forgot_password/logic/forget_password_cubit.dart';
import 'package:drug_flow/features/Auths/forgot_password/logic/forget_password_state.dart';
import 'package:drug_flow/features/Auths/onboarding/presentation/widgets/onboarding_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key, required this.params});

  @override
  final ResetPasswordParams params;
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPassState>(
      listener: (context, state) {
        state.whenOrNull(
          resetPasswordSuccess: (message) {
            context.go(loginSc);
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('تم التغيير بنجاح')));
            return;
          },
        );
      },
      builder: (context, state) {
        var cubit = context.read<ForgetPasswordCubit>();
        return Scaffold(
          backgroundColor: white,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  // const OnboardingAppBar(showBackButton: true),
                  verticalSpace(13),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back),
                  ),

                  Text(
                    "تغيير كلمه المرور",
                    style: TextStyles.textStyleBold24,
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 12.h),

                  Text(
                    'تم تأكيد البريد الإلكتروني, يمكنك تغيير كلمه المرور.\n تأكد ان تكون مختلفة عن كلمه المرور القديمه',
                    style: TextStyles.textStyleNormal14.copyWith(
                      color: AppColor.greyText,
                    ),
                  ),

                  SizedBox(height: 32.h),

                  Text(
                    'كلمة المرور',
                    style: TextStyles.textStyleBold14.copyWith(
                      color: AppColor.textBlack,
                    ),
                  ),

                  SizedBox(height: 8.h),

                  TextFormField(
                    controller: passwordController,
                    obscureText: obscurePassword,
                    decoration: InputDecoration(
                      hintText: '••••••••',
                      suffixIcon: IconButton(
                        icon: Icon(
                          color: AppColor.borderText,
                          obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            obscurePassword = !obscurePassword;
                          });
                        },
                      ),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: AppColor.shadowColor,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(
                          color: AppColor.borderText,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(
                          color: AppColor.borderText,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(
                          color: AppColor.borderText,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h),

                  Text(
                    'تأكيد كلمة المرور',
                    style: TextStyles.textStyleBold14.copyWith(
                      color: AppColor.textBlack,
                    ),
                  ),

                  SizedBox(height: 8.h),

                  TextFormField(
                    controller: confirmPasswordController,
                    obscureText: obscureConfirmPassword,
                    decoration: InputDecoration(
                      hintText: '••••••••',
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscureConfirmPassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: AppColor.borderText,
                        ),
                        onPressed: () {
                          setState(() {
                            obscureConfirmPassword = !obscureConfirmPassword;
                          });
                        },
                      ),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: AppColor.shadowColor,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(
                          color: AppColor.borderText,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(
                          color: AppColor.borderText,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(
                          color: AppColor.borderText,
                        ),
                      ),
                    ),
                  ),

                  const Spacer(),

                  SizedBox(
                    width: double.infinity,
                    height: 48.h,
                    child: CustomButton(
                      btnTitle: 'حفظ كلمة المرور الجديدة',
                      type: '',
                      onPressed: () {
                        print("========================");
                        print(widget.params.email.toString());
                        print(widget.params.resetToken.toString());
                        print(passwordController.text.toString());
                        print(confirmPasswordController.text.toString());
                        print("========================");
                        if (passwordController.text ==
                            confirmPasswordController.text) {
                          cubit.resetPassword(
                            ResetPasswordParams(
                              password: passwordController.text,
                              passwordConfirmation:
                                  confirmPasswordController.text,
                              email: widget.params.email,
                              resetToken: widget.params.resetToken,
                            ),
                          );
                        }

                        // API Call
                      },
                    ),
                  ),

                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
