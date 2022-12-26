part of 'notification_cubit.dart';

enum NotificationStatus {
  initial,
  loading,
  success,
  failure,
}

class NotificationState extends Equatable {
  final NotificationStatus status;
  final num totalNotification;
  final num newNotification;
  final List<Notification>? notifications;
  const NotificationState({
    this.status = NotificationStatus.initial,
    this.totalNotification = 0,
    this.newNotification = 0,
    this.notifications,
  });
  NotificationState copyWith({
    NotificationStatus? status,
    num? totalNotification,
    num? newNotification,
    List<Notification>? notifications,
  }) {
    return NotificationState(
      status: status ?? this.status,
      totalNotification: totalNotification ?? this.totalNotification,
      newNotification: newNotification ?? this.newNotification,
      notifications: notifications ?? this.notifications,
    );
  }

  @override
  List<Object?> get props =>
      [status, totalNotification, newNotification, notifications];
}
