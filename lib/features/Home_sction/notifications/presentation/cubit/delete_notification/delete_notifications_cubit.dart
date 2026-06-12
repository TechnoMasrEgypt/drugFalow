import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'delete_notifications_state.dart';

class DeleteNotificationsCubit extends Cubit<DeleteNotificationsState> {
  DeleteNotificationsCubit() : super(DeleteNotificationsInitial());
}
