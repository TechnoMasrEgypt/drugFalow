
import 'package:drug_flow/core/networking/api_result.dart';
import 'package:drug_flow/core/utils/shared_prefrence_helpers.dart';
import 'package:drug_flow/features/Auths/login/data/repo/login_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/networking/dio_factory.dart';
import '../data/models/login_request_body.dart';
import 'login_state.dart';
class LoginCubit extends Cubit<LoginState> {
  final LoginRepository _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  final TextEditingController countryCodeController = TextEditingController();
  TabController? tabController;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Future<void>setTabController({required TickerProvider ticker})async{
    tabController = TabController(length: 2, vsync: ticker);
  }
    int? ind=0;
  Future<void>updateTabState({required int val})async{
    ind = val;
    emit(UpdateTabLoginState());
  }
  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
        phone: phoneController.text,
      ),
    );
    response.when(success: (loginResponse) async {
      await saveUserToken(loginResponse.data?.token ?? '');
      emit(LoginState.success(loginResponse));
    }, failure: (error) {
      emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
    });
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }
}