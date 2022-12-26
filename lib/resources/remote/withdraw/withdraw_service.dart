import 'package:rsi/models/models.dart';
import 'package:rsi/resources/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuple/tuple.dart';

const URL = '/withdraw_requests';

class WithdrawService {
  Future<String?> _getToken() async {
    return SharedPreferences.getInstance().then(
      (value) => value.getString("accessToken"),
    );
  }

  Future<WithdrawResponse?> postWithdrawRequest(WithdrawRequestPost req) async {
    final token = await _getToken();
    WithdrawResponse? postRes;
    final res = await DioClient.postWithToken(URL, req, token);
    postRes = WithdrawResponse.fromJson(res.data);
    return postRes;
  }

  Future<void> confirmWithdrawRequest(String withdrawRequestId) async {
    final token = await _getToken();
    await DioClient.putParamWithToken2(
        URL, {"action": "APPROVE"}, {"requestId": withdrawRequestId}, token);
  }

  Future<void> reportWithdrawRequest(
      String withdrawRequestId, String reportMessage) async {
    final token = await _getToken();
    await DioClient.putParamWithToken2(
        URL,
        {"action": "REPORT"},
        {"requestId": withdrawRequestId, "reportMessage": reportMessage},
        token);
  }

  Future<Tuple2<num, List<WithdrawRequest>?>> fetchWithdrawRequest(
      {Map<String, dynamic>? params}) async {
    final token = await _getToken();
    final res = await DioClient.getWithTokenParams(URL, params, token);
    final numOfWithdrawRequest = res.data["numOfWithdrawRequest"];
    final withdrawRequests = (res.data["listOfWithdrawRequest"] as List)
        .map(
          (dataWithdrawRequest) =>
              WithdrawRequest.fromJson(dataWithdrawRequest),
        )
        .toList();
    return Tuple2(numOfWithdrawRequest, withdrawRequests);
  }
}
