import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  int? pageInd = 0;
  final controller = PageController(initialPage: 0);

  Future<void> onPageIndex({int? ind}) async {
    pageInd = ind;
    emit(OnBoardingUpdatePage());
  }

  Future<void> pageIndexController() async {
    controller.animateToPage(
      pageInd!,
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOutExpo,
    );
    emit(UpdateAnimatedPage());
  }

  @override
  Future<void> close() {
    controller.dispose(); // ✅ always dispose PageController
    return super.close();
  }
}
