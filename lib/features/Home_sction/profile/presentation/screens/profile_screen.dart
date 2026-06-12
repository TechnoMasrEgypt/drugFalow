import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/exts.dart';
import 'package:drug_flow/core/constants/images.dart';
import 'package:drug_flow/core/constants/screens.dart';
import 'package:drug_flow/core/constants/spacing.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/injection_container/injection_container.dart';
import 'package:drug_flow/core/utils/network_images.dart';
import 'package:drug_flow/core/widgets/image_handler.dart';
import 'package:drug_flow/features/Auths/onboarding/presentation/widgets/onboarding_app_bar.dart';
import 'package:drug_flow/features/Auths/register/logic/governorate/governorate_cubit.dart';
import 'package:drug_flow/features/Auths/register/logic/register_cubit.dart';
import 'package:drug_flow/features/Home_sction/bottom_bar/presentation/widgets/home_app_bar.dart';
import 'package:drug_flow/features/Home_sction/orders/presentation/screens/orders_screen.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/cubit/profile/profile_cubit.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/cubit/profile/profile_state.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/screens/contact_us_screen.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/screens/coupons_screen.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/screens/faqs_screen.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/screens/personal_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          final cubit = context.read<ProfileCubit>();
          final profile = cubit.profile;
          print(
            'Returned dataaaaaa ${profile?.address} ${profile?.email} ${profile?.name}',
          );
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  const SizedBox(height: 10),

                  /// Head

                  /// User Card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 14,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 247, 242, 242),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        AppImage(
                          image: profile?.image ?? ware2,
                          height: 64.h,
                          width: 64.w,
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                        horizontalSpace(8),
                        Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text(
                              profile?.name ?? 'اسم الصديدلية',
                              style: TextStyles.textStyleBold14.copyWith(
                                fontWeight: .w600,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "${profile?.pharmacyCode ?? ''} / ${profile?.phone ?? ''}",
                              style: TextStyles.textStyleBold12.copyWith(
                                fontWeight: .w400,
                                color: AppColor.greyText,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _sectionCard(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  context.push(
                                    personalInfoSc,
                                    extra: context.read<ProfileCubit>(),
                                  );
                                },
                                child: _MenuItem(
                                  image: useer,
                                  title: 'البيانات الشخصية',
                                ),
                              ),
                              _MenuItem(image: passw, title: 'كلمة المرور'),
                              GestureDetector(
                                onTap: () {
                                  context.push(ordersSc);
                                },
                                child: _MenuItem(image: box, title: 'طلباتي'),
                              ),
                              GestureDetector(
                                onTap: () {
                                  context.push(cuoponSc);
                                },
                                child: _MenuItem(
                                  image: ticket,
                                  title: ' كوبونات الخصم ',
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 12.h),

                          _sectionCard(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    backgroundColor: Colors.transparent,
                                    builder: (_) => const LanguageBottomSheet(),
                                  );
                                },
                                child: _MenuItem(
                                  image: glob,
                                  title: 'اللغة',
                                  trailing: 'العربية',
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  context.push(faqsSc);
                                },
                                child: _MenuItem(
                                  image: ques,
                                  title: 'الاسئلة الشائعة ',
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  context.push(contactUsSc);
                                },
                                child: _MenuItem(
                                  image: hedp,
                                  title: 'تواصل معنا',
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 12),

                          _sectionCard(
                            children: const [
                              _MenuItem(image: file, title: 'الشروط والأحكام'),
                              _MenuItem(image: file, title: 'سياسة الخصوصية'),
                              _MenuItem(image: file, title: 'سياسة الاسترجاع'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  /// Logout Button
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {
                        context.push(loginSc);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffF53D6B),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: .center,
                        children: [
                          AppImage(image: arrow),
                          horizontalSpace(7.5),
                          Text(
                            'تسجيل خروج',
                            style: TextStyles.textStyleBold14.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      //   child: ImageHandler(image: arrow, width: 24, height: 24),
                      //  Text(
                      //     'تسجيل خروج',
                      //     style: TextStyles.textStyleBold14.copyWith(
                      //       color: Colors.white,
                      //       fontWeight: FontWeight.w600,
                      //     ),
                      //   ),
                    ),
                  ),

                  SizedBox(height: 12.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _sectionCard({String? title, required List<Widget> children}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffE9E9E9)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  const Icon(
                    Icons.person_outline,
                    size: 18,
                    color: Color(0xff0097A7),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ...children,
        ],
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final String image;
  final String title;
  final String? trailing;

  const _MenuItem({required this.image, required this.title, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          AppImage(image: image, width: 16.w, height: 16.h),
          horizontalSpace(10.w),
          Expanded(
            child: Text(
              title,
              style: TextStyles.textStyleBold14.copyWith(fontWeight: .w600),
            ),
          ),
          if (trailing != null)
            Text(
              trailing!,
              style: TextStyles.textStyleBold14.copyWith(
                fontWeight: .w400,
                color: AppColor.greyText,
              ),
            ),
        ],
      ),
    );
  }
}
