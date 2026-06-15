import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/images.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/utils/network_images.dart';
import 'package:drug_flow/features/Home_sction/profile/data/contact_request.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/cubit/contact_us/contact_us_cubit.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/cubit/contact_us/contact_us_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialLinksCubit, SocialLinksState>(
      listener: (context, state) {
        if (state is ContactUsSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('تم إرسال الرسالة بنجاح')),
          );
        }
        if (state is ContactUsError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        final cubit = context.read<SocialLinksCubit>();

        // Safely get links only when state has data
        final links = state is SocialLinksSuccess
            ? (state as SocialLinksSuccess).data
            : null;

        final isLoading = state is SocialLinksLoading;

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

                    // ── Title Row ──────────────────────────────────────────
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

                    // ── الاسم ──────────────────────────────────────────────
                    _buildLabel('الاسم'),
                    SizedBox(height: 12.h),
                    _buildTextField(
                      controller: cubit.nameController,
                      hint: 'أحمد حامد',
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: const Color(0xFF8E8E93),
                        size: 20.sp,
                      ),
                    ),

                    SizedBox(height: 16.h),

                    // ── رقم الهاتف ─────────────────────────────────────────
                    _buildLabel('رقم الهاتف *'),
                    SizedBox(height: 12.h),
                    _buildTextField(
                      controller: cubit.phoneController,
                      hint: '+20 10 1234567',
                      keyboardType: TextInputType.phone,
                      prefixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
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

                    // ── البريد الإلكتروني ──────────────────────────────────
                    _buildLabel('البريد الإلكتروني *'),
                    SizedBox(height: 12.h),
                    _buildTextField(
                      controller: cubit.emailController,
                      hint: 'example@mail.com',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icon(
                        Icons.email,
                        color: const Color(0xFF8E8E93),
                        size: 20.sp,
                      ),
                    ),

                    SizedBox(height: 16.h),

                    // ── الرسالة ────────────────────────────────────────────
                    _buildLabel('الرسالة'),
                    SizedBox(height: 6.h),
                    _buildMessageField(cubit),

                    SizedBox(height: 16.h),

                    // ── Send Button ────────────────────────────────────────
                    SizedBox(
                      width: double.infinity,
                      height: 50.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryDark,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        onPressed: isLoading
                            ? null
                            : () {
                                cubit.contactUs(
                                  ContactRequest(
                                    name: cubit.nameController.text,
                                    phone: cubit.phoneController.text,
                                    email: cubit.emailController.text,
                                    message: cubit.messageController.text,
                                  ),
                                );
                              },
                        child: isLoading
                            ? const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Text('إرسال'),
                      ),
                    ),

                    SizedBox(height: 24.h),

                    // ── Social Section Label ───────────────────────────────
                    Text(
                      'قنوات التواصل الاجتماعي',
                      style: TextStyles.textStyleNormal10.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),

                    SizedBox(height: 16.h),

                    // Show social icons only when links are available
                    if (links != null) ...[
                      // ── Social Icons Row 1: LinkedIn, X, YouTube, Facebook ──
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildSocialIcon(
                            onTap: () => cubit.openLink(links.linkedin ?? ''),
                            child: const _LinkedInIcon(),
                          ),
                          SizedBox(width: 12.w),
                          _buildSocialIcon(
                            onTap: () => cubit.openLink(links.twitter ?? ''),
                            child: const _XIcon(),
                          ),
                          SizedBox(width: 12.w),
                          _buildSocialIcon(
                            onTap: () => cubit.openLink(links.youtube ?? ''),
                            child: const _YouTubeIcon(),
                          ),
                          SizedBox(width: 12.w),
                          _buildSocialIcon(
                            onTap: () => cubit.openLink(links.facebook ?? ''),
                            child: const _FacebookIcon(),
                          ),
                        ],
                      ),

                      SizedBox(height: 12.h),

                      // ── Social Icons Row 2: TikTok, WhatsApp, Instagram, Telegram ──
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildSocialIcon(
                            onTap: () => cubit.openLink(links.facebook ?? ''),
                            child: const _TikTokIcon(),
                          ),
                          SizedBox(width: 12.w),
                          _buildSocialIcon(
                            onTap: () => cubit.openLink(links.whatsapp ?? ''),
                            child: const _WhatsAppIcon(),
                          ),
                          SizedBox(width: 12.w),
                          _buildSocialIcon(
                            onTap: () => cubit.openLink(links.instagram ?? ''),
                            child: const _InstagramIcon(),
                          ),
                          SizedBox(width: 12.w),
                          _buildSocialIcon(
                            onTap: () => cubit.openLink(links.facebook ?? ''),
                            child: const _TelegramIcon(),
                          ),
                        ],
                      ),
                    ] else ...[
                      // Show shimmer/placeholder while loading social links
                      const Center(child: CircularProgressIndicator()),
                    ],

                    SizedBox(height: 30.h),

                    // ── Bottom indicator ───────────────────────────────────
                    Center(
                      child: Container(
                        width: 120.w,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.15),
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

  // ── Helpers ──────────────────────────────────────────────────────────────────

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyles.textStyleNormal14.copyWith(fontWeight: FontWeight.w600),
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: const Color(0xFFEEEEF5), width: 1),
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
          prefixIconConstraints: const BoxConstraints(
            minWidth: 0,
            minHeight: 0,
          ),
          suffixIconConstraints: const BoxConstraints(
            minWidth: 0,
            minHeight: 0,
          ),
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

  Widget _buildMessageField(SocialLinksCubit cubit) {
    return Container(
      height: 110.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: const Color(0xFFEEEEF5), width: 1),
      ),
      child: TextField(
        controller: cubit.messageController,
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
    required VoidCallback onTap,
    required Widget child,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: child,
    );
  }
}

// ─── Social Icon Widgets ──────────────────────────────────────────────────────

class _LinkedInIcon extends StatelessWidget {
  const _LinkedInIcon();
  @override
  Widget build(BuildContext context) =>
      AppImage(image: linked, fit: BoxFit.fill, width: 55.w, height: 55.h);
}

class _XIcon extends StatelessWidget {
  const _XIcon();
  @override
  Widget build(BuildContext context) =>
      AppImage(image: x, fit: BoxFit.fill, width: 55.w, height: 55.h);
}

class _YouTubeIcon extends StatelessWidget {
  const _YouTubeIcon();
  @override
  Widget build(BuildContext context) =>
      AppImage(image: youtube, fit: BoxFit.fill, width: 55.w, height: 55.h);
}

class _FacebookIcon extends StatelessWidget {
  const _FacebookIcon();
  @override
  Widget build(BuildContext context) =>
      AppImage(image: facebook, fit: BoxFit.fill, width: 55.w, height: 55.h);
}

class _TikTokIcon extends StatelessWidget {
  const _TikTokIcon();
  @override
  Widget build(BuildContext context) =>
      AppImage(image: tik, fit: BoxFit.fill, width: 55.w, height: 55.h);
}

class _WhatsAppIcon extends StatelessWidget {
  const _WhatsAppIcon();
  @override
  Widget build(BuildContext context) =>
      AppImage(image: whats, fit: BoxFit.fill, width: 55.w, height: 55.h);
}

class _InstagramIcon extends StatelessWidget {
  const _InstagramIcon();
  @override
  Widget build(BuildContext context) =>
      AppImage(image: insta, fit: BoxFit.fill, width: 55.w, height: 55.h);
}

class _TelegramIcon extends StatelessWidget {
  const _TelegramIcon();
  @override
  Widget build(BuildContext context) =>
      AppImage(image: tele, fit: BoxFit.fill, width: 55.w, height: 55.h);
}
