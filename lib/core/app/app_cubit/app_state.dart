import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_state.freezed.dart';


@freezed
abstract class AppState with _$AppState {
  const factory AppState.initial() = _Initial;
  const factory AppState.langChangeMode({required Locale locle})=
  LanguageChangeModeState;
}