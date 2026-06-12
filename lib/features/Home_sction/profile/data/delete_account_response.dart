// lib/features/Home_sction/profile/data/delete_account/delete_account_response.dart

class DeleteAccountResponse {
  final bool? success;
  final String? message;

  const DeleteAccountResponse({this.success, this.message});

  factory DeleteAccountResponse.fromJson(Map<String, dynamic> json) =>
      DeleteAccountResponse(
        success: json['success'] as bool?,
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
      };
}