import 'package:rsi/models/models.dart';
import 'package:rsi/resources/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuple/tuple.dart';

const URL = '/bills/dailyReport';

class BillService {
  Future<String?> _getToken() async {
    return SharedPreferences.getInstance()
        .then((value) => value.getString("accessToken"));
  }

//Fetch API except token
  Future<Tuple2<int?, List<Bill>?>> fetchBills(
      {required String dailyReportId}) async {
    final token = await _getToken();
    final res = await DioClient.getWithTokenById(
      URL,
      dailyReportId,
      token,
    );
    final numOfBill = res.data['numOfBill'];
    final listOfBill = (res.data['listOfBill'] as List)
        .map(
          (dataBill) => Bill.fromJson(dataBill),
        )
        .toList();
    return Tuple2(numOfBill, listOfBill);
  }
}
