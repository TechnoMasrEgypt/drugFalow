class RegisterResponse {
  final bool success;
  final String message;
  final Data? data;

  RegisterResponse({
    required this.success,
    required this.message,
    this.data,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }
}
class Data {
  final User? user;
  final String? token;

  Data({this.user, this.token});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      token: json['token'],
    );
  }
}
class User {
  final String? name;
  final String? email;
  final String? phone;
  final int? governorateId;
  final int? cityId;
  final int? areaId;
  final String? address;
  final bool? isVerified;
  final String? pharmacyCode;
  final String? updatedAt;
  final String? createdAt;
  final int? id;

  User({
    this.name,
    this.email,
    this.phone,
    this.governorateId,
    this.cityId,
    this.areaId,
    this.address,
    this.isVerified,
    this.pharmacyCode,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name']?['en'],
      email: json['email'],
      phone: json['phone'],
      governorateId: json['governorate_id'] is int
          ? json['governorate_id']
          : int.tryParse(json['governorate_id'].toString()),
      cityId: json['city_id'] is int
          ? json['city_id']
          : int.tryParse(json['city_id'].toString()),
      areaId: json['area_id'] is int
          ? json['area_id']
          : int.tryParse(json['area_id'].toString()),
      address: json['address']?['en'],
      isVerified: json['is_verified'],
      pharmacyCode: json['pharmacy_code'],
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
      id: json['id'],
    );
  }
}