import 'package:rsi/models/models.dart';
import 'package:rsi/resources/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuple/tuple.dart';

const URL_REQUEST = '/notifications';

class NotificationService {
  Future<String?> _getToken() async {
    return SharedPreferences.getInstance().then(
      (value) => value.getString("accessToken"),
    );
  }

  Future<String?> _getUserId() async {
    return SharedPreferences.getInstance().then(
      (value) => value.getString("userId"),
    );
  }

  Future<Tuple3<num?, num?, List<Notification>?>> fetchNotifications(
      bool seen) async {
    final token = await _getToken();
    final userId = await _getUserId();
    final res = await DioClient.getWithTokenParams(
        URL_REQUEST, {"userId": userId, "seen": seen}, token);
    final numOfNotification = res.data['total'];
    final numOfNewNotification = res.data['new'];
    final listOfNotifications = (res.data['details'] as List)
        .map(
          (dataNotification) => Notification.fromJson(dataNotification),
        )
        .toList();
    return Tuple3(numOfNotification, numOfNewNotification, listOfNotifications);
  }
}
