import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:drug_flow/core/networking/api_result.dart';
import 'package:drug_flow/features/Auths/register/data/register_request_body.dart';
import 'package:drug_flow/features/Auths/register/data/repo/register_repo.dart';
import 'package:drug_flow/features/Auths/register/logic/register_state.dart';
import 'package:flutter/material.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._registerRepo) : super(const RegisterState.initial());

  final RegisterRepo _registerRepo;

  // ── Controllers ──────────────────────────────────────────────────────────
  final TextEditingController pharmacyController        = TextEditingController();
  final TextEditingController mailController            = TextEditingController();
  final TextEditingController phoneController           = TextEditingController();
  final TextEditingController phone2Controller          = TextEditingController();
  final TextEditingController phone3Controller          = TextEditingController();
  final TextEditingController countryCodeController     = TextEditingController(text: '+20');
  final TextEditingController countryCode2Controller    = TextEditingController(text: '+20');
  final TextEditingController countryCode3Controller    = TextEditingController();
  final TextEditingController addressController         = TextEditingController();
  final TextEditingController passwordController        = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  // ── Terms accepted ────────────────────────────────────────────────────────
  bool termsAccepted = false;

  void toggleTerms(bool? value) {
    termsAccepted = value ?? false;
    // Re-emit current state so the UI rebuilds the checkbox
    emit(state);
  }

  // ── Register ──────────────────────────────────────────────────────────────
  Future<void> registerState({
    File? pharmacyImage,
    File? licenseImage,
    required int governorateId,
    required int cityId,
    required int areaId,
  }) async {
    emit(const RegisterState.loading());

    final response = await _registerRepo.registration(
      RegisterRequestBody(
        name:                 pharmacyController.text.trim(),
        email:                mailController.text.trim(),
        password:             passwordController.text.trim(),
        passwordConfirmation: confirmPasswordController.text.trim(),
        phone:                phoneController.text.trim(),
        secondPhone:          phone2Controller.text.trim().isEmpty
                                  ? null
                                  : phone2Controller.text.trim(),
        landline:             phone3Controller.text.trim().isEmpty
                                  ? null
                                  : phone3Controller.text.trim(),
        governorateId:        governorateId,
        cityId:               cityId,
        areaId:               areaId,
        address:              addressController.text.trim(),
        termsAccepted:        termsAccepted,
        // ── Country codes passed separately — repo prepends them ──
        countryCode:          countryCodeController.text.trim(),
        countryCode2:         countryCode2Controller.text.trim().isEmpty
                                  ? null
                                  : countryCode2Controller.text.trim(),
        countryCode3:         countryCode3Controller.text.trim().isEmpty
                                  ? null
                                  : countryCode3Controller.text.trim(),
        image:                pharmacyImage,
        licenseFile:          licenseImage,
      ),
    );

    response.when(
      success: (registerResponse) => emit(RegisterState.success(registerResponse)),
      failure: (error) => emit(RegisterState.error(error: error.apiErrorModel.message ?? '')),
    );
  }

  // ── Dispose ───────────────────────────────────────────────────────────────
  @override
  Future<void> close() {
    pharmacyController.dispose();
    mailController.dispose();
    phoneController.dispose();
    phone2Controller.dispose();
    phone3Controller.dispose();
    countryCodeController.dispose();
    countryCode2Controller.dispose();
    countryCode3Controller.dispose();
    addressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
