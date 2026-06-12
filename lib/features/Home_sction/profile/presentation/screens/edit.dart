import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import 'package:drug_flow/features/Home_sction/profile/data/models/update_profile_request_body.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/cubit/profile/profile_cubit.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/cubit/profile/profile_state.dart';
import 'package:drug_flow/core/constants/colors.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File? selectedImage;
  File? selectedLicense;

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();

    final cubit = context.read<ProfileCubit>();
    if (cubit.profile != null) {
      cubit.setProfile(cubit.profile!);
    }
  }

  Future<void> pickImage(bool isLicense) async {
    final file = await _picker.pickImage(source: ImageSource.gallery);
    if (file == null) return;

    setState(() {
      if (isLicense) {
        selectedLicense = File(file.path);
      } else {
        selectedImage = File(file.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        state.whenOrNull(
          updateSuccess: (_) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("تم التحديث بنجاح")));
            Navigator.pop(context);
          },
          error: (msg) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(msg)));
          },
        );
      },
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          final cubit = context.read<ProfileCubit>();
          final isLoading = state.maybeWhen(
            loading: () => true,
            orElse: () => false,
          );

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(title: const Text("تعديل البيانات")),
            body: SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  /// ================= IMAGE =================
                  GestureDetector(
                    onTap: () => pickImage(false),
                    child: CircleAvatar(
                      radius: 50.r,
                      backgroundColor: colorF7F7F8,
                      backgroundImage: selectedImage != null
                          ? FileImage(selectedImage!)
                          : (cubit.profile?.image != null
                                    ? NetworkImage(cubit.profile!.image!)
                                    : null)
                                as ImageProvider?,
                    ),
                  ),

                  SizedBox(height: 20.h),

                  GestureDetector(
                    onTap: () => pickImage(true),
                    child: Container(
                      height: 120.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: colorF7F7F8,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          selectedLicense != null
                              ? "تم اختيار رخصة"
                              : "اضغط لرفع الرخصة",
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h),

                  /// ================= FIELDS =================
                  _field(cubit.pharmacyController, "اسم الصيدلية"),
                  _field(cubit.mailController, "الإيميل"),
                  _field(cubit.phoneController, "الهاتف"),
                  _field(cubit.secondPhoneController, "هاتف آخر"),
                  _field(cubit.landlineController, "أرضي"),
                  _field(cubit.addressController, "العنوان"),

                  SizedBox(height: 30.h),

                  /// ================= BUTTON =================
                  SizedBox(
                    width: double.infinity,
                    height: 50.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff4A90E2),
                      ),
                      onPressed: isLoading
                          ? null 
                          : () {
                              context.read<ProfileCubit>().updateProfile(
                                UpdateProfileRequestBody(
                                  name: cubit.pharmacyController.text,
                                  email: cubit.mailController.text,
                                  phone: cubit.phoneController.text,
                                  secondPhone: cubit.secondPhoneController.text,
                                  landline: cubit.landlineController.text,
                                  address: cubit.addressController.text,
                                  image: selectedImage,
                                  license: selectedLicense,
                                ),
                              );
                            },
                      child: isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                              "حفظ التعديلات",
                              style: TextStyle(color: Colors.white),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _field(TextEditingController c, String label) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: TextField(
        controller: c,
        decoration: InputDecoration(labelText: label),
      ),
    );
  }
}
