import 'package:json_annotation/json_annotation.dart';

part 'login_request_body.g.dart';

@JsonSerializable()
// class LoginRequestBody with _$LoginRequestBody {
//   const factory LoginRequestBody({
//     String? email,
//     String? phone,
//     required String password,
//     @JsonKey(name: 'fcm_token') String? fcmToken,
//   }) = _LoginRequestBody;

//   factory LoginRequestBody.fromJson(Map<String, dynamic> json) =>
//       _$LoginRequestBodyFromJson(json);

//   Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);
// }

@JsonSerializable()
class LoginRequestBody {
    String? email;
    String? phone;
     String password;
    @JsonKey(name: 'fcm_token') String? fcmToken;


  LoginRequestBody({ this.email, required this.password,this.fcmToken,this.phone});

  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);
}
