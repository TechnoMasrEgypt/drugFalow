import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/images.dart';
import 'package:drug_flow/core/constants/screens.dart';
import 'package:drug_flow/core/constants/spacing.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/localization/lang_keys.dart';
import 'package:drug_flow/core/utils/helpers.dart';
import 'package:drug_flow/core/utils/network_images.dart';
import 'package:drug_flow/core/widgets/custom_app_bar.dart';
import 'package:drug_flow/core/widgets/custom_button.dart';
import 'package:drug_flow/core/widgets/svg_handler.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/login/login_params.dart';
import 'package:drug_flow/features/Auths/auth/presentation/widgets/intl_phone_form_field.dart';
import 'package:drug_flow/features/Auths/auth/presentation/widgets/remmber_me_widget.dart';
import 'package:drug_flow/features/Auths/login/logic/login_cubit.dart';
import 'package:drug_flow/features/Auths/login/logic/login_state.dart';
import 'package:drug_flow/features/Auths/onboarding/presentation/widgets/onboarding_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    context.read<LoginCubit>().setTabController(ticker: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (user) {
              toastification.show(
                context: context,
                type: ToastificationType.success,
                style: ToastificationStyle.flat,
                title: Text(context.translate(LangKeys.loggedSuccessfully)),

                autoCloseDuration: const Duration(seconds: 3),
                alignment: Alignment.topCenter,
              );
              context.push(bottomBarSc);
            },
            error: (error) {
              toastification.show(
                context: context,
                type: ToastificationType.error,
                title: Text(error),
                autoCloseDuration: const Duration(seconds: 3),
              );
            },
          );
        },
        builder: (context, state) {
          var cubit = context.read<LoginCubit>();

          return Scaffold(
            backgroundColor: white,
            resizeToAvoidBottomInset: true,
            body: Form(
              key: context.read<LoginCubit>().formKey,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 317.h,
                      child: AppImage(image: bbbl, fit: BoxFit.fill),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: context.height / 40),

                      OnboardingAppBar(showBackButton: true),

                      Container(
                        alignment: Alignment.center,
                        child: customSvg(
                          name: login,
                          height: 52.h,
                          width: 44.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Center(
                        child: Text(
                          context.translate(LangKeys.welcomeBack),
                          style: TextStyles.textStyleBold34.copyWith(
                            color: color121217,
                          ),
                          textScaler: TextScaler.linear(1),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Center(
                        child: Text(
                          context.translate(LangKeys.loginWithEmailOrPhone),
                          style: TextStyles.textStyleNormal12.copyWith(
                            color: color6C6C89,
                          ),
                          textScaler: TextScaler.linear(1),
                        ),
                      ),
                      SizedBox(height: context.height / 30),
                      BlocBuilder<LoginCubit, LoginState>(
                        builder: (context, state) => Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: context.width / 30,
                          ),
                          width: double.infinity,
                          child: TabBar(
                            controller: context
                                .read<LoginCubit>()
                                .tabController,
                            indicatorColor: primaryDark,
                            dividerColor: color8A8AA3.withOpacity(.1),
                            textScaler: TextScaler.linear(1),
                            labelPadding: EdgeInsets.symmetric(
                              horizontal: context.width / 80,
                            ),
                            padding: EdgeInsets.zero,
                            indicatorSize: TabBarIndicatorSize.tab,

                            isScrollable: false,
                            onTap: (int val) {
                              context.read<LoginCubit>().updateTabState(
                                val: val,
                              );
                            },
                            tabs: [
                              Tab(
                                child: Text(
                                  context.translate(LangKeys.email),
                                  style: TextStyles.textStyleBold14.copyWith(
                                    color: context.read<LoginCubit>().ind == 0
                                        ? primaryDark
                                        : color6C6C89,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textScaler: TextScaler.linear(1),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  context.translate(LangKeys.phone),
                                  style: TextStyles.textStyleBold14.copyWith(
                                    color: context.read<LoginCubit>().ind == 1
                                        ? primaryDark
                                        : color6C6C89,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textScaler: TextScaler.linear(1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: context.width / 20,
                        ),
                        height: context.height / 6.3,
                        child: TabBarView(
                          physics: NeverScrollableScrollPhysics(),
                          controller: context.read<LoginCubit>().tabController,
                          children: [
                            SizedBox(
                              child: CustomTextField(
                                controller: cubit.emailController,
                                hintTxt: "",
                                svgIcon: mail,
                                obscure: false,
                                textInputType: TextInputType.text,

                                validator: (val) {
                                  if (cubit.ind == 0) {
                                    if (val == null || val.trim().isEmpty) {
                                      return context.translate(
                                        LangKeys.fieldRequired,
                                      );
                                    }
                                  }
                                  return null;
                                },

                                title: context.translate(LangKeys.email),
                              ),
                            ),
                            SizedBox(
                              child: IntlPhoneFormField(
                                countryCodeController:
                                    cubit.countryCodeController,
                                controller: cubit.phoneController,
                                hintTxt: "+20 10 1234567",
                                type: context.translate(LangKeys.phone),
                                obscure: false,
                                validator: (val) {
                                  if (cubit.ind == 1) {
                                    if (val == null || val.trim().isEmpty) {
                                      return context.translate(
                                        LangKeys.fieldRequired,
                                      );
                                    }
                                  }
                                  return null;
                                },
                                textInputType: TextInputType.number,
                                title: context.translate(LangKeys.phone),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // verticalSpace(8),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: context.width / 20,
                        ),
                        child: CustomTextField(
                          controller: cubit.passwordController,
                          hintTxt: context.translate(LangKeys.password),
                          svgIcon: knock,
                          obscure: true,
                          textInputType: TextInputType.text,
                          validator: (val) {
                            if (cubit.passwordController.text.isEmpty) {
                              return context.translate(LangKeys.fieldRequired);
                            } else {
                              return null;
                            }
                          },
                          title: context.translate(LangKeys.password),
                        ),
                      ),
                      SizedBox(height: context.height / 45),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.width / 20,
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () => context.push(forgoPassSc),
                            child: Text(
                              context.translate(LangKeys.forgotPassword),
                              style: TextStyles.textStyleNormal12.copyWith(
                                color: color8A8AA3,
                              ),
                              textScaler: TextScaler.linear(1),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: context.height / 25),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(
                          horizontal: context.width / 15,
                        ),
                        child: CustomButton(
                          btnTitle: context.translate(LangKeys.login),
                          onPressed: () {
                            if (cubit.emailController.text.isEmpty &&
                                cubit.phoneController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    context.translate(
                                      LangKeys.emailOrPhoneRequired,
                                    ),
                                  ),
                                ),
                              );
                              return;
                            }
                            if (cubit.passwordController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    context.translate(LangKeys.validPasswrod),
                                  ),
                                ),
                              );
                              return;
                            }
                            if (cubit.formKey.currentState!.validate()) {
                              print("Validation Success");
                              cubit.emitLoginStates();

                              return;
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            context.translate(LangKeys.youHaveAccount),
                            style: TextStyles.textStyleNormal12.copyWith(
                              color: color8A8AA3,
                            ),
                            textScaler: TextScaler.linear(1),
                          ),
                          SizedBox(height: context.width / 30),
                          InkWell(
                            onTap: () {
                              context.push(registerSc);
                            },
                            child: Text(
                              context.translate(LangKeys.createAccount),
                              style: TextStyles.textStyleNormal12.copyWith(
                                color: primaryDark,
                                decoration: TextDecoration.underline,
                                decorationColor: primaryDark,
                                fontWeight: FontWeight.w600,
                              ),
                              textScaler: TextScaler.linear(1),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: context.height / 20),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
