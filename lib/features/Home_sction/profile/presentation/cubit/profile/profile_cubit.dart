import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:drug_flow/core/networking/api_result.dart';
import 'package:drug_flow/features/Home_sction/profile/data/get_profile/profile_response.dart';
import 'package:drug_flow/features/Home_sction/profile/data/logic/profile_repo.dart';
import 'package:drug_flow/features/Home_sction/profile/data/models/update_profile_request_body.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _repo;

  ProfileCubit(this._repo) : super(const ProfileState.initial());

  ProfileData? profile;

  // ─────────────────────────────
  // Controllers
  // ─────────────────────────────
  final pharmacyController = TextEditingController();
  final mailController = TextEditingController();
  final phoneController = TextEditingController();
  final secondPhoneController = TextEditingController();
  final landlineController = TextEditingController();
  final addressController = TextEditingController();

  final TextEditingController countryCodeController = TextEditingController(
    text: '+20',
  );
  final TextEditingController countryCode2Controller = TextEditingController(
    text: '+20',
  );
  final TextEditingController countryCode3Controller = TextEditingController(
    text: '+20',
  );
  // ─────────────────────────────
  // Get Profile
  // ─────────────────────────────
  Future<void> getProfile() async {
    emit(const ProfileState.loading());

    final result = await _repo.getProfile();

    result.when(
      success: (data) {
        profile = data;

        setProfile(data);

        emit(ProfileState.success(data));
      },
      failure: (error) {
        emit(ProfileState.error(error.apiErrorModel.message ?? 'Error'));
      },
    );
  }

  // ─────────────────────────────
  // Set Controllers Data
  // ─────────────────────────────
  void setProfile(ProfileData data) {
    pharmacyController.text = data.name ?? '';
    mailController.text = data.email ?? '';
    phoneController.text = data.phone ?? '';
    secondPhoneController.text = data.secondPhone ?? '';
    landlineController.text = data.landline ?? '';
    addressController.text = data.address ?? '';
    data.city?.toString();
    data.area?.toString();
    data.governorate.toString();
  }

  // ─────────────────────────────
  // Update Profile
  // ─────────────────────────────
  Future<void> updateProfile(UpdateProfileRequestBody body) async {
    emit(const ProfileState.loading());

    final result = await _repo.updateProfile(body);

    result.when(
      success: (data) async {
        profile = data.data;

        emit(ProfileState.updateSuccess(profile!));
        // await getProfile();
      },
      failure: (error) {
        debugPrint(error.apiErrorModel.message);
        emit(ProfileState.error(error.apiErrorModel.message ?? 'Error'));
      },
    );
  }

  // ─────────────────────────────
  // Delete Account
  // ─────────────────────────────
  Future<void> deleteAccount() async {
    emit(const ProfileState.loading());

    final result = await _repo.deleteAccount();

    result.when(
      success: (data) {
        if (data.success == true) {
          emit(const ProfileState.deleteSuccess());
        } else {
          emit(ProfileState.error(data.message ?? 'فشل حذف الحساب'));
        }
      },
      failure: (error) {
        emit(ProfileState.error(error.apiErrorModel.message ?? 'Error'));
      },
    );
  }

  // ─────────────────────────────
  // Dispose
  // ─────────────────────────────
  @override
  Future<void> close() {
    pharmacyController.dispose();
    mailController.dispose();
    phoneController.dispose();
    secondPhoneController.dispose();
    landlineController.dispose();
    addressController.dispose();
    return super.close();
  }
}
