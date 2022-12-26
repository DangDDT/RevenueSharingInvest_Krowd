import 'package:rsi/models/models.dart';
import 'package:rsi/resources/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

const URL = '/users';

class UserService {
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

  Future<User?> loadUserProfile() async {
    final token = await _getToken();
    final userId = await _getUserId();
    final res = await DioClient.getWithTokenById(URL, userId, token);
    final user = User.fromJson(res.data);
    return user;
  }

  Future<void> putUserProfile(User newUser) async {
    final token = await _getToken();
    final userId = await _getUserId();
    final mapUser = {
      "firstName": newUser.firstName,
      "lastName": newUser.lastName,
      "phoneNum": newUser.phoneNum,
      "dateOfBirth": newUser.dateOfBirth,
      "address": newUser.address,
      "taxIdentificationNumber": newUser.taxIdentificationNumber,
      "gender": newUser.gender,
      "idCard": newUser.idCard,
      "district": newUser.district,
      "city": newUser.city,
    };
    await DioClient.putFormDataWithToken("$URL/$userId", {}, mapUser, token);
  }
}
