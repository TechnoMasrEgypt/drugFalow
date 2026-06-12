import 'package:bloc/bloc.dart';
import 'package:drug_flow/core/networking/api_result.dart';
import 'package:drug_flow/features/Auths/register/data/governorate_model.dart';
import 'package:drug_flow/features/Auths/register/data/repo/governorate_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'governorate_state.dart';
part 'governorate_cubit.freezed.dart';

class GovernorateCubit extends Cubit<GovernorateState> {
  GovernorateCubit(this._repo) : super(const GovernorateState.initial());

  final GovernorateRepo _repo;

  // Full list kept in memory after first fetch
  List<GovernorateModel> _allGovernorates = [];

  // ── Current selections ────────────────────────────────────────────────────
  GovernorateModel? selectedGovernorate;
  CityModel? selectedCity;
  AreaModel? selectedArea;

  // ── Fetch all governorates (cities & areas are nested inside) ─────────────
  Future<void> fetchGovernorates() async {
    emit(const GovernorateState.loading());

    final result = await _repo.getGovernorates();

    result.when(
      success: (list) {
        _allGovernorates = list;
        emit(
          GovernorateState.loaded(
            governorates: list,
            cities: [], // no city shown until governorate picked
            areas: [], // no area shown until city picked
          ),
        );
      },
      failure: (error) {
        emit(
          GovernorateState.error(message: error.apiErrorModel.message ?? ''),
        );
      },
    );
  }

  // ── Step 1: user picks a governorate ─────────────────────────────────────
  // Cities = governorate.cities  (already in the response, no extra call needed)
  void onGovernorateSelected(GovernorateModel governorate) {
    selectedGovernorate = governorate;
    selectedCity = null; // reset dependent selections
    selectedArea = null;

    emit(
      GovernorateState.loaded(
        governorates: _allGovernorates,
        cities: governorate.cities, // ← filtered by selected governorate id
        areas: [], // reset until city is picked
      ),
    );
  }

  // ── Step 2: user picks a city ─────────────────────────────────────────────
  // Areas = city.areas  (already nested inside the governorate response)
  void onCitySelected(CityModel city) {
    selectedCity = city;
    selectedArea = null; // reset dependent selection

    emit(
      GovernorateState.loaded(
        governorates: _allGovernorates,
        cities: selectedGovernorate!.cities, // keep same cities list
        areas: city.areas, // ← filtered by selected city id
      ),
    );
  }

  // ── Step 3: user picks an area ────────────────────────────────────────────
  void onAreaSelected(AreaModel area) {
    selectedArea = area;

    emit(
      GovernorateState.loaded(
        governorates: _allGovernorates,
        cities: selectedGovernorate!.cities,
        areas: selectedCity!.areas,
      ),
    );
  }
}
