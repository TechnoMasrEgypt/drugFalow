import 'package:drug_flow/core/errors/failure.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/login/login.dart';
import 'package:dartz/dartz.dart';
import 'package:drug_flow/features/Auths/auth/domain/entities/verify_account/verify_account.dart';

import '../entities/delete_account/delete_account_response.dart';
import '../entities/forgot_password/forgot_password.dart';
import '../entities/forgot_password/forgot_password_params.dart';
import '../entities/login/login_params.dart';
import '../entities/logout/logout.dart';
import '../entities/register/register.dart';
import '../entities/register/register_params.dart';
import '../entities/resend_code/resend_code.dart';
import '../entities/resend_code/resend_code_params.dart';
import '../entities/reset_password/reset_password_params.dart';
import '../entities/reset_password/reset_password_response.dart';
import '../entities/verify_account/verify_account_params.dart';
import '../entities/verify_reset_code/verify_reset_code_params.dart';
import '../entities/verify_reset_code/verify_reset_code_response.dart';
import '../entities/verify_send_code/verify_send_code.dart';
import '../entities/verify_send_code/verify_send_code_params.dart';

abstract class AuthRepositories {
  Future<Either<Failure,LoginResponse>>signIn({LoginParams params});
  Future<Either<Failure,RegisterResponse>>createCustomer({RegisterParams params});
  Future<Either<Failure,VerifySendCode>>verifySendCode({VerifySendCodeParams params});
  Future<Either<Failure,ForgotPasswordResponse>>forgotPass({ForgetPasswordParams params});
   Future<Either<Failure,VerifyAccountResponse>>verifyAccount({VerifyAccountParams? params});
  Future<Either<Failure,VerifyResetCodeResponse>>verifyReset({VerifyResetParams params});

  Future<Either<Failure,ResetPasswordResponse>>setNewPass({ResetPasswordParams params});
  Future<Either<Failure,ResendCodeResponse>>resendCode({ResendCodeParams params});
  Future<Either<Failure,LogOutResponse>>logout();
  Future<Either<Failure,DeleteAccountResponse>>deleteAccount();
}