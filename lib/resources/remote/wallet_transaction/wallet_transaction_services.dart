import 'package:rsi/models/models.dart';
import 'package:rsi/resources/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuple/tuple.dart';

const URL = '/wallet_transactions';

class WalletTransactionService {
  Future<String?> _getToken() async {
    return SharedPreferences.getInstance()
        .then((value) => value.getString("accessToken"));
  }

  Future<String?> _getUserId() async {
    return SharedPreferences.getInstance().then(
      (value) => value.getString("userId"),
    );
  }

  Future<List<WalletTransaction>?> fetchWalletTransactionsByWalletId(
      String walletId) async {
    final token = await _getToken();
    final res =
        await DioClient.getWithTokenParams(URL, {"walletId": walletId}, token);
    final listWalletTransaction = (res.data["listOfWalletTransaction"] as List)
        .map(
          (dataWalletTransaction) =>
              WalletTransaction.fromJson(dataWalletTransaction),
        )
        .toList();
    return listWalletTransaction;
  }

  Future<Tuple2<num?, List<WalletTransaction>?>>
      fetchWalletTransactionsByParams(
          {required Map<String, dynamic> params}) async {
    final token = await _getToken();
    final userId = await _getUserId();
    params.addEntries({"userId": userId}.entries);
    final res = await DioClient.getWithTokenParams(URL, params, token);
    final numOfWalletTransaction = res.data["numOfWalletTransaction"] as num;
    final listWalletTransaction = (res.data["listOfWalletTransaction"] as List)
        .map(
          (dataWalletTransaction) =>
              WalletTransaction.fromJson(dataWalletTransaction),
        )
        .toList();
    return Tuple2(numOfWalletTransaction, listWalletTransaction);
  }
}
