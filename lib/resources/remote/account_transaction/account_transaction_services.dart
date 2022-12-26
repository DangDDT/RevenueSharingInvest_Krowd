import 'package:rsi/models/models.dart';
import 'package:rsi/resources/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

const URL = '/account_transactions';

class AccountTransactionService {
  Future<String?> _getToken() async {
    return SharedPreferences.getInstance()
        .then((value) => value.getString("accessToken"));
  }

  Future<List<AccountTransaction>?> fetchAccountTransactions() async {
    final token = await _getToken();
    final res = await DioClient.getWithTokenParams(
        URL, {"pageIndex": 1, "pageSize": 10}, token);
    final listAccountTransaction =
        (res.data["listOfAccountTransaction"] as List)
            .map(
              (dataAccountTransaction) =>
                  AccountTransaction.fromJson(dataAccountTransaction),
            )
            .toList();
    return listAccountTransaction;
  }
}
