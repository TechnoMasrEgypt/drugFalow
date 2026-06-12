import 'package:drug_flow/features/Auths/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:get_it/get_it.dart';
Future<void>initOnBoardingInj(GetIt s)async{
  s.registerFactory(()=>OnboardingCubit());
}