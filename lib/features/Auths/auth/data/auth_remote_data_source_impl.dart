

// import 'package:drug_flow/features/Auths/auth/domain/entities/delete_account/delete_account_response.dart';
// import 'package:drug_flow/features/Auths/auth/domain/entities/forgot_password/forgot_password.dart';
// import 'package:drug_flow/features/Auths/auth/domain/entities/forgot_password/forgot_password_params.dart';
// import 'package:drug_flow/features/Auths/auth/domain/entities/login/login.dart';
// import 'package:dio/dio.dart';
// import 'package:drug_flow/features/Auths/auth/domain/entities/logout/logout.dart';
// import 'package:drug_flow/features/Auths/auth/domain/entities/resend_code/resend_code.dart';
// import '../../../../core/errors/exceptions.dart';
// import '../../../../core/utils/api_base_helper.dart';
// import '../domain/entities/login/login_params.dart';
// import '../domain/entities/register/register.dart';
// import '../domain/entities/register/register_params.dart';
// import '../domain/entities/resend_code/resend_code_params.dart';
// import '../domain/entities/reset_password/reset_password_params.dart';
// import '../domain/entities/reset_password/reset_password_response.dart';
// import '../domain/entities/verify_account/verify_account.dart';
// import '../domain/entities/verify_account/verify_account_params.dart';
// import '../domain/entities/verify_reset_code/verify_reset_code_params.dart';
// import '../domain/entities/verify_reset_code/verify_reset_code_response.dart';
// import '../domain/entities/verify_send_code/verify_send_code.dart';
// import '../domain/entities/verify_send_code/verify_send_code_params.dart';

// const loginApi = "/auth/login";
// const registerApi = "/auth/register";
// const emiratesApi = "/emirates";
// const verifySendCodeApi = "/auth/verify/resend-code";
// const verifyAccountApi = "/auth/verify-account";

// const forgotPassApi = "/auth/forgot-password";
// const verifyResetCodeApi = "/auth/verify-reset-code";
// const newPasswordApi = "/auth/reset-password";
// const resendOtpApi = "/auth/resend-code";
// const forgetPasswordApi = "/auth/forgot-password";
// const resetPasswordApi = "/auth/reset-password";
// const deleteAccountApi = "/auth/delete-account";
// const  logoutApi = "/auth/logout";

// abstract class AuthRemoteDataSource {
//   Future<LoginResponse>signIn({LoginParams params});
//   Future<RegisterResponse>createCustomer({RegisterParams params});
//   Future<VerifySendCode>verifyCode({VerifySendCodeParams params});
//   Future<ForgotPasswordResponse>forgotPass({ForgetPasswordParams? params});
//   Future<VerifyResetCodeResponse>verifyReset({VerifyResetParams params});
//   Future<ResetPasswordResponse>setNewPass({ResetPasswordParams params});
//   Future<ResendCodeResponse>resendCode({ResendCodeParams params});
//   Future<LogOutResponse>logout();
//   Future<DeleteAccountResponse>deleteAccount();
//   Future<VerifyAccountResponse>verifyAccount({VerifyAccountParams? params});
// }
// class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
//   final Dio dio;

//   AuthRemoteDataSourceImpl({required this.dio});

//   @override
//   Future<LoginResponse> signIn({LoginParams? params}) async {
//     try {
//       final formData = FormData.fromMap({
//         ...params!.toMap(),
//       });
//       final response = await helper.post(url: loginApi, formData: formData);


//       return LoginResponse.fromJson(response);
//     } on ServerException catch (e) {
//       throw ServerException(message: e.message);
//     } on UnAuthorizedException catch (e) {
//       throw UnAuthorizedException(message: e.message);
//     } on UnprocessableContentException catch (e) {
//       throw UnprocessableContentException(message: e.message);
//     }
//   }

//   @override
//   Future<RegisterResponse> createCustomer({RegisterParams? params}) async {
//     try {
//       final formData = FormData.fromMap({
//         ...params!.toMap(),
//         if (params.image != null)
//           "image": await MultipartFile.fromFile(params.image!.path),
//       });
//       final response = await helper.post(url: registerApi, formData: formData);
//       return RegisterResponse.fromJson(response);
//     } on ServerException catch (e) {
//       throw ServerException(message: e.message);
//     } on UnAuthorizedException catch (e) {
//       throw UnAuthorizedException(message: e.message);
//     } on UnprocessableContentException catch (e) {
//       throw UnprocessableContentException(message: e.message);
//     }
//   }


//   @override
//   Future<VerifySendCode> verifyCode({VerifySendCodeParams? params}) async {
//     try {
//       final formData = FormData.fromMap({
//         ...params!.toMap(),
//       });
//       final response = await helper.post(
//           url: verifySendCodeApi, formData: formData);

