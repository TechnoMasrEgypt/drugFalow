class LoginParams {
  String? email;
  String? phone;
  String? password;
  String? fcmToken;

  LoginParams({this.email, this.phone, this.password,this.fcmToken});

  Map<String,dynamic>toMap(){
    return {
      "email" : email,
      "phone":phone,
      "password" : password,
      "fcm_token" : fcmToken
    };
  }
}