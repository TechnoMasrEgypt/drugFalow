import 'dart:io';

import 'package:drug_flow/core/constants/appRegx.dart';
import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/images.dart';
import 'package:drug_flow/core/constants/screens.dart';
import 'package:drug_flow/core/localization/lang_keys.dart';
import 'package:drug_flow/core/utils/helpers.dart';
import 'package:drug_flow/core/widgets/custom_button.dart';
import 'package:drug_flow/core/widgets/custom_text_field.dart';
import 'package:drug_flow/features/Auths/auth/presentation/widgets/address_text_field.dart';
import 'package:drug_flow/features/Auths/auth/presentation/widgets/intl_phone_form_field.dart';
import 'package:drug_flow/features/Auths/auth/presentation/widgets/upload_item_widget.dart';
import 'package:drug_flow/features/Auths/onboarding/presentation/widgets/onboarding_app_bar.dart';
import 'package:drug_flow/features/Auths/register/logic/governorate/governorate_cubit.dart';
import 'package:drug_flow/features/Auths/register/logic/register_cubit.dart';
import 'package:drug_flow/features/Auths/register/logic/register_state.dart';
import 'package:drug_flow/features/Auths/register/ui/location_drop_down_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constants/styles.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  File? selectedImage; // pharmacy storefront
  File? selectedImage2; // license document

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    context.read<GovernorateCubit>().fetchGovernorates();
  }

  Future<void> _pickPharmacyImage() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    if (file != null) setState(() => selectedImage = File(file.path));
  }

  Future<void> _pickLicenseImage() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    if (file != null) setState(() => selectedImage2 = File(file.path));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<RegisterCubit, RegisterState>(
          listener: (context, state) {
            state.whenOrNull(
              success: (response) {
                // Show the server message (e.g. "تم بنجاح")
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(response.message),
                    backgroundColor: Colors.green,
                  ),
                );
                // Navigate to OTP screen — pass email so it can be displayed
                // and used for resend-code requests.
                context.push(login);
              },
              error: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message), backgroundColor: Colors.red),
                );
              },
            );
          },
        ),
      ],
      child: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          final cubit = context.read<RegisterCubit>();

          return SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: white,
              body: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: context.width / 20),
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: context.height / 30),
                        OnboardingAppBar(showBackButton: true),
                        SizedBox(height: context.height / 30),

                        // ── Title ──
                        Text(
                          context.translate(LangKeys.welcomeToDrugFlow),
                          style: TextStyles.textStyleBold24.copyWith(
                            color: color121217,
                          ),
                          textScaler: TextScaler.linear(1),
                        ),
                        SizedBox(height: context.height / 30),

                        // ── Subtitle ──
                        Text(
                          context.translate(LangKeys.pharmacyInfoMessage),
                          style: TextStyles.textStyleNormal12.copyWith(
                            color: color6C6C89,
                          ),
                          textScaler: TextScaler.linear(1),
                        ),
                        SizedBox(height: context.height / 30),

                        // ── Pharmacy image ──
                        UploadItemWidget(
                          onTap: _pickPharmacyImage,
                          img: camera,
                          title: context.translate(LangKeys.pharmacyImage),
                          description: context.translate(
                            LangKeys.uploadPharmacyImageHint,
                          ),
                        ),
                        if (selectedImage != null) ...[
                          SizedBox(height: context.height / 60),
                          _SelectedImagePreview(file: selectedImage!),
                        ],
                        SizedBox(height: context.height / 30),

                        // ── License image ──
                        UploadItemWidget(
                          onTap: _pickLicenseImage,
                          img: camera,
                          title: context.translate(LangKeys.licenseImage),
                          description: context.translate(
                            LangKeys.uploadLicenseImageHint,
                          ),
                        ),
                        if (selectedImage2 != null) ...[
                          SizedBox(height: context.height / 60),
                          _SelectedImagePreview(file: selectedImage2!),
                        ],
                        SizedBox(height: context.height / 30),

                        // ── Pharmacy name ──
                        CustomTextField(
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 4) {
                              return context.translate(
                                LangKeys.validPharmacyName,
                              );
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
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 4) {
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
                              return context.translate(
                                LangKeys.validPhoneNumber,
                              );
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
                          controller: cubit.phone2Controller,
                          hintTxt: '1012345678',
                          type: 'phone',
                          obscure: false,
                          validator: (_) => null,
                          textInputType: TextInputType.number,
                          title: context.translate(LangKeys.anotherPhoneNumber),
                        ),
                        SizedBox(height: context.height / 40),

                        // ── Landline (optional) ──
                        IntlPhoneFormField(
                          countryCodeController: cubit.countryCode3Controller,
                          controller: cubit.phone3Controller,
                          hintTxt: '0212345678',
                          type: 'phone',
                          obscure: false,
                          validator: (_) => null,
                          textInputType: TextInputType.number,
                          title: context.translate(LangKeys.landlinePhone),
                        ),
                        SizedBox(height: context.height / 50),

                        // ── Governorate ──
                        const GovernorateDropDown(),
                        SizedBox(height: context.height / 35),

                        // ── City ──
                        const CityDropDown(),
                        SizedBox(height: context.height / 35),

                        // ── Area ──
                        const AreaDropDown(),
                        SizedBox(height: context.height / 30),

                        // ── Detailed address ──
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

                        // ── Password ──
                        CustomTextField(
                          controller: cubit.passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return context.translate(LangKeys.validPasswrod);
                            }
                            return null;
                          },
                          obscure: true,
                          hintTxt: '*******',
                          svgIcon: knock,
                          textInputType: TextInputType.visiblePassword,
                          title: context.translate(LangKeys.password),
                        ),
                        SizedBox(height: context.height / 25),

                        // ── Confirm password ──
                        CustomTextField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return context.translate(LangKeys.validPasswrod);
                            }
                            if (value != cubit.passwordController.text) {
                              return context.translate(
                                LangKeys.passwordsDoNotMatch,
                              );
                            }
                            return null;
                          },
                          controller: cubit.confirmPasswordController,
                          obscure: true,
                          hintTxt: '*******',
                          svgIcon: knock,
                          textInputType: TextInputType.visiblePassword,
                          title: context.translate(LangKeys.confirmPassword),
                        ),
                        SizedBox(height: context.height / 20),

                        // ── Terms & Conditions ──
                        _TermsCheckbox(
                          accepted: cubit.termsAccepted,
                          onChanged: cubit.toggleTerms,
                        ),
                        SizedBox(height: context.height / 30),

                        // ── Submit button ──
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(
                            horizontal: context.width / 20,
                          ),
                          child: state.maybeWhen(
                            loading: () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            orElse: () => CustomButton(
                              btnTitle: context.translate(
                                LangKeys.createAccount,
                              ),
                              onPressed: () => _onSubmit(context, cubit),
                            ),
                          ),
                        ),
                        SizedBox(height: context.height / 18),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // ── Submit logic ──────────────────────────────────────────────────────────
  void _onSubmit(BuildContext context, RegisterCubit cubit) {
    // 1. Validate all form fields
    if (!cubit.formKey.currentState!.validate()) return;

    // 2. Passwords match
    if (cubit.passwordController.text != cubit.confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.translate(LangKeys.passwordsDoNotMatch)),
        ),
      );
      return;
    }

    // 3. Pharmacy image required
    if (selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.translate(LangKeys.uploadPharmacyImageHint)),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // 4. License image required
    if (selectedImage2 == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.translate(LangKeys.uploadLicenseImageHint)),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // 5. Terms accepted
    if (!cubit.termsAccepted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.translate(LangKeys.mustAcceptTerms)),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // 6. Location selected
    final govCubit = context.read<GovernorateCubit>();
    if (govCubit.selectedGovernorate == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('يرجى اختيار المحافظة')));
      return;
    }
    if (govCubit.selectedCity == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('يرجى اختيار المدينة')));
      return;
    }
    if (govCubit.selectedArea == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('يرجى اختيار المنطقة')));
      return;
    }

    // 6. Fire
    cubit.registerState(
      governorateId: govCubit.selectedGovernorate!.id,
      cityId: govCubit.selectedCity!.id,
      areaId: govCubit.selectedArea!.id,
      pharmacyImage: selectedImage,
      licenseImage: selectedImage2,
    );
  }
}

// ── Terms checkbox ────────────────────────────────────────────────────────────

class _TermsCheckbox extends StatelessWidget {
  final bool accepted;
  final ValueChanged<bool?> onChanged;

  const _TermsCheckbox({required this.accepted, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!accepted),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
              value: accepted,
              onChanged: onChanged,
              activeColor: primaryDark,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyles.textStyleNormal12.copyWith(
                  color: color6C6C89,
                ),
                children: [
                  TextSpan(text: '${context.translate(LangKeys.iAgreeToThe)} '),
                  TextSpan(
                    text: context.translate(LangKeys.termsAndConditions),
                    style: TextStyles.textStyleNormal12.copyWith(
                      color: primaryDark,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Image preview ─────────────────────────────────────────────────────────────

class _SelectedImagePreview extends StatelessWidget {
  final File file;
  const _SelectedImagePreview({required this.file});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.file(
        file,
        height: context.height / 8,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
