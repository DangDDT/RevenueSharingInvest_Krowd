import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rsi/models/notification/index.dart';
import 'package:rsi/resources/repository.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final Repository repository = new Repository();
  NotificationCubit() : super(const NotificationState());
  Future<void> fetchNotifications(bool seen) async {
    try {
      final tuple3 = await repository.fetchNotifications(seen);
      final totalNotification = tuple3.item1;
      final newNotification = tuple3.item2;
      final notifications = tuple3.item3;
      emit(state.copyWith(
        status: NotificationStatus.success,
        totalNotification: totalNotification,
        newNotification: newNotification,
        notifications: notifications,
      ));
    } catch (e) {
      emit(state.copyWith(status: NotificationStatus.failure));
    }
  }
}
