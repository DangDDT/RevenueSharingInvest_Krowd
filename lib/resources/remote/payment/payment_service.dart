import 'package:rsi/models/models.dart';
import 'package:rsi/resources/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuple/tuple.dart';

const URL = '/payments';

class PaymentService {
  Future<String?> _getToken() async {
    return SharedPreferences.getInstance().then(
      (value) => value.getString("accessToken"),
    );
  }

  Future<Tuple2<num, List<Payment>?>> fetchPeriodRevenuePaymentByProjectId({required String projectId}) async {
    final token = await _getToken();
    final res =
        await DioClient.getWithTokenByIdAndParam(URL + "/type", "PERIOD_REVENUE", {"projectId": projectId}, token);
    final numOfPayment = res.data["numOfPayment"];
    final listOfPeriodRevenuePayment = (res.data["listOfPeriodRevenuePayment"] as List)
        .map(
          (data) => Payment.fromJson(data),
        )
        .toList();
    return Tuple2(numOfPayment, listOfPeriodRevenuePayment);
  }
}
