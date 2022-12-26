import 'package:rsi/models/models.dart';
import 'package:rsi/resources/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuple/tuple.dart';

const URL = '/daily_reports/project';

class DailyReportService {
  Future<String?> _getToken() async {
    return SharedPreferences.getInstance()
        .then((value) => value.getString("accessToken"));
  }

//Fetch API except token
  Future<Tuple2<int?, List<DailyReport>?>> fetchDailyReport(
      {required String projectId, String? stageId}) async {
    final token = await _getToken();
    dynamic numOfDailyReport;
    dynamic listOfDailyReport;
    try {
      final res = await DioClient.getWithTokenByIdAndParam(
        URL,
        projectId,
        {"stageId": stageId},
        token,
      );
      numOfDailyReport = res.data['numOfDailyReport'];
      listOfDailyReport = (res.data['listOfDailyReport'] as List)
          .map(
            (dataDailyReport) => DailyReport.fromJson(dataDailyReport),
          )
          .toList();
      return Tuple2(numOfDailyReport, listOfDailyReport);
    } catch (e) {}
    return Tuple2(numOfDailyReport, listOfDailyReport);
  }
}
