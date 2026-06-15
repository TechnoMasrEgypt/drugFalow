import 'dart:io';
import 'package:drug_flow/core/constants/images.dart';
import 'package:drug_flow/core/constants/screens.dart';
import 'package:drug_flow/core/localization/lang_keys.dart';
import 'package:drug_flow/core/utils/helpers.dart';
import 'package:drug_flow/core/widgets/custom_text_field.dart';
import 'package:drug_flow/core/widgets/svg_handler.dart';
import 'package:drug_flow/features/Auths/auth/presentation/widgets/address_text_field.dart';
import 'package:drug_flow/features/Auths/auth/presentation/widgets/intl_phone_form_field.dart';
import 'package:drug_flow/features/Auths/auth/presentation/widgets/upload_item_widget.dart';
import 'package:drug_flow/features/Auths/register/ui/location_drop_down_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:go_router/go_router.dart';
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
            GoRouter.of(context).go(bottomBarSc);
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
                  UploadItemWidget(
                    onTap: () => pickImage(false),
                    img: camera,
                    title: context.translate(LangKeys.pharmacyImage),
                    description: context.translate(
                      LangKeys.uploadPharmacyImageHint,
                    ),
                    imageProvider: selectedImage != null
                        ? FileImage(selectedImage!)
                        : (cubit.profile?.image?.isNotEmpty == true
                              ? NetworkImage(cubit.profile!.image!)
                              : null),
                  ),
                  SizedBox(height: 20.h),
                  UploadItemWidget(
                    onTap: () => pickImage(true),
                    img: camera,
                    title: context.translate(LangKeys.licenseImage),
                    description: context.translate(
                      LangKeys.uploadLicenseImageHint,
                    ),
                    imageProvider: selectedLicense != null
                        ? FileImage(selectedLicense!)
                        : (cubit.profile?.licenseFile?.isNotEmpty == true
                              ? NetworkImage(cubit.profile!.licenseFile!)
                              : null),
                  ),

                  SizedBox(height: 20.h),

                  // ── Pharmacy name ──
                  CustomTextField(
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 4) {
                        return context.translate(LangKeys.validPharmacyName);
                      }
                      return null;
                    },
                    controller: cubit.pharmacyController,
                    obscure: false,
                    hintTxt: context.translate(LangKeys.pharmacyName),
                    svgIcon: pharmacy,
                    textInputType: TextInputType.text,
                    title: context.translate(LangKeys.pharmacyName),
                  ),
                  SizedBox(height: context.height / 30),

                  // ── Email ──
                  CustomTextField(
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 4) {
                        return context.translate(LangKeys.validEmail);
                      }
                      return null;
                    },
                    controller: cubit.mailController,
                    obscure: false,
                    hintTxt: 'example@mail.com',
                    svgIcon: mail,
                    textInputType: TextInputType.emailAddress,
                    title: context.translate(LangKeys.email),
                  ),
                  SizedBox(height: context.height / 30),

                  // ── Phone (required) ──
                  IntlPhoneFormField(
                    countryCodeController: cubit.countryCodeController,
                    controller: cubit.phoneController,
                    hintTxt: '1012345678',
                    type: 'phone',
                    obscure: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return context.translate(LangKeys.validPhoneNumber);
                      }
                      return null;
                    },
                    textInputType: TextInputType.number,
                    title: context.translate(LangKeys.phone),
                  ),
                  SizedBox(height: context.height / 40),

                  // ── Second phone (optional) ──
                  IntlPhoneFormField(
                    countryCodeController: cubit.countryCode2Controller,
                    controller: cubit.secondPhoneController,
                    hintTxt: '1012345678',
                    type: 'phone',
                    obscure: false,
                    validator: (_) => null,
                    textInputType: TextInputType.number,
                    title: context.translate(LangKeys.anotherPhoneNumber),
                  ),
                  SizedBox(height: context.height / 40),

                  // ── Landline (optional) ──
                  CustomTextField(
                    controller: cubit.countryCode3Controller,
                    obscure: false,
                    hintTxt: "2841230",
                    svgIcon: '',
                    textInputType: TextInputType.phone,
                    title: context.translate(LangKeys.landlinePhone),
                  ),

                  SizedBox(height: context.height / 50),

                  AddressTextField(
                    controller: cubit.addressController,
                    obscure: false,
                    hintTxt: context.translate(
                      LangKeys.streetBuildingPlaceholder,
                    ),
                    maxLines: 5,
                    type: 'address',
                    textInputType: TextInputType.text,
                    title: context.translate(LangKeys.detailedAddress),
                    svgIcon: '',
                  ),
                  SizedBox(height: context.height / 30),

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
}
