import 'package:rsi/models/models.dart';
import 'package:rsi/resources/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

const URL = '/project_entities';

class PitchService {
  Future<String?> _getToken() async {
    return SharedPreferences.getInstance()
        .then((value) => value.getString("accessToken"));
  }

//Fetch API except token
  Future<Pitch?> fetchPitchById(String id) async {
    final token = await _getToken();
    final res = await DioClient.getWithTokenById(URL, id, token);
    Pitch? pitch = Pitch.fromJson(res.data);
    return pitch;
  }
}
