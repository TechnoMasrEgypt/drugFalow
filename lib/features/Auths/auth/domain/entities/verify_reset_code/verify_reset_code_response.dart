class VerifyResetCodeResponse {
  bool? success;
  String? message;
  Data? data;

  VerifyResetCodeResponse({this.success, this.message, this.data});

  VerifyResetCodeResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? resetToken;
  int? expiresIn;

  Data({this.resetToken, this.expiresIn});

  Data.fromJson(Map<String, dynamic> json) {
    resetToken = json['reset_token'];
    expiresIn = json['expires_in'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['reset_token'] = resetToken;
    data['expires_in'] = expiresIn;
    return data;
  }
}