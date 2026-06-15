// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

// import '../../../../../../core/errors/failure.dart';
// import '../../../domain/entities/notification_params.dart';
// import '../../../domain/entities/notifications_response.dart';
// import '../../../domain/usecases/notifications_use_case.dart';

// part 'notifications_state.dart';

// class NotificationsCubit extends Cubit<NotificationsState> {
//   NotificationsCubit(this.notificationsUseCase,this.unReadNotificationsUseCase,
//   this.deleteNotificationsUseCase,  this.markAsReadUseCase,  this.markAllAsReadUseCase)
//       : super(NotificationsInitial());

//   bool? loading = false;
//   bool? failed = false;
//   bool success = false;
//   final NotificationsUseCase notificationsUseCase;
//   final MarkAsReadUseCase markAsReadUseCase;
//   final MarkAllAsReadUseCase markAllAsReadUseCase;
//   final UnReadNotificationsUseCase unReadNotificationsUseCase;
//   final DeleteNotificationsUseCase deleteNotificationsUseCase;

//   int? notificationIndex = -1;

//   bool? deleteLoading = false;
//   bool? deleteError = false;
//   bool? deleteSuccess = false;


//   bool? unReadLoading = false;
//   bool? unReadError = false;
//   bool? unReadSuccess = false;

//   bool? readLoading = false;
//   bool? readError = false;
//   bool? readSuccess = false;

//   bool? allReadLoading = false;
//   bool? allReadError = false;
//   bool? allReadSuccess = false;

//   bool isFetchingMore = false;


//   int currentPage = 1;
//   int? lastPage;

//   bool? obscure = true;
//   String? failMsg;
//   NotificationsResponse? notificationsResponse;
//   UnReadCountNotificationResponse? unReadCountNotificationResponse;
//   DeleteNotificationResponse? deleteNotificationResponse;



//   Future<void>getNotifications({NotificationParams? params})async{
//     try {
//       loading = true;
//       failed = false;
//       success = false;
//       emit(NotificationsLoading());

//       final failOrUser = await notificationsUseCase(params!);
//       failOrUser.fold(
//             (fail) {
//           if(fail is ServerFailure){
//             loading = false;
//             failed = true;
//             success = false;
//             failMsg = fail.message;
//             emit(NotificationsError());
//           }

//         },
//             (response) {
//           loading = false;
//          failed = false;
//           success = true;
//           notificationsResponse = response;

//           // Pagination info
//           currentPage = response.data?.meta?.currentPage ?? 1;
//           lastPage = response.data?.meta?.lastPage;

//           emit(NotificationsSuccess());
//         },
//       );
//     } catch (e) {
//       loading = false;
//      failed = true;
//       success = false;
//       failMsg = e.toString();
//       // emit(FavouritesError());
//     }
//   }
//   Future<void> getNextPage({NotificationParams? params}) async {
//     if (isFetchingMore || currentPage >= (lastPage ?? 1)) return;

//     isFetchingMore = true;
//     emit(NotificationsLoadingMore());

//     final nextPageParams = NotificationParams(
//       page: currentPage + 1,
//     );

//     final failOrUser = await notificationsUseCase(nextPageParams);
//     failOrUser.fold(
//           (fail) {
//         if(fail is ServerFailure){
//           isFetchingMore = false;
//           failMsg = fail.message;
//         }

//         emit(NotificationsError());
//       },
//           (response) {
//         isFetchingMore = false;
//         currentPage = response.data?.meta?.currentPage ?? currentPage;
//         lastPage = response.data?.meta?.lastPage ?? lastPage;

//         // Append new items
//         notificationsResponse?.data?.items?.addAll(response.data?.items ?? []);
//         emit(NotificationsSuccess());
//       },
//     );
//   }

//   Future<void>getUnReadCountNotifications()async{
//     try{
//     unReadLoading = true;
//     unReadError = false;
//     unReadSuccess = false;
//       emit(NotificationsLoading());
//       final failOrUser = await unReadNotificationsUseCase(NoParams());
//       failOrUser.fold((fail){
//         if(fail is ServerFailure){
//        /*   msgKey.currentState!.showSnackBar
//             (SnackBar(
//               behavior: SnackBarBehavior.floating,
//               content: Text(fail.message,
//                 style: TextStyles.textStyleNormal12
//                     .copyWith(color: white),textScaler: TextScaler.linear(1),)));*/
//          unReadLoading = false;
//           unReadError =true;
//       unReadSuccess= false;
//           failMsg = fail.message;
//           emit(NotificationsError());
//         }
//       }, (response)async{
//         unReadLoading = false;
//         unReadError = false;
//         unReadSuccess = true;
//        unReadCountNotificationResponse = response;



