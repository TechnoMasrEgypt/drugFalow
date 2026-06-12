import 'package:bloc/bloc.dart';
import 'package:drug_flow/features/Home_sction/products/domain/entities/product_details/product_details_params.dart';
import 'package:drug_flow/features/Home_sction/products/domain/usecases/products_details_use_case.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/styles.dart';
import '../../../../../../core/errors/failure.dart';
import '../../../../../../main.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this.productsDetailsUseCase) : super(ProductDetailsInitial());

  final ProductsDetailsUseCase productsDetailsUseCase;

  bool? loading = false;
  bool? error = false;
  bool success = false;


  Future<void>getProductsDetails({ProductDetailsParams? params})async{
    try{
      loading = true;
      error = false;
      success = false;
      emit(ProductDetailsLoading());
      final failOrUser = await productsDetailsUseCase(params!);
      failOrUser.fold((fail){
        if(fail is ServerFailure){
          msgKey.currentState!.showSnackBar
            (SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text(fail.message,
                style: TextStyles.textStyleNormal12
                    .copyWith(color: white),textScaler: TextScaler.linear(1),)));
          loading = false;
          error = true;
          success = false;
          emit(ProductDetailsError());
        }
      }, (response)async{
        loading = false;
        error = false;
        success = true;


        emit(ProductDetailsSuccess());
      });
    }catch(e){
      loading = false;
      error = true;
      success = false;

      msgKey.currentState!.showSnackBar
        (SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(e.toString(),
            style: TextStyles.textStyleNormal12
                .copyWith(color: white),textScaler: TextScaler.linear(1),)));
      //  emit(RegisterError(message: e.toString()));
    }
  }
}
