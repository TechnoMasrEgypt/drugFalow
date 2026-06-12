class ForgetPasswordParams {
  String? email;

  ForgetPasswordParams({this.email});

  Map<String,dynamic>toMap(){
    return {
      "email" :email
    };
  }
}