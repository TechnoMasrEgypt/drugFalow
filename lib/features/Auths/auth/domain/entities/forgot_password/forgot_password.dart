class ForgotPasswordResponse {
  bool? success;
  String? message;
  Data? data;

  ForgotPasswordResponse({this.success, this.message, this.data});

  ForgotPasswordResponse.fromJson(Map<String, dynamic> json) {
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
    String? code;

    Data({this.code});

    Data.fromJson(Map<String, dynamic> json) {
      code = json['code'];
    }

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = <String, dynamic>{};
      data['code'] = code;
      return data;
    }
  }
