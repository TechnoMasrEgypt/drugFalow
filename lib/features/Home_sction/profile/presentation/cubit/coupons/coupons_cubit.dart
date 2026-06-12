import 'package:drug_flow/core/networking/api_result.dart';
import 'package:drug_flow/features/Home_sction/profile/data/logic/profile_repo.dart';
import 'package:drug_flow/features/Home_sction/profile/presentation/cubit/coupons/coupons_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CouponsCubit extends Cubit<CouponsState> {
  final ProfileRepo repo;

  CouponsCubit(this.repo) : super(CouponsInitial());

  Future<void> getCoupons() async {
    emit(CouponsLoading());

    final result = await repo.getCoupons();

    result.when(
      success: (data) {
        emit(CouponsSuccess(data));
      },
      failure: (error) {
        emit(CouponsError(error.apiErrorModel.message ?? 'حدث خطأ'));
      },
    );
  }
}