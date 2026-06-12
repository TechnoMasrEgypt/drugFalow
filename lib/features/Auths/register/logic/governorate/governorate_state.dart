part of 'governorate_cubit.dart';

@freezed
class GovernorateState with _$GovernorateState {
  const factory GovernorateState.initial() = _Initial;

  const factory GovernorateState.loading() = _Loading;

  const factory GovernorateState.loaded({
    required List<GovernorateModel> governorates,
    required List<CityModel>        cities,
    required List<AreaModel>        areas,
  }) = _Loaded;

  const factory GovernorateState.error({required String message}) = _Error;
}
