class VerifySendCodeParams {
  String? email;

  VerifySendCodeParams({this.email});

  Map<String,dynamic>toMap(){
    return {
      "email" : email
    };
  }
}