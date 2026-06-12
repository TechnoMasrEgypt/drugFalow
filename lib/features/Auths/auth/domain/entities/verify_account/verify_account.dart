class VerifyAccountResponse {
  bool? success;
  String? message;
  Data? data;

  VerifyAccountResponse({this.success, this.message, this.data});

  VerifyAccountResponse.fromJson(Map<String, dynamic> json) {
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
  User? user;
  dynamic token;

  Data({this.user, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class User {
  int? id;
  Name? name;
  dynamic email;
  dynamic emailVerifiedAt;
  dynamic resetPasswordToken;
  dynamic resetPasswordTokenExpiresAt;
  dynamic verificationCode;
  dynamic verificationCodeExpiresAt;
  dynamic phone;
  dynamic image;
  dynamic fcmToken;
  bool? isVerified;
  bool? isActive;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic pharmacyCode;
  dynamic cityId;
  dynamic areaId;
  Name? address;
  dynamic governorateId;

  User(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.resetPasswordToken,
        this.resetPasswordTokenExpiresAt,
        this.verificationCode,
        this.verificationCodeExpiresAt,
        this.phone,
        this.image,
        this.fcmToken,
        this.isVerified,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.pharmacyCode,
        this.cityId,
        this.areaId,
        this.address,
        this.governorateId});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    resetPasswordToken = json['reset_password_token'];
    resetPasswordTokenExpiresAt = json['reset_password_token_expires_at'];
    verificationCode = json['verification_code'];
    verificationCodeExpiresAt = json['verification_code_expires_at'];
    phone = json['phone'];
    image = json['image'];
    fcmToken = json['fcm_token'];
    isVerified = json['is_verified'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pharmacyCode = json['pharmacy_code'];
    cityId = json['city_id'];
    areaId = json['area_id'];
    address =
    json['address'] != null ? new Name.fromJson(json['address']) : null;
    governorateId = json['governorate_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['reset_password_token'] = resetPasswordToken;
    data['reset_password_token_expires_at'] = resetPasswordTokenExpiresAt;
    data['verification_code'] = verificationCode;
    data['verification_code_expires_at'] = verificationCodeExpiresAt;
    data['phone'] = phone;
    data['image'] = image;
    data['fcm_token'] = fcmToken;
    data['is_verified'] = isVerified;
    data['is_active'] = isActive;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['pharmacy_code'] = pharmacyCode;
    data['city_id'] = cityId;
    data['area_id'] = areaId;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['governorate_id'] = governorateId;
    return data;
  }
}

class Name {
  dynamic en;
  dynamic ar;

  Name({this.en, this.ar});

  Name.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    ar = json['ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['en'] = en;
    data['ar'] = ar;
    return data;
  }
}