//    /*   msgKey.currentState!.showSnackBar
//           (SnackBar(
//             behavior: SnackBarBehavior.floating,
//             content: Text(response.message!,
//               style: TextStyles.textStyleNormal12
//                   .copyWith(color: white),textScaler: TextScaler.linear(1),)));*/
//         emit(NotificationsSuccess());
//       });
//     }catch(e){
//       unReadLoading = false;
//       unReadError =true;
//       unReadSuccess= false;

//     /*  msgKey.currentState!.showSnackBar
//         (SnackBar(
//           behavior: SnackBarBehavior.floating,
//           content: Text(e.toString(),
//             style: TextStyles.textStyleNormal12
//                 .copyWith(color: white),textScaler: TextScaler.linear(1),)));*/
//     }
//   }
//   Future<void>deleteNotifications({NotificationParams? params})async{
//     try{
//       deleteLoading = true;
//       deleteError = false;
//       deleteSuccess = false;
//       emit(DeleteNotificationsLoading());
//       final failOrUser = await deleteNotificationsUseCase(params!);
//       failOrUser.fold((fail){
//         if(fail is ServerFailure){
//           msgKey.currentState!.showSnackBar
//             (SnackBar(
//               behavior: SnackBarBehavior.floating,
//               content: Text(fail.message,
//                 style: TextStyles.textStyleNormal12
//                     .copyWith(color: white),textScaler: TextScaler.linear(1),)));
//           deleteLoading = false;
//          deleteError =true;
//           deleteSuccess = false;
//           failMsg = fail.message;
//           emit(DeleteNotificationsError());
//         }
//       }, (response)async{
//         deleteLoading = false;
//         deleteError = false;
//         deleteSuccess = true;
//         deleteNotificationResponse = response;
//         notificationsResponse!.data!.items!.removeWhere((e)=>e.id == params.notificationsId);


//        msgKey.currentState!.showSnackBar
//           (SnackBar(
//             behavior: SnackBarBehavior.floating,
//             content: Text(response.message!,
//               style: TextStyles.textStyleNormal12
//                   .copyWith(color: white),textScaler: TextScaler.linear(1),)));
//         emit(DeleteNotificationsSuccess());
//       });
//     }catch(e){
//       deleteLoading = false;
//       deleteError =true;
//       deleteSuccess = false;

//       msgKey.currentState!.showSnackBar
//         (SnackBar(
//           behavior: SnackBarBehavior.floating,
//           content: Text(e.toString(),
//             style: TextStyles.textStyleNormal12
//                 .copyWith(color: white),textScaler: TextScaler.linear(1),)));
//     }

//   }
//   Future<void>updateNotifications({int? index})async{
//     notificationIndex = index;
//     emit(UpdateNotificationsState());
//   }

//   Future<void>markAsRead({NotificationParams? params})async{
//     try{
//       readLoading = true;
//       readError = false;
//      readSuccess = false;
//       emit(MarkAsReadLoading());
//       final failOrUser = await markAsReadUseCase(params!);
//       failOrUser.fold((fail){
//         if(fail is ServerFailure){
//           msgKey.currentState!.showSnackBar
//             (SnackBar(
//               behavior: SnackBarBehavior.floating,
//               content: Text(fail.message,
//                 style: TextStyles.textStyleNormal12
//                     .copyWith(color: white),textScaler: TextScaler.linear(1),)));
//           readLoading =false;
//           readError = true;
//           readSuccess = false;
//           failMsg = fail.message;
//           emit(MarkAsReadError());
//         }
//       }, (response)async{
//         readLoading =false;
//         readError = false;
//         readSuccess = true;
//         getUnReadCountNotifications();
//         getNotifications(params: NotificationParams(page: 1));


