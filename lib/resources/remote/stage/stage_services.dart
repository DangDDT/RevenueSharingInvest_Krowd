import 'package:rsi/models/models.dart';
import 'package:rsi/resources/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuple/tuple.dart';

const URL_STAGE = '/stages/project';
const URL_STAGE_CHART = '/stages/chart';

class StageService {
  Future<String?> _getToken() async {
    return SharedPreferences.getInstance()
        .then((value) => value.getString("accessToken"));
  }

  Future<Tuple2<int?, List<Stage>?>> fetchStageByProjectId(
      String projectId) async {
    final token = await _getToken();
    final res = await DioClient.getWithTokenById(URL_STAGE, projectId, token);
    final numOfStage = res.data['numOfStage'];
    final listStage = (res.data['listOfStage'] as List)
        .map(
          (dataStage) => Stage.fromJson(dataStage),
        )
        .toList();
    return Tuple2(numOfStage, listStage);
  }

  Future<Tuple2<num?, List<StageReturn>?>> fetchReturnStageByProjectId(
      String projectId,
      {Map<String, dynamic>? params}) async {
    final token = await _getToken();
    final res = await DioClient.getWithTokenByIdAndParam(
        URL_STAGE, projectId, params, token);
    final numOfStage = res.data['numOfStage'];
    final listStage = (res.data['listOfStage'] as List)
        .map(
          (dataStage) => StageReturn.fromJson(dataStage),
        )
        .toList();
    return Tuple2(numOfStage, listStage);
  }

  Future<List<StageChart>?> fetchStageChartByProjectId(String projectId) async {
    final token = await _getToken();
    final res =
        await DioClient.getWithTokenById(URL_STAGE_CHART, projectId, token);
    final listStageChart = (res.data as List)
        .map(
          (dataStage) => StageChart.fromJson(dataStage),
        )
        .toList();
    return listStageChart;
  }
}
