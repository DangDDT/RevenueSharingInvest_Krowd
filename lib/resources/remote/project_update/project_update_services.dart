import 'package:rsi/models/models.dart';
import 'package:rsi/resources/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

const URL = '/project_entities/project';

class ProjectUpdateService {
  Future<String?> _getToken() async {
    return SharedPreferences.getInstance()
        .then((value) => value.getString("accessToken"));
  }

  Future<List<ProjectUpdate>?> fetchProjectUpdate(String projectId) async {
    final token = await _getToken();
    final res = await DioClient.getWithTokenByIdAndParam(
        URL, projectId, {"type": "UPDATE"}, token);
    final listProjectUpdate = (res.data as List)
        .map(
          (dataUpdate) => ProjectUpdate.fromJson(dataUpdate),
        )
        .toList();
    return listProjectUpdate;
  }
}
