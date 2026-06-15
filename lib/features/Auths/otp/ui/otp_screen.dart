import 'dart:async';

import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/constants/screens.dart';
import 'package:drug_flow/core/utils/helpers.dart';
import 'package:drug_flow/core/widgets/custom_button.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/reset_password/reset_password_params.dart';
import 'package:drug_flow/features/Auths/otp/logic/otp_cubit.dart';
import 'package:drug_flow/features/Auths/otp/logic/otp_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  final String email;

  const OtpScreen({super.key, required this.email});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController = TextEditingController();

  // ── Timer ──────────────────────────────────────────────────────────────────
  Timer? _timer;
  int _secondsRemaining = 120; // 2 minutes
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _canResend = false;
    _secondsRemaining = 120;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_secondsRemaining > 0) {
        setState(() => _secondsRemaining--);
      } else {
        t.cancel();
        setState(() => _canResend = true);
      }
    });
  }

  String get _timeFormatted {
    final m = _secondsRemaining ~/ 60;
    final s = _secondsRemaining % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer?.cancel();
    _otpController.dispose();
    super.dispose();
  }

  // ── Verify ─────────────────────────────────────────────────────────────────
  void _onVerify() {
    final pin = _otpController.text.trim();

    if (pin.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى إدخال كود التحقق كاملاً')),
      );
      return;
    }

    context.read<OtpCubit>().verifyResetCode(email: widget.email, code: pin);
  }

  // ── Resend ─────────────────────────────────────────────────────────────────
  void _onResend() {
    context.read<OtpCubit>().resendCode(widget.email);
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 48.w,
      height: 52.h,
      textStyle: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: color121217,
      ),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: colorD1d1dB),
      ),
    );

    return BlocListener<OtpCubit, OtpState>(
      listener: (context, state) {
        state.whenOrNull(
          verifySuccess: (response) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(response.message.toString()),
                backgroundColor: Colors.green,
              ),
            );

            context.go(
              resetPasswordSc,
              extra: ResetPasswordParams(
                email: widget.email,
                resetToken: response.data?.resetToken,
              ),
            );
          },
          resendSuccess: (response) {
            _startTimer();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('تم إعادة إرسال الكود بنجاح'),
                backgroundColor: Colors.green,
              ),
            );
          },
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message), backgroundColor: Colors.red),
            );
          },
        );
      },
      child: Scaffold(
        backgroundColor: white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 13.h),

                // ── Back button ──
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: colorF7F7F8,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 18,
                      color: color121217,
                    ),
                  ),
                ),

                SizedBox(height: 28.h),

                // ── Title ──
                Text(
                  'ادخل كود التحقق',
                  style: TextStyles.textStyleBold24.copyWith(
                    color: color121217,
                  ),
                ),

                SizedBox(height: 10.h),

                // ── Subtitle ──
                RichText(
                  text: TextSpan(
                    style: TextStyles.textStyleNormal14.copyWith(
                      color: color6C6C89,
                    ),
                    children: [
                      const TextSpan(
                        text: 'لقد أرسلنا كوداً مكوناً من 6 أرقام إلى ',
                      ),
                      TextSpan(
                        text: widget.email,
                        style: TextStyles.textStyleNormal14.copyWith(
                          color: primaryDark,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 36.h),

                // ── PIN input ──
                Center(
                  child: Pinput(
                    controller: _otpController,
                    length: 6,
                    autofocus: true,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: primaryDark, width: 1.5),
                      ),
                    ),
                    submittedPinTheme: defaultPinTheme.copyWith(
                      decoration: BoxDecoration(
                        color: colorCCE5EC,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: primaryDark),
                      ),
                    ),
                    onCompleted: (pin) => debugPrint('OTP entered: $pin'),
                  ),
                ),

                SizedBox(height: 28.h),

                // ── Timer + Resend ──
                BlocBuilder<OtpCubit, OtpState>(
                  builder: (context, state) {
                    final isLoading = state.maybeWhen(
                      loading: () => true,
                      orElse: () => false,
                    );
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'لم تحصل على الكود؟ ',
                          style: TextStyles.textStyleNormal12.copyWith(
                            color: color6C6C89,
                          ),
                        ),
                        if (_canResend)
                          GestureDetector(
                            onTap: isLoading ? null : _onResend,
                            child: isLoading
                                ? SizedBox(
                                    width: 16.w,
                                    height: 16.h,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: primaryDark,
                                    ),
                                  )
                                : Text(
                                    'إعادة إرسال',
                                    style: TextStyles.textStyleBold12.copyWith(
                                      color: primaryDark,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                          )
                        else
                          Text(
                            _timeFormatted,
                            style: TextStyles.textStyleBold12.copyWith(
                              color: primaryDark,
                            ),
                          ),
                      ],
                    );
                  },
                ),

                const Spacer(),

                // ── Verify button ──
                SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: CustomButton(btnTitle: 'تأكيد', onPressed: _onVerify),
                ),

                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
