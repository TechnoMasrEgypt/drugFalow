class VerifyResetParams {
  String? email;
  String? code;

  VerifyResetParams({this.email, this.code,});

  Map<String,dynamic>toMap(){
    return {
      "email" :email,
      "code" : code
    };
  }
}