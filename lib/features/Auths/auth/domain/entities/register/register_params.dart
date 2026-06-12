import 'dart:io';

import 'package:drug_flow/core/constants/images.dart';

class RegisterParams {
  final String? name;
  final String? email;
  final String? phone;
  final String? password;
  final String? passwordConfirmation;
  final int? termsAccepted;
  final int? governorateId;
  final int? cityId;
  final int? areaId;
  final String? address;
  final File? image;

  RegisterParams({
    this.name,
    this.email,
    this.phone,
    this.password,
    this.passwordConfirmation,
    this.termsAccepted,
    this.governorateId,
    this.cityId,
    this.areaId,
    this.address,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
      "password_confirmation": passwordConfirmation,
      "terms_accepted": termsAccepted,
      "governorate_id": governorateId,
      "city_id": cityId,
      "area_id": areaId,
      "address": address,
      if (image != null) "image": image,
    };
  }
}
