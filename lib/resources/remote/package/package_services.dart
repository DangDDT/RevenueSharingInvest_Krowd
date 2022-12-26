import 'package:rsi/models/models.dart';
import 'package:rsi/resources/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuple/tuple.dart';

const URL = '/packages/project';

class PackageService {
  Future<String?> _getToken() async {
    return SharedPreferences.getInstance().then(
      (value) => value.getString("accessToken"),
    );
  }

  Future<Tuple2<int?, List<Package>?>> fetchPackages(String projectId) async {
    final token = await _getToken();
    final res = await DioClient.getWithTokenById(URL, projectId, token);
    final numOfPackage = res.data['numOfPackage'];
    final listPackage = (res.data['listOfPackage'] as List)
        .map(
          (dataPackage) => Package.fromJson(dataPackage),
        )
        .toList();
    return Tuple2(numOfPackage, listPackage);
  }
}
