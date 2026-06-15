import 'dart:io';
import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/screens.dart';
import 'package:drug_flow/core/constants/spacing.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/cubit/profile/profile_cubit.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/cubit/profile/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          state.whenOrNull(
            deleteSuccess: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('تم حذف الحساب بنجاح'),
                  backgroundColor: Colors.green,
                ),
              );
              context.go(loginSc);
            },
            error: (msg) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(msg), backgroundColor: Colors.red),
              );
            },
          );
        },
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            final cubit = context.read<ProfileCubit>();
            final profile = cubit.profile;

            final isLoading = state.maybeWhen(
              loading: () => true,
              orElse: () => false,
            );

            return SafeArea(
              child: Column(
                children: [
                  // APP BAR
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back),
                        ),
                        Text(
                          "البيانات الشخصية",
                          style: TextStyles.textStyleBold16,
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () async {
                            await context.push(
                              editProfileSc,
                              extra: context.read<ProfileCubit>(),
                            );
                            if (context.mounted) {
                              context
                                  .read<ProfileCubit>()
                                  .getProfile(); // fresh data → BlocBuilder rebuilds
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 6.h,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.edit, size: 16.sp),
                                horizontalSpace(6),
                                Text(
                                  "تعديل",
                                  style: TextStyles.textStyleNormal10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: profile == null
                        ? const Center(child: CircularProgressIndicator())
                        : SingleChildScrollView(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: CircleAvatar(
                                    radius: 50.r,
                                    backgroundImage: profile.image != null
                                        ? NetworkImage(profile.image!)
                                        : null,
                                  ),
                                ),

                                // SizedBox(height: 24.h),
                                _InfoField("اسم الصيدلية", profile.name),
                                _InfoField("البريد الإلكتروني", profile.email),
                                _InfoField("رقم الهاتف", profile.phone),
                                _InfoField("رقم آخر", profile.secondPhone),
                                _InfoField("الهاتف الأرضي", profile.landline),
                                _InfoField(
                                  "كود الصيدلية",
                                  profile.pharmacyCode,
                                ),
                                _InfoField("المحافظة", profile.governorate),
                                _InfoField("المدينة", profile.city),
                                _InfoField("المنطقة", profile.area),
                                _InfoField(
                                  "العنوان",
                                  profile.address,
                                  maxLines: 3,
                                ),

                                SizedBox(height: 30.h),

                                SizedBox(
                                  width: double.infinity,
                                  height: 52.h,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xffF53D6B),
                                    ),
                                    onPressed: isLoading
                                        ? null
                                        : () => _confirmDelete(context),
                                    child: const Text(
                                      "حذف الحساب",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                verticalSpace(50),
                              ],
                            ),
                          ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  /// ✅ BottomSheet delete account
  void _confirmDelete(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(width: 40, height: 4, color: Colors.grey[300]),
              SizedBox(height: 20.h),

              const Icon(
                Icons.delete_forever,
                color: Color(0xffF53D6B),
                size: 50,
              ),

              SizedBox(height: 10.h),
              const Text("هل أنت متأكد من حذف الحساب؟"),

              SizedBox(height: 20.h),

              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "إلغاء",
                        style: TextStyles.textStyleBold14.copyWith(
                          fontWeight: .w600,
                          color: Color(0xffF53D6B),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffF53D6B),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        context.read<ProfileCubit>().deleteAccount();
                      },
                      child: Text(
                        "تأكيد",
                        style: TextStyles.textStyleBold14.copyWith(
                          fontWeight: .w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Info widget
class _InfoField extends StatelessWidget {
  final String label;
  final String? value;
  final int maxLines;

  const _InfoField(this.label, this.value, {this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    if (value == null || value!.isEmpty) return const SizedBox();

    return Padding(
      padding: EdgeInsets.only(bottom: 14.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          SizedBox(height: 6.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: colorF7F7F8,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(value!),
          ),
        ],
      ),
    );
  }
}
