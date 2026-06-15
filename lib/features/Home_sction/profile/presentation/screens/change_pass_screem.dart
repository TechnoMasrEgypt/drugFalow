import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscureCurrent = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),

              /// App Bar
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_forward_ios),
                  ),
                  const Spacer(),
                  Text(
                    'كلمة المرور',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff222222),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24.h),

              _PasswordField(
                title: 'كلمة المرور الحالية',
                controller: _currentPasswordController,
                obscureText: _obscureCurrent,
                onToggleVisibility: () {
                  setState(() {
                    _obscureCurrent = !_obscureCurrent;
                  });
                },
              ),

              SizedBox(height: 20.h),

              _PasswordField(
                title: 'كلمة المرور الجديدة',
                controller: _newPasswordController,
                obscureText: _obscureNew,
                onToggleVisibility: () {
                  setState(() {
                    _obscureNew = !_obscureNew;
                  });
                },
              ),

              SizedBox(height: 20.h),

              _PasswordField(
                title: 'تأكيد كلمة المرور الجديدة',
                controller: _confirmPasswordController,
                obscureText: _obscureConfirm,
                onToggleVisibility: () {
                  setState(() {
                    _obscureConfirm = !_obscureConfirm;
                  });
                },
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 48.h,
                child: ElevatedButton(
                  onPressed: () {
                    // Change Password Action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffC6DEE6),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: Text(
                    'حفظ كلمة المرور',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}

class _PasswordField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool obscureText;
  final VoidCallback onToggleVisibility;

  const _PasswordField({
    required this.title,
    required this.controller,
    required this.obscureText,
    required this.onToggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: ' *',
                style: TextStyle(color: Colors.red, fontSize: 14),
              ),
              TextSpan(
                text: title,
                style: TextStyle(
                  color: const Color(0xff333333),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            hintText: '********',
            hintTextDirection: TextDirection.ltr,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 14.h,
            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(color: Color(0xffD9D9D9)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(color: Color(0xffD9D9D9)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(color: Color(0xffD9D9D9)),
            ),

            /// Left Eye
            prefixIcon: IconButton(
              onPressed: onToggleVisibility,
              icon: Icon(
                obscureText
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: const Color(0xffC9C9D4),
              ),
            ),

            /// Right Lock
            suffixIcon: const Icon(
              Icons.lock_outline,
              color: Color(0xff8D8CA7),
            ),
          ),
        ),
      ],
    );
  }
}
