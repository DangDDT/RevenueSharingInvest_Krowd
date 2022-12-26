import 'package:rsi/models/models.dart';
import 'package:rsi/resources/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuple/tuple.dart';

const URL = '/wallets';

class WalletService {
  Future<String?> _getToken() async {
    return SharedPreferences.getInstance()
        .then((value) => value.getString("accessToken"));
  }

  Future<num?> fetchTotalAsset() async {
    final token = await _getToken();
    final res = await DioClient.getWithTokenParams(URL, null, token);
    final totalAsset = res.data['totalAsset'];
    return totalAsset;
  }

  Future<TransferWalletResponse?> transfer(
      String fromWalletId, String toWalletId, num amount) async {
    final token = await _getToken();
    final req = <String, dynamic>{
      "fromWalletId": fromWalletId,
      "toWalletId": toWalletId,
      "amount": amount
    };
    dynamic res;
    try {
      res = await DioClient.putBodyWithToken(URL, req, token);
    } catch (e) {
      return null;
    }
    return res;
  }

  Future<Tuple2<double?, List<Wallet>?>> fetchWallets() async {
    final token = await _getToken();
    final res = await DioClient.getWithTokenParams(URL, null, token);
    dynamic totalAsset;
    dynamic listWallet;
    try {
      totalAsset = res.data['totalAsset'];
      listWallet = (res.data['listOfInvestorWallet'] as List)
          .map(
            (dataWallet) => Wallet.fromJson(dataWallet),
          )
          .toList();
    } catch (e) {}
    return Tuple2(totalAsset, listWallet);
  }
}
