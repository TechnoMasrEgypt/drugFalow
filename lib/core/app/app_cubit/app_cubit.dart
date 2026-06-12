import 'dart:ui';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:drug_flow/core/utils/shared_prefrence_helpers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState.initial());
  String currentLangCode = 'ar';

  void getSavedLanguage() {
    final result = SharedPrefHelper().containPreference(SharedPrefKeys.language)
        ? SharedPrefHelper.getString(SharedPrefKeys.language)
        : 'ar';

    currentLangCode = result!;
    emit(AppState.langChangeMode(locle: Locale(currentLangCode)));
  }

  void toggleLanguage(String langCode) {
    currentLangCode = langCode;
    SharedPrefHelper.setSecuredString(SharedPrefKeys.language, langCode).then((
      value,
    ) {
      emit(AppState.langChangeMode(locle: Locale(langCode)));
    });
  }

  void toArabic() {
    toggleLanguage('ar');
  }

  void toEnglish() {
    toggleLanguage('en');
  }
}