//         msgKey.currentState!.showSnackBar
//           (SnackBar(
//             behavior: SnackBarBehavior.floating,
//             content: Text(response.message!,
//               style: TextStyles.textStyleNormal12
//                   .copyWith(color: white),textScaler: TextScaler.linear(1),)));
//         emit(MarkAsReadSuccess());
//       });
//     }catch(e){
//       readLoading =false;
//       readError = true;
//       readSuccess = false;

//       msgKey.currentState!.showSnackBar
//         (SnackBar(
//           behavior: SnackBarBehavior.floating,
//           content: Text(e.toString(),
//             style: TextStyles.textStyleNormal12
//                 .copyWith(color: white),textScaler: TextScaler.linear(1),)));
//     }

//   }

//   Future<void>markAllAsRead()async{
//     try{
//       allReadLoading = true;
//       allReadError = false;
//     allReadSuccess = false;
//       emit(MarkAllAsReadLoading());
//       final failOrUser = await markAllAsReadUseCase(NoParams());
//       failOrUser.fold((fail){
//         if(fail is ServerFailure){
//           msgKey.currentState!.showSnackBar
//             (SnackBar(
//               behavior: SnackBarBehavior.floating,
//               content: Text(fail.message,
//                 style: TextStyles.textStyleNormal12
//                     .copyWith(color: white),textScaler: TextScaler.linear(1),)));
//           allReadLoading = false;
//           allReadError = true;
//           allReadSuccess = false;
//           failMsg = fail.message;
//           emit(MarkAllAsReadError());
//         }
//       }, (response)async{
//         allReadLoading = false;
//         allReadError = false;
//         allReadSuccess = true;
//         getNotifications(params: NotificationParams(page: 1));
//         getUnReadCountNotifications();

//         msgKey.currentState!.showSnackBar
//           (SnackBar(
//             behavior: SnackBarBehavior.floating,
//             content: Text(response.message!,
//               style: TextStyles.textStyleNormal12
//                   .copyWith(color: white),textScaler: TextScaler.linear(1),)));
//         emit(MarkAllAsReadSuccess());
//       });
//     }catch(e){
//       allReadLoading = false;
//       allReadError = true;
//       allReadSuccess = false;

//       msgKey.currentState!.showSnackBar
//         (SnackBar(
//           behavior: SnackBarBehavior.floating,
//           content: Text(e.toString(),
//             style: TextStyles.textStyleNormal12
//                 .copyWith(color: white),textScaler: TextScaler.linear(1),)));
//     }

//   }


// }
//  /* Future<void>deleteNotifications({NotificationParams? params})async{
//     try{
//       deleteLoading = true;
//       deleteError = false;
//       deleteSuccess = false;
//       emit(DeleteNotificationsLoading());
//       final failOrUser = await deleteNotificationsUseCase(params!);
//       failOrUser.fold((fail){
//         if(fail is ServerFailure){
//           msgKey.currentState!.showSnackBar
//             (SnackBar(
//               behavior: SnackBarBehavior.floating,
//               content: Text(fail.message,
//                 style: TextStyles.textStyleNormal12
//                     .copyWith(color: white),textScaler: TextScaler.linear(1),)));
//           deleteLoading = false;
//           deleteError =true;
//           deleteSuccess = false;
//           failMsg = fail.message;
//           emit(DeleteNotificationsError());
//         }
//       }, (response)async{
//         deleteLoading = false;
//         deleteError = false;
//         deleteSuccess = true;
//         deleteNotificationResponse = response;
//         notificationsResponse!.data!.items!.removeWhere((e)=>e.id == params.notificationsId);


//         msgKey.currentState!.showSnackBar
//           (SnackBar(
//             behavior: SnackBarBehavior.floating,
//             content: Text(response.message!,
//               style: TextStyles.textStyleNormal12
//                   .copyWith(color: white),textScaler: TextScaler.linear(1),)));
//         emit(DeleteNotificationsSuccess());
//       });
//     }catch(e){
//       deleteLoading = false;
//       deleteError =true;
//       deleteSuccess = false;

//       msgKey.currentState!.showSnackBar
//         (SnackBar(
//           behavior: SnackBarBehavior.floating,
//           content: Text(e.toString(),
//             style: TextStyles.textStyleNormal12
//                 .copyWith(color: white),textScaler: TextScaler.linear(1),)));
//     }

//   }*/
// }
