import 'package:rsi/models/models.dart';
import 'package:rsi/resources/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuple/tuple.dart';

const URL = '/projects';

class ProjectService {
  static const FETCH_LIMIT = 1;

  Future<String?> _getToken() async {
    return SharedPreferences.getInstance()
        .then((value) => value.getString("accessToken"));
  }

//Fetch API except token
  Future<Tuple2<num?, List<BasicProject>?>> fetchProjects(
      int page, String? fieldId) async {
    final token = await _getToken();
    final res = await DioClient.getWithTokenParams(
        URL,
        {
          'pageIndex': page,
          'pageSize': FETCH_LIMIT,
          'listFieldId': fieldId != null ? [fieldId] : [],
        },
        token);
    final numOfProject = (res.data['numOfProject']);
    final listProject = (res.data['listOfProject'] as List)
        .map(
          (dataProject) => BasicProject.fromJson(dataProject),
        )
        .toList();

    return Tuple2(numOfProject, listProject);
  }

//Fetch API except token
  Future<num?> fetchProjectCounter() async {
    final token = await _getToken();
    final res = await DioClient.getWithTokenParams(
      URL,
      {
        "countOnly": true,
      },
      token,
    );
    num? count = res.data["numOfProject"];
    return count;
  }

//Fetch API except token
  Future<ProjectDetail?> fetchProjectById(String id) async {
    final token = await _getToken();
    final res = await DioClient.getWithTokenById(URL, id, token);
    ProjectDetail? project = ProjectDetail.fromJson(res.data);
    return project;
  }

//Fetch API
  Future<Tuple2<int?, List<InvestedProject>?>> fetchInvestedProjects() async {
    final token = await _getToken();
    final res =
        await DioClient.getWithTokenParams("$URL/investedProject", null, token);
    final numOfProject = res.data['numOfProject'];
    final listProject = (res.data['listOfProject'] as List)
        .map(
          (dataProject) => InvestedProject.fromJson(dataProject),
        )
        .toList();
    return Tuple2(numOfProject, listProject);
  }

  Future<InvestedProjectDetail?> fetchInvestedProjectsById(
      String projectId) async {
    final token = await _getToken();
    final res = await DioClient.getWithTokenById(
        "$URL/investedProject", projectId, token);
    final project = InvestedProjectDetail.fromJson(res.data);
    return project;
  }
}
