class ResetPasswordParams {
  String? resetToken;
  String? email;
  String? password;
  String? passwordConfirmation;

  ResetPasswordParams({this.resetToken, this.email, this.password,
    this.passwordConfirmation});


  Map<String,dynamic>toMap(){
    return {
      "reset_token" : resetToken,
      "email" :email,
      "password" :password,
      "password_confirmation" : passwordConfirmation
    };
  }


}