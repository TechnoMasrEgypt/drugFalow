// import 'package:drug_flow/features/Auths/auth/domain/entities/delete_account/delete_account_response.dart';

// import 'package:drug_flow/features/Auths/auth/domain/entities/logout/logout.dart';
// import 'package:drug_flow/features/Auths/auth/domain/entities/verify_account/verify_account.dart';
// import 'package:drug_flow/features/Auths/auth/domain/entities/verify_account/verify_account_params.dart';
// import '../../../../core/errors/exceptions.dart';
// import '../../../../core/errors/failure.dart';
// import '../../../../core/local/auth_local_data_source.dart';
// import '../domain/entities/forgot_password/forgot_password.dart';
// import '../domain/entities/forgot_password/forgot_password_params.dart';
// import '../domain/entities/login/login.dart';
// import '../domain/entities/login/login_params.dart';
// import '../domain/entities/register/register.dart';
// import '../domain/entities/register/register_params.dart';
// import '../domain/entities/resend_code/resend_code.dart';
// import '../domain/entities/resend_code/resend_code_params.dart';
// import '../domain/entities/reset_password/reset_password_params.dart';
// import '../domain/entities/reset_password/reset_password_response.dart';
// import '../domain/entities/verify_reset_code/verify_reset_code_params.dart';
// import '../domain/entities/verify_reset_code/verify_reset_code_response.dart';
// import '../domain/entities/verify_send_code/verify_send_code.dart';
// import '../domain/entities/verify_send_code/verify_send_code_params.dart';
// import '../domain/repositories/auth_repositories.dart';
// import 'auth_remote_data_source_impl.dart';
// import 'package:dartz/dartz.dart';

// class AuthRepositoryImpl implements AuthRepositories {
//   final AuthRemoteDataSource authRemoteDataSource;
//   final AuthLocalDataSource authLocalDataSource;

//   AuthRepositoryImpl(this.authRemoteDataSource, this.authLocalDataSource);

//   @override
//   Future<Either<Failure, LoginResponse>> signIn({LoginParams? params}) async {
//     try {
//       final response = await authRemoteDataSource.signIn(params: params!);
//       await authLocalDataSource.cacheUserAccessToken(
//           token: response.data!.token!);
//       return Right(response);
//     } on ServerException catch (e) {
//       return left(ServerFailure(message: e.message));
//     } on UnAuthorizedException catch (e) {
//       return left(ServerFailure(message: e.message));
//     } on UnprocessableContentException catch (e) {
//       return left(ServerFailure(message: e.message));
//     }
//   }

//   @override
//   Future<Either<Failure, RegisterResponse>> createCustomer(
//       {RegisterParams? params}) async {
//     try {
//       final response = await authRemoteDataSource.createCustomer(
//           params: params!);
//       await authLocalDataSource.cacheUserAccessToken(
//           token: response.data!.token!);
//       return Right(response);
//     } on ServerException catch (e) {
//       return left(ServerFailure(message: e.message));
//     } on UnAuthorizedException catch (e) {
//       return left(ServerFailure(message: e.message));
//     } on UnprocessableContentException catch (e) {
//       return left(ServerFailure(message: e.message));
//     }
//   }



//   @override
//   Future<Either<Failure, VerifyAccountResponse>> verifyAccount(
//       {VerifyAccountParams? params}) async {
//     try {
//       final response = await authRemoteDataSource.verifyAccount(params: params);
//       return Right(response);
//     } on ServerException catch (e) {
//       return left(ServerFailure(message: e.message));
//     } on UnAuthorizedException catch (e) {
//       return left(ServerFailure(message: e.message));
//     } on UnprocessableContentException catch (e) {
//       return left(ServerFailure(message: e.message));
//     }
//   }


//   @override
//   Future<Either<Failure, ForgotPasswordResponse>> forgotPass(
//       {ForgetPasswordParams? params}) async {
//     try {
//       final response = await authRemoteDataSource.forgotPass(params: params!);
//       return Right(response);
//     } on ServerException catch (e) {
//       return left(ServerFailure(message: e.message));
//     } on UnAuthorizedException catch (e) {
//       return left(ServerFailure(message: e.message));
//     } on UnprocessableContentException catch (e) {
//       return left(ServerFailure(message: e.message));
//     }
//   }

//   @override
//   Future<Either<Failure, VerifyResetCodeResponse>> verifyReset(
//       {VerifyResetParams? params}) async {
//     try {
//       final response = await authRemoteDataSource.verifyReset(params: params!);
//       return Right(response);
//     } on ServerException catch (e) {
//       return left(ServerFailure(message: e.message));
//     } on UnAuthorizedException catch (e) {
//       return left(ServerFailure(message: e.message));
//     } on UnprocessableContentException catch (e) {
//       return left(ServerFailure(message: e.message));
//     }
//   }

//   @override
//   Future<Either<Failure, ResetPasswordResponse>> setNewPass(
//       {ResetPasswordParams? params}) async {
//     try {
//       final response = await authRemoteDataSource.setNewPass(params: params!);
//       return Right(response);
//     } on ServerException catch (e) {
//       return left(ServerFailure(message: e.message));
//     } on UnAuthorizedException catch (e) {
//       return left(ServerFailure(message: e.message));
//     } on UnprocessableContentException catch (e) {
//       return left(ServerFailure(message: e.message));
//     }
//   }

//   @override
//   Future<Either<Failure, ResendCodeResponse>> resendCode(
//       {ResendCodeParams? params}) async {
//     try {
//       final response = await authRemoteDataSource.resendCode(params: params!);
//       return Right(response);
//     } on ServerException catch (e) {
//       return left(ServerFailure(message: e.message));
//     } on UnAuthorizedException catch (e) {
//       return left(ServerFailure(message: e.message));
//     } on UnprocessableContentException catch (e) {
//       return left(ServerFailure(message: e.message));
//     }
//   }

//   @override
//   Future<Either<Failure, DeleteAccountResponse>> deleteAccount() async {
//     try {
//       final response = await authRemoteDataSource.deleteAccount();
//       return Right(response);
//     } on ServerException catch (e) {
//       return left(ServerFailure(message: e.message));
//     } on UnAuthorizedException catch (e) {
//       return left(ServerFailure(message: e.message));
//     } on UnprocessableContentException catch (e) {
//       return left(ServerFailure(message: e.message));
//     }
//   }

//   @override
//   Future<Either<Failure, LogOutResponse>> logout() async {
//     try {
//       final response = await authRemoteDataSource.logout();
//       return Right(response);
//     } on ServerException catch (e) {
//       return left(ServerFailure(message: e.message));
//     } on UnAuthorizedException catch (e) {
//       return left(ServerFailure(message: e.message));
//     } on UnprocessableContentException catch (e) {
//       return left(ServerFailure(message: e.message));
//     }
//   }

//   @override
//   Future<Either<Failure, VerifySendCode>> verifySendCode({VerifySendCodeParams? params})async {
//     try {
//       final response = await authRemoteDataSource.verifyCode(params: params!);
//       return Right(response);
//     } on ServerException catch (e) {
//       return left(ServerFailure(message: e.message));
//     } on UnAuthorizedException catch (e) {
//       return left(ServerFailure(message: e.message));
//     } on UnprocessableContentException catch (e) {
//       return left(ServerFailure(message: e.message));
//     }
//   }
// }