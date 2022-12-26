import 'package:rsi/models/models.dart';
import 'package:rsi/resources/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

const URL_REQUEST = '/momo/request';

class TopupService {
  Future<String?> _getToken() async {
    return SharedPreferences.getInstance().then(
      (value) => value.getString("accessToken"),
    );
  }

  Future<MomoResponse?> callMomoTopup(MomoRequest req) async {
    final token = await _getToken();
    final res =
        await DioClient.postFormDataWithToken(URL_REQUEST, req.toJson(), token);
    final momoRes = MomoResponse.fromJson(res.data);
    return momoRes;
  }
}
