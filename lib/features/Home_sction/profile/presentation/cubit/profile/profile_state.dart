import 'package:drug_flow/features/Home_sction/profile/data/get_profile/profile_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = Loading;
  const factory ProfileState.success(ProfileData data) = _Success;
  const factory ProfileState.error(String message) = _Error;
  const factory ProfileState.deleteSuccess() = DeleteSuccess; // ← new

  const factory ProfileState.updateSuccess(ProfileData data) = UpdateSuccess;
  const factory ProfileState.updateloading() = EpLoading;

  const factory ProfileState.logoutLoading() = LogoutLoading;

  const factory ProfileState.logoutSuccess(String message) = LogoutSuccess;

  const factory ProfileState.logoutError(String message) = LogoutError;
}
