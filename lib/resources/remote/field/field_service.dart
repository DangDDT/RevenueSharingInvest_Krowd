import 'package:rsi/models/field/field.dart';
import 'package:rsi/resources/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuple/tuple.dart';

const URL = '/fields';

class FieldService {
  Future<String?> _getToken() async {
    return SharedPreferences.getInstance().then(
      (value) => value.getString("accessToken"),
    );
  }

  Future<Tuple2<num?, List<Field>?>> fetchFields() async {
    final token = await _getToken();
    final res = await DioClient.getWithToken(URL, token);
    final numOfField = res.data['numOfField'];
    final listOfField = (res.data['listOfField'] as List)
        .map(
          (dataField) => Field.fromJson(dataField),
        )
        .toList();
    return Tuple2(numOfField, listOfField);
  }
}
