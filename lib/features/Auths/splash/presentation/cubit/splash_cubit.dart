import 'package:bloc/bloc.dart';
import 'package:drug_flow/core/constants/screens.dart';
import 'package:drug_flow/core/utils/shared_prefrence_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  Future<void> setSplash({required BuildContext context}) async {
    emit(SplashLoading());
    await Future.microtask(() {});
    await Future.delayed(const Duration(seconds: 3));

    final token = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );
    if (!context.mounted) return;

    if (token != null && token.isNotEmpty) {
      context.push(bottomBarSc);
    } else {
      context.push(onboardingSc);
    }
  }
}
