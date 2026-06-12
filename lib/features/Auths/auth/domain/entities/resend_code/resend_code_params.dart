class ResendCodeParams {
  String? email;

  ResendCodeParams({this.email});

  Map<String,dynamic>toMap(){
    return {
      "email" : email
    };
  }
}