import 'package:rsi/models/models.dart';
import 'package:rsi/resources/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuple/tuple.dart';

const URL = '/investments';

class InvestmentService {
  Future<String?> _getToken() async {
    return SharedPreferences.getInstance().then(
      (value) => value.getString("accessToken"),
    );
  }

  Future<InvestmentResponsePost> postInvestmentRequest(
      InvestmentRequestPost req) async {
    final token = await _getToken();
    final res = await DioClient.postWithToken(URL, req.toJson(), token);
    final iResP = InvestmentResponsePost.fromJson(res.data);
    return iResP;
  }

  Future<Tuple2<num?, List<Investment>?>> fetchInvestments(
      {Map<String, dynamic>? params}) async {
    final token = await _getToken();
    final res = await DioClient.getWithTokenParams(URL, params, token);
    final numOfInvestment = res.data['numOfInvestment'];
    final listInvestment = (res.data['listOfInvestment'] as List)
        .map(
          (dataInvestment) => Investment.fromJson(dataInvestment),
        )
        .toList();
    return Tuple2(numOfInvestment, listInvestment);
  }

  Future<bool> cancelInvestment(String investmentId) async {
    final token = await _getToken();
    final res = await DioClient.putParamWithToken(URL, investmentId, token);
    final resStatus = res.data;
    if (resStatus == 1)
      return true;
    else
      return false;
  }
}
