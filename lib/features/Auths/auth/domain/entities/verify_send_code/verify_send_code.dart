class VerifySendCode {
  bool? success;
  String? message;
  Data? data;

  VerifySendCode({this.success, this.message, this.data});

  VerifySendCode.fromJson(Map<String, dynamic> json) {
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
  String? expiresIn;
  String? code;

  Data({this.expiresIn, this.code});

  Data.fromJson(Map<String, dynamic> json) {
    expiresIn = json['expires_in'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['expires_in'] = expiresIn;
    data['code'] = code;
    return data;
  }
}