//       return VerifySendCode.fromJson(response);
//     } on ServerException catch (e) {
//       throw ServerException(message: e.message);
//     } on UnAuthorizedException catch (e) {
//       throw UnAuthorizedException(message: e.message);
//     } on UnprocessableContentException catch (e) {
//       throw UnprocessableContentException(message: e.message);
//     }
//   }

//   @override
//   Future<VerifyAccountResponse> verifyAccount(
//       {VerifyAccountParams? params}) async {
//     try {
//       final formData = FormData.fromMap({
//         ...params!.toMap(),
//       });
//       final response = await helper.post(
//           url: verifyAccountApi, formData: formData);

//       return VerifyAccountResponse.fromJson(response);
//     } on ServerException catch (e) {
//       throw ServerException(message: e.message);
//     } on UnAuthorizedException catch (e) {
//       throw UnAuthorizedException(message: e.message);
//     } on UnprocessableContentException catch (e) {
//       throw UnprocessableContentException(message: e.message);
//     }
//   }

//   @override
//   Future<ForgotPasswordResponse> forgotPass(
//       {ForgetPasswordParams? params}) async {
//     try {
//       final formData = FormData.fromMap({
//         ...params!.toMap(),
//       });
//       final response = await helper.post(
//           url: forgetPasswordApi, formData: formData);

//       return ForgotPasswordResponse.fromJson(response);
//     } on ServerException catch (e) {
//       throw ServerException(message: e.message);
//     } on UnAuthorizedException catch (e) {
//       throw UnAuthorizedException(message: e.message);
//     } on UnprocessableContentException catch (e) {
//       throw UnprocessableContentException(message: e.message);
//     }
//   }

//   @override
//   Future<VerifyResetCodeResponse> verifyReset(
//       {VerifyResetParams? params}) async {
//     try {
//       final formData = FormData.fromMap({
//         ...params!.toMap(),
//       });
//       final response = await helper.post(
//           url: verifyResetCodeApi, formData: formData);

//       return VerifyResetCodeResponse.fromJson(response);
//     } on ServerException catch (e) {
//       throw ServerException(message: e.message);
//     } on UnAuthorizedException catch (e) {
//       throw UnAuthorizedException(message: e.message);
//     } on UnprocessableContentException catch (e) {
//       throw UnprocessableContentException(message: e.message);
//     }
//   }

//   @override
//   Future<ResetPasswordResponse> setNewPass(
//       {ResetPasswordParams? params}) async {
//     try {
//       final formData = FormData.fromMap({
//         ...params!.toMap(),
//       });
//       final response = await helper.post(
//           url: resetPasswordApi, formData: formData);

//       return ResetPasswordResponse.fromJson(response);
//     } on ServerException catch (e) {
//       throw ServerException(message: e.message);
//     } on UnAuthorizedException catch (e) {
//       throw UnAuthorizedException(message: e.message);
//     } on UnprocessableContentException catch (e) {
//       throw UnprocessableContentException(message: e.message);
//     }
//   }

//   @override
//   Future<ResendCodeResponse> resendCode({ResendCodeParams? params}) async {
//     try {
//       final formData = FormData.fromMap({
//         ...params!.toMap(),
//       });
//       final response = await helper.post(url: resendOtpApi, formData: formData);

//       return ResendCodeResponse.fromJson(response);
//     } on ServerException catch (e) {
//       throw ServerException(message: e.message);
//     } on UnAuthorizedException catch (e) {
//       throw UnAuthorizedException(message: e.message);
//     } on UnprocessableContentException catch (e) {
//       throw UnprocessableContentException(message: e.message);
//     }
//   }

//   @override
//   Future<DeleteAccountResponse> deleteAccount() async {
//     try {
//       final response = await helper.delete(url: deleteAccountApi,);
//       return DeleteAccountResponse.fromJson(response);
//     } on ServerException catch (e) {
//       throw ServerException(message: e.message);
//     } on UnAuthorizedException catch (e) {
//       throw UnAuthorizedException(message: e.message);
//     } on UnprocessableContentException catch (e) {
//       throw UnprocessableContentException(message: e.message);
//     }
//   }

//   @override
//   Future<LogOutResponse> logout() async {
//     try {
//       final formData = FormData.fromMap({});

//       final response = await helper.post(url: logoutApi, formData: formData);

//       return LogOutResponse.fromJson(response);
//     } on ServerException catch (e) {
//       throw ServerException(message: e.message);
//     } on UnAuthorizedException catch (e) {
//       throw UnAuthorizedException(message: e.message);
//     } on UnprocessableContentException catch (e) {
//       throw UnprocessableContentException(message: e.message);
//     }
//   }
// }

