import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/images.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/utils/network_images.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/cubit/contact_us/contact_us_cubit.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/cubit/contact_us/contact_us_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SocialLinksCubit, SocialLinksState>(
      builder: (context, state) {
        var cubit = context.read<SocialLinksCubit>();
          if (state is! SocialLinksSuccess) {
      return const SizedBox();
    }
    final links = state.data;

        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),

                    // ── Title Row ──────────────────────────────────────
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
                          'تواصل معنا',
                          style: TextStyles.textStyleNormal16.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 24.h),

                    // ── الاسم ──────────────────────────────────────────
                    _buildLabel('الاسم'),
                    SizedBox(height: 12.h),
                    _buildTextField(
                      controller: cubit.nameController,
                      hint: 'أحمد حامد',
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: Color(0xFF8E8E93),
                        size: 20.sp,
                      ),
                    ),

                    SizedBox(height: 16.h),

                    // ── رقم الهاتف ────────────────────────────────────
                    _buildLabel('رقم الهاتف *'),
                    SizedBox(height: 12.h),
                    _buildTextField(
                      controller: cubit.phoneController,
                      hint: '+20 10 1234567',
                      keyboardType: TextInputType.phone,
                      prefixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Egyptian flag emoji rendered as text
                          Text(
                            '🇪🇬',
                            style: TextStyles.textStyleNormal10.copyWith(
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Container(
                            width: 1.w,
                            height: 18.h,
                            color: const Color(0xFF8E8E93),
                          ),
                          SizedBox(width: 8.w),
                        ],
                      ),
                    ),

                    SizedBox(height: 16.h),

                    // ── البريد الإلكتروني ─────────────────────────────
                    _buildLabel('البريد الإلكتروني *'),
                    SizedBox(height: 12.h),
                    _buildTextField(
                      controller: cubit.emailController,
                      hint: 'example@mail.com',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color(0xFF8E8E93),
                        size: 20.sp,
                      ),
                    ),

                    SizedBox(height: 16.h),

                    // ── الرسالة ───────────────────────────────────────
                    _buildLabel('الرسالة'),
                    SizedBox(height: 6.h),
                    _buildMessageField(),

                    SizedBox(height: 16.h),

                    // ── Send Button ───────────────────────────────────
                    SizedBox(
                      width: double.infinity,
                      height: 50.h,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryDark,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'إرسال',
                          style: TextStyles.textStyleBold14.copyWith(
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 24.h),

                    // ── Social Section Label ──────────────────────────
                    Text(
                      'قنوات التواصل الاجتماعي',
                      style: TextStyles.textStyleNormal10.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),

                    SizedBox(height: 16.h),

                    // ── Social Icons Row 1: LinkedIn, X, YouTube, Facebook ──
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSocialIcon(
                          onTap:  () => cubit.openLink(links.linkedin!),
                          child: _LinkedInIcon()),
                        SizedBox(width: 12.w),
                        _buildSocialIcon(onTap:  () => cubit.openLink(links.twitter!),child: _XIcon()),
                        SizedBox(width: 12.w),
                        _buildSocialIcon(onTap:  () => cubit.openLink(links.youtube!),child: _YouTubeIcon()),
                        SizedBox(width: 12.w),
                        _buildSocialIcon(onTap:  () => cubit.openLink(links.facebook!),child: _FacebookIcon()),
                      ],
                    ),

                    SizedBox(height: 12.h),

                    // ── Social Icons Row 2: TikTok, WhatsApp, Instagram, Telegram ──
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSocialIcon(onTap:  () => cubit.openLink(links.whatsapp!),child: _TikTokIcon()),
                        SizedBox(width: 12.w),
                        _buildSocialIcon(onTap:  () => cubit.openLink(links.whatsapp!),child: _WhatsAppIcon()),
                        SizedBox(width: 12.w),
                        _buildSocialIcon(onTap:  () => cubit.openLink(links.instagram!),child: _InstagramIcon()),
                        SizedBox(width: 12.w),
                        _buildSocialIcon(onTap:  () => cubit.openLink(links.whatsapp!),child: _TelegramIcon()),
                      ],
                    ),

                    SizedBox(height: 30.h),

                    // ── Bottom indicator ──────────────────────────────
                    Center(
                      child: Container(
                        width: 120.w,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(2.r),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // ── Helpers ────────────────────────────────────────────────────────────────

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyles.textStyleNormal14.copyWith(fontWeight: .w600),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    Widget? prefixIcon,
  }) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: const Color.fromARGB(255, 238, 238, 245),
          width: 1,
        ),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        style: TextStyles.textStyleNormal10.copyWith(fontSize: 14.sp),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyles.textStyleNormal10.copyWith(fontSize: 14.sp),
          prefixIcon: prefixIcon != null
              ? Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 4.w),
                  child: prefixIcon,
                )
              : null,
          suffixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 14.w,
            vertical: 14.h,
          ),
          border: InputBorder.none,
          isDense: true,
        ),
      ),
    );
  }

  Widget _buildMessageField() {
    return Container(
      height: 110.h,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: const Color.fromARGB(255, 238, 238, 245),
          width: 1,
        ),
      ),
      child: TextField(
        controller: context.read<SocialLinksCubit>().messageController,
        maxLines: null,
        expands: true,
        textAlignVertical: TextAlignVertical.top,
        textDirection: TextDirection.rtl,
        style: TextStyles.textStyleNormal10.copyWith(fontSize: 14.sp),
        decoration: InputDecoration(
          hintText: 'اكتب رسالة لتحقيق اي ما تريده او مشكلة تواجهها',
          hintStyle: TextStyles.textStyleNormal10.copyWith(fontSize: 14.sp),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 14.w,
            vertical: 14.h,
          ),
          border: InputBorder.none,
          isDense: true,
        ),
      ),
    );
  }

  Widget _buildSocialIcon({ 
    required Function() onTap,
    required Widget child}) {
    return InkWell(
      onTap: onTap,
      // child: Container(
      //   width: 55.w,
      // height: 55.h,
      // decoration: BoxDecoration(
      //   color: Colors.transparent,
      //   borderRadius: BorderRadius.circular(12.r),
      //   border: Border.all(
      //     color: const Color.fromARGB(255, 198, 198, 201),
      //     width: 1,
      //   ),
      // ),
      child: child,
      // ),
    );
  }
}

// ─── Social Icon Painters ────────────────────────────────────────────────────

// LinkedIn
class _LinkedInIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppImage(image: linked, fit: BoxFit.fill, width: 55.w, height: 55.h);
    // Replace with SvgPicture or Image.asset for exact branding
  }
}

// X (Twitter)
class _XIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppImage(image: x, fit: BoxFit.fill, width: 55.w, height: 55.h);
  }
}

// YouTube
class _YouTubeIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppImage(
      image: youtube,
      fit: BoxFit.fill,
      width: 55.w,
      height: 55.h,
    );
  }
}

// Facebook
class _FacebookIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppImage(
      image: facebook,
      fit: BoxFit.fill,
      width: 55.w,
      height: 55.h,
    );
  }
}

// TikTok
class _TikTokIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppImage(image: tik, fit: BoxFit.fill, width: 55.w, height: 55.h);
  }
}

// WhatsApp
class _WhatsAppIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppImage(image: whats, fit: BoxFit.fill, width: 55.w, height: 55.h);
  }
}

// Instagram
class _InstagramIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppImage(image: insta, fit: BoxFit.fill, width: 55.w, height: 55.h);
  }
}

// Telegram
class _TelegramIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppImage(image: tele, fit: BoxFit.fill, width: 55.w, height: 55.h);
  }
}
