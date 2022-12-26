import 'package:rsi/models/models.dart';
import 'package:rsi/resources/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

const URL = '/money_overview/investor';

class OverviewService {
  Future<String?> _getToken() async {
    return SharedPreferences.getInstance()
        .then((value) => value.getString("accessToken"));
  }

  Future<InvestorOverview?> fetchMoneyOverview() async {
    final token = await _getToken();
    final res = await DioClient.getWithToken(URL, token);
    InvestorOverview? overview = InvestorOverview.fromJson(res.data);
    return overview;
  }
}
