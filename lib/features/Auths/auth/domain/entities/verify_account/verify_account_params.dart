class VerifyAccountParams {
  String? email;
  String? code;

  VerifyAccountParams({this.email, this.code});

  Map<String,dynamic>toMap(){
    return {
      "email" : email,
      "code" : code
    };
  }
}