import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/errors/failure.dart';
import '../../../domain/entities/notification_params.dart';
import '../../../domain/entities/notifications_response.dart';
import '../../../domain/usecases/notifications_use_case.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit(this.notificationsUseCase) : super(NotificationsInitial());
  final NotificationsUseCase notificationsUseCase;

  bool? loading = false;
  bool? error = false;
  bool success = false;

 bool? deleteLoading = false;
 bool? deleteError = false;
 bool? deleteSuccess = false;

  bool isFetchingMore = false;


  int currentPage = 1;
  int? lastPage;

  bool? obscure = true;
  String? failMsg;
  NotificationsResponse? notificationsResponse;

  Future<void>getNotifications({NotificationParams? params})async{
    try {
      loading = true;
      error = false;
      success = false;
      emit(NotificationsLoading());

      final failOrUser = await notificationsUseCase(params!);
      failOrUser.fold(
            (fail) {
          if(fail is ServerFailure){
            loading = false;
            error = true;
            success = false;
            failMsg = fail.message;
            emit(NotificationsError());
          }

        },
            (response) {
          loading = false;
          error = false;
          success = true;
          notificationsResponse = response;

          // Pagination info
          currentPage = response.data?.meta?.currentPage ?? 1;
          lastPage = response.data?.meta?.lastPage;

          emit(NotificationsSuccess());
        },
      );
    } catch (e) {
      loading = false;
      error = true;
      success = false;
      failMsg = e.toString();
      // emit(FavouritesError());
    }
  }
  Future<void> getNextPage({NotificationParams? params}) async {
    if (isFetchingMore || currentPage >= (lastPage ?? 1)) return;

    isFetchingMore = true;
    emit(NotificationsLoadingMore());

    final nextPageParams = NotificationParams(
      page: currentPage + 1,
    );

    final failOrUser = await notificationsUseCase(nextPageParams);
    failOrUser.fold(
          (fail) {
        if(fail is ServerFailure){
          isFetchingMore = false;
          failMsg = fail.message;
        }

        emit(NotificationsError());
      },
          (response) {
        isFetchingMore = false;
        currentPage = response.data?.meta?.currentPage ?? currentPage;
        lastPage = response.data?.meta?.lastPage ?? lastPage;

        // Append new items
        notificationsResponse?.data?.items?.addAll(response.data?.items ?? []);
        emit(NotificationsSuccess());
      },
    );
  }

 /* Future<void>deleteNotifications({NotificationParams? params})async{
    try{
      deleteLoading = true;
      deleteError = false;
      deleteSuccess = false;
      emit(DeleteNotificationsLoading());
      final failOrUser = await deleteNotificationsUseCase(params!);
      failOrUser.fold((fail){
        if(fail is ServerFailure){
          msgKey.currentState!.showSnackBar
            (SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text(fail.message,
                style: TextStyles.textStyleNormal12
                    .copyWith(color: white),textScaler: TextScaler.linear(1),)));
          deleteLoading = false;
          deleteError =true;
          deleteSuccess = false;
          failMsg = fail.message;
          emit(DeleteNotificationsError());
        }
      }, (response)async{
        deleteLoading = false;
        deleteError = false;
        deleteSuccess = true;
        deleteNotificationResponse = response;
        notificationsResponse!.data!.items!.removeWhere((e)=>e.id == params.notificationsId);


        msgKey.currentState!.showSnackBar
          (SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text(response.message!,
              style: TextStyles.textStyleNormal12
                  .copyWith(color: white),textScaler: TextScaler.linear(1),)));
        emit(DeleteNotificationsSuccess());
      });
    }catch(e){
      deleteLoading = false;
      deleteError =true;
      deleteSuccess = false;

      msgKey.currentState!.showSnackBar
        (SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(e.toString(),
            style: TextStyles.textStyleNormal12
                .copyWith(color: white),textScaler: TextScaler.linear(1),)));
    }

  }*/
}
