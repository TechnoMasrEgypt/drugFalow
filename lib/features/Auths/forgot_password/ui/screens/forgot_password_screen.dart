import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/exts.dart';
import 'package:drug_flow/core/constants/images.dart';
import 'package:drug_flow/core/constants/screens.dart';
import 'package:drug_flow/core/constants/spacing.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/localization/lang_keys.dart';
import 'package:drug_flow/core/utils/helpers.dart';
import 'package:drug_flow/core/utils/network_images.dart';
import 'package:drug_flow/core/widgets/custom_button.dart';
import 'package:drug_flow/core/widgets/custom_text_field.dart';
import 'package:drug_flow/core/widgets/image_handler.dart';
import 'package:drug_flow/core/widgets/svg_handler.dart';
import 'package:drug_flow/features/Auths/forgot_password/logic/forget_password_cubit.dart';
import 'package:drug_flow/features/Auths/forgot_password/logic/forget_password_state.dart';
import 'package:drug_flow/features/Auths/onboarding/presentation/widgets/onboarding_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

class ForogotPasswordScreen extends StatelessWidget {
  ForogotPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<ForgetPasswordCubit, ForgetPassState>(
        listener: (context, state) {
          // TODO: implement listener
          state.whenOrNull(
            ForgetSuccess: (response) {
              toastification.show(
                context: context,
                type: ToastificationType.success,
                title: Text(response.message),
                autoCloseDuration: const Duration(seconds: 3),
              );
              // final email = cubit.emailEditingController.text.trim();

              context.push(
                otpSc,
                extra: context
                    .read<ForgetPasswordCubit>()
                    .emailEditingController
                    .text,
              );
            },
            error: (message) {
              Toastification();
            },
          );
        },
        child: BlocBuilder<ForgetPasswordCubit, ForgetPassState>(
          builder: (context, state) {
            var cubit = context.read<ForgetPasswordCubit>();
            return SafeArea(
              child: Column(
                crossAxisAlignment: .start,
                // mainAxisAlignment: .end,
                children: [
                  // SizedBox.shrink(),
                  // OnboardingAppBar(),
                  Padding(
                    padding: EdgeInsets.only(left: 16.w, right: 16.w),
                    child: Column(
                      crossAxisAlignment: .start,

                      children: [
                        verticalSpace(13),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(Icons.arrow_back),
                        ),
                        verticalSpace(8),
                        Text(
                          context.translate(LangKeys.forgotPassword),
                          style: TextStyles.textStyleBold23,
                        ),
                        verticalSpace(12),
                        Text(
                          context.translate(LangKeys.enterEmailToResetPassword),
                          style: TextStyles.textStyleNormal12.copyWith(
                            color: AppColor.greyText,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // verticalSpace(62),
                  Container(
                    width: double.infinity,
                    height: 500.h,
                    child: ImageHandler(
                      img: shield1,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),

                  // verticalSpace(58),
                  Padding(
                    padding: EdgeInsets.only(left: 16.w, right: 16.w),
                    child: Column(
                      crossAxisAlignment: .start,

                      children: [
                        CustomTextField(
                          controller: cubit.emailEditingController,
                          hintTxt: "",
                          svgIcon: mail,
                          obscure: false,
                          textInputType: TextInputType.text,
                          validator: (val) {},
                          title: context.translate(LangKeys.email),
                        ),
                        verticalSpace(16),
                        Container(
                          width: double.infinity,
                          // margin: EdgeInsets.symmetric(horizontal: context.width / 15),
                          child: CustomButton(
                            btnTitle: context.translate(LangKeys.login),
                            onPressed: () {
                              final email = cubit.emailEditingController.text
                                  .trim();

                              if (email.isEmpty) {
                                toastification.show(
                                  context: context,
                                  type: ToastificationType.warning,
                                  title: Text(
                                    LangKeys.enterEmailToResetPassword,
                                  ),
                                  autoCloseDuration: const Duration(seconds: 3),
                                );
                                return;
                              }

                              context
                                  .read<ForgetPasswordCubit>()
                                  .forgetPassword(email);
                            },
                          ),
                        ),
                      ],
                    ),
                  ), // customSvg(
                  //   name: pharmacy,
                  //   width: 375.w,
                  //   height: 360.h,
                  //   fit: BoxFit.cover,
                  // ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